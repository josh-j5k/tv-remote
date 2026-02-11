import 'dart:io';
import 'dart:typed_data';
import 'package:android_tv_remote/core/services/tv_certificate.dart';
import 'package:android_tv_remote/core/services/tv_pairing_response_handler.dart';
import 'package:android_tv_remote/src/generated/auth.pb.dart';
import 'package:android_tv_remote/data/constants/constants.dart';
import 'package:pointycastle/export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:android_tv_remote/core/utils/encode_varint.dart';
import 'package:uuid/uuid.dart';

class TvPairing {
  final String host;
  final RSAPublicKey clientPublicKey;
  final String certPath;
  final String keyPath;
  final bool mounted;
  final dynamic context;
  SecureSocket? _pairingSocket;
  String? _deviceId;
  RSAPublicKey? _serverPublicKey;
  TvPairing({
    required this.host,
    required this.clientPublicKey,
    required this.certPath,
    required this.keyPath,
    required this.context,
    required this.mounted,
  });
  final certificate = TvCertificate();

  Future<void> startPairing(
    // bool isPaired,
    // Function(Uint8List data) handleSocketMessage,
  ) async {
    final tvPairingResponseHandler = TvPairingResponseHandler(
      sendPairingOption: sendPairingOption,
      sendPairingConfiguration: sendPairingConfiguration,
      sendPairingSecret: sendPairingSecret,
      onPairingComplete: onPairingComplete,
      mounted: mounted,
      context: context,
    );
    final securityContent = SecurityContext(withTrustedRoots: false)
      ..useCertificateChain(certPath)
      ..usePrivateKey(keyPath);

    try {
      _pairingSocket = await SecureSocket.connect(
        host,
        6467, // PAIRING PORT
        context: securityContent,
        timeout: Duration(seconds: 10),
        onBadCertificate: (cert) {
          _serverPublicKey = certificate.extractServerPublicKey(cert);
          return true;
        },
      );
      _pairingSocket!.listen(
        (data) => tvPairingResponseHandler.handleSocketMessage(data),
        onError: (e) => print("Pairing Error $e \n"),
        onDone: () => print('🔌 Pairing connection closed'),
      );

      await Future.delayed(Duration(milliseconds: 500));
      sendPairingRequest();
    } catch (e) {
      // showErrorSnackbar(e.toString(), context);
      print('❌ Pairing connection failed: $e\n');
      rethrow;
    }
  }

  Future<void> sendPairingRequest() async {
    print('📤 Sending PairingRequest...\n');
    final uuid = Uuid().v4();
    final String serviceUuid = uuid.replaceAll('-', '');
    final pairingRequest = PairingRequest()
      ..clientId = "$clientId:${uuid.replaceAll('-', '')}"
      ..clientName = "$clientName-$_deviceId"
      ..serviceName = serviceName
      ..serviceUuid = serviceUuid;

    final outerMessage = OuterMessage()
      ..protocolVersion = 2
      ..status = 200
      ..pairingRequest = pairingRequest;

    final payload = outerMessage.writeToBuffer();

    final lenPrefix = encodeVarint(payload.length);
    _pairingSocket!.add([...lenPrefix, ...payload]);

    await _pairingSocket!.flush();

    // print('✅ Sent PairingRequest\n');
  }

  Future<void> sendPairingConfiguration() async {
    final config = PairingConfiguration()
      ..encoding =
          (Encoding()
            ..type = Encoding_EncodingType
                .ENCODING_TYPE_HEXADECIMAL // What TV chose
            ..symbolLength = 6) // What TV chose
      ..clientRole = RoleType.ROLE_TYPE_INPUT; // You will INPUT the PIN

    final outer = OuterMessage()
      ..protocolVersion = 2
      ..status =
          200 // Your TV requires this
      ..pairingConfiguration = config;

    final payload = outer.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    print('📤 Sending PairingConfiguration with encoding...');
    print(
      '   Bytes: ${[...lenPrefix, ...payload].map((b) => b.toRadixString(16)).join(' ')}',
    );

    _pairingSocket!.add([...lenPrefix, ...payload]);
    await _pairingSocket!.flush();
  }

  Future<void> sendPairingOption() async {
    final options = PairingOptions()
      // Add input encoding
      ..inputEncodings.add(
        Encoding()
          ..type = Encoding_EncodingType.ENCODING_TYPE_HEXADECIMAL
          ..symbolLength = 6,
      )
      ..preferredRole = RoleType.ROLE_TYPE_INPUT;

    final outer = OuterMessage()
      ..protocolVersion = 2
      ..status = 200
      ..pairingOption = options;

    final payload = outer.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    print('📤 Sending PairingOptions...');

    _pairingSocket!.add([...lenPrefix, ...payload]);
    await _pairingSocket!.flush();
    print('✅ Sent PairingOptions');
  }

  // Step 4: Send Pairing Secret (after user sees PIN on TV)
  Future<void> sendPairingSecret(String pin) async {
    final encodedSecret = await _encodeSecret(pin);

    final secret = PairingSecret()..secret = encodedSecret;

    final outer = OuterMessage()
      ..protocolVersion = 2
      ..status =
          200 // Your TV requires this
      ..pairingSecret = secret;

    final payload = outer.writeToBuffer();

    final lenPrefix = encodeVarint(payload.length);

    _pairingSocket!.add([...lenPrefix, ...payload]);
    await _pairingSocket!.flush();
    print('✅ Sent PairingSecret');
  }

  Future<void> onPairingComplete() async {
    // Store certificate for future use
    final prefs = await SharedPreferences.getInstance();
    final certContent = await File(certPath).readAsString();
    final keyContent = await File(keyPath).readAsString();

    await prefs.setString('atv_cert_$host', certContent);
    await prefs.setString('atv_key_$host', keyContent);

    print('💾 Certificate stored for future use\n');

    _pairingSocket?.close();
    _pairingSocket = null;
    // await connect();
  }

  Future<List<int>> _encodeSecret(String pin) async {
    if (!RegExp(r'^[0-9A-F]{6}$').hasMatch(pin)) {
      throw FormatException(
        'Invalid PIN format. Expected 6 hexadecimal characters (0-9, A-F), got: "$pin"',
      );
    }
    // Get modulus and exponent as HEX strings (no leading zeros removed!)
    final clientModHex = clientPublicKey.modulus!.toRadixString(16);
    final clientExpHex = clientPublicKey.exponent!.toRadixString(16);
    final serverModHex = _serverPublicKey!.modulus!.toRadixString(16);
    final serverExpHex = _serverPublicKey!.exponent!.toRadixString(16);

    final clientModBytes = _hexToBytes(clientModHex);
    final clientExpBytes = _hexToBytes(clientExpHex);
    final serverModBytes = _hexToBytes(serverModHex);
    final serverExpBytes = _hexToBytes(serverExpHex);

    final digest = SHA256Digest();
    digest.update(Uint8List.fromList(clientModBytes), 0, clientModBytes.length);
    digest.update(Uint8List.fromList(clientExpBytes), 0, clientExpBytes.length);
    digest.update(Uint8List.fromList(serverModBytes), 0, serverModBytes.length);
    digest.update(Uint8List.fromList(serverExpBytes), 0, serverExpBytes.length);

    // Last 4 hex characters of PIN
    final gamma = pin.substring(2); // "2DD950" -> "D950"
    final gammaBytes = _hexToBytes(gamma);

    digest.update(Uint8List.fromList(gammaBytes), 0, gammaBytes.length);

    // Compute hash
    final hash = Uint8List(digest.digestSize);
    digest.doFinal(hash, 0);

    return hash.toList();
  }
}

List<int> _hexToBytes(String hex) {
  if (hex.length % 2 != 0) {
    hex = '0$hex';
  }

  final result = <int>[];
  for (var i = 0; i < hex.length; i += 2) {
    result.add(int.parse(hex.substring(i, i + 2), radix: 16));
  }
  return result;
}
