import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
// import 'package:pointycastle/export.dart';
import 'package:asn1lib/asn1lib.dart';
import 'package:pointycastle/export.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
// import 'package:pointycastle/api.dart';
import 'package:remote_app/data/encrypt_public_key.dart';
import 'package:remote_app/data/constants/constants.dart';
import 'package:remote_app/src/generated/auth.pb.dart';
import 'package:remote_app/src/generated/keycodes.pb.dart';
import 'package:protobuf/protobuf.dart';
import 'package:remote_app/src/rsa_key_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:uuid/uuid.dart';
// import 'package:web_socket_channel/io.dart' show IOWebSocketChannel;
// import 'package:web_socket_channel/web_socket_channel.dart';

// Utility: generate secure random bytes
Uint8List randomBytes(int length) {
  final rnd = Random.secure();
  return Uint8List.fromList(
    List<int>.generate(length, (_) => rnd.nextInt(256)),
  );
}

class TvRemoteClient {
  final String host;

  String? _certPath;
  String? _keyPath;
  RSAPublicKey? _clientPublicKey;
  RSAPrivateKey? _clientPrivateKey;
  RSAPublicKey? _serverPublicKey;
  dynamic _envelope;
  SecureSocket? _pairingSocket;
  SecureSocket? _commandSocket;

  bool _isPaired = false;
  bool _isConnected = false;

  TvRemoteClient({required this.host});

  /// Initialize: Check for stored certificate or generate new one
  Future<bool> initialize() async {
    print('🔧 Initializing Android TV Remote...\n');

    final prefs = await SharedPreferences.getInstance();

    // Check if we have stored certificate
    final storedCert = prefs.getString('atv_cert_$host');
    final storedKey = prefs.getString('atv_key_$host');

    if (storedCert != null && storedKey != null) {
      print('✅ Found stored certificate\n');

      // Write to temp files
      _certPath = '${Directory.systemTemp.path}/atv_cert_$host.pem';
      _keyPath = '${Directory.systemTemp.path}/atv_key_$host.pem';

      await File(_certPath!).writeAsString(storedCert, flush: true);
      await File(_keyPath!).writeAsString(storedKey, flush: true);

      // Verify files were written correctly
      final certExists = await File(_certPath!).exists();
      final keyExists = await File(_keyPath!).exists();

      print('✅ Certificate file exists: $certExists');
      print('✅ Private key file exists: $keyExists');
      // Parse the certificate to extract public key
      await _extractKeysFromCert(storedCert, storedKey);

      _isPaired = true;
      return true;
    }

    print('📝 No stored certificate found. Generating new one...\n');
    await _generateClientCertificate();

    return false;
  }

  Future<void> startPairing() async {
    if (_isPaired) {
      print('⚠️  Already paired. Use connect() to authenticate.\n');
      return;
    }

    if (_certPath == null || _keyPath == null) {
      throw Exception('Certificate not initialized. Call initialize() first');
    }

    print('🔐 Starting pairing on $host:6467...\n');

    final context = SecurityContext()
      ..useCertificateChain(_certPath!)
      ..usePrivateKey(_keyPath!);

    try {
      _pairingSocket = await SecureSocket.connect(
        host,
        6467, // PAIRING PORT
        context: context,
        timeout: Duration(seconds: 10),
        onBadCertificate: (cert) {
          print('📜 Received server certificate\n');
          _serverPublicKey = _extractServerPublicKey(cert);
          return true;
        },
      );

      print('✅ Connected to pairing port\n');
      _pairingSocket!.listen(
        (data) => _handlePairingMessage(data),
        onError: (e) => print('❌ Pairing error: $e'),
        onDone: () => print('🔌 Pairing connection closed'),
      );
      // final handshake = OuterMessage()
      //   ..protocolVersion = 2
      //   ..status = 0;
      // _pairingSocket!.add(handshake.writeToBuffer());
      // await _pairingSocket!.flush();
      // _setupPairingListener();
      await Future.delayed(Duration(milliseconds: 500));

      _sendPairingRequest();
      // await Future.delayed(Duration(milliseconds: 500));
      // _sendPairingConfiguration();
      // _sendPairingOption();

      // Send pairing request using OuterMessage protocol
    } catch (e) {
      print('❌ Pairing connection failed: $e\n');
      rethrow;
    }
  }

  Future<void> _sendPairingRequest() async {
    print('📤 Sending PairingRequest...\n');
    final uuid = Uuid().v4();
    final String serviceUuid = uuid.replaceAll('-', '');
    final pairingRequest = PairingRequest()
      ..clientId = "$clientId:${uuid.replaceAll('-', '')}"
      ..clientName = clientName
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

    print('✅ Sent PairingRequest\n');
  }

  Future<void> _sendPairingOptionsInput() async {
    final options = PairingOptions()
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

    _pairingSocket!.add([...lenPrefix, ...payload]);
    await _pairingSocket!.flush();
  }

  // Step 3: Send PairingOptions AGAIN (SECOND message)
  // This time with OUTPUT encodings - YES, SEND IT TWICE!
  Future<void> _sendPairingOptionsOutput() async {
    final options = PairingOptions()
      ..outputEncodings.add(
        Encoding()
          ..type = Encoding_EncodingType.ENCODING_TYPE_HEXADECIMAL
          ..symbolLength = 6,
      )
      ..preferredRole = RoleType.ROLE_TYPE_OUTPUT;

    final outer = OuterMessage()
      ..protocolVersion = 2
      ..status = 200
      ..pairingOption = options;

    final payload = outer.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    _pairingSocket!.add([...lenPrefix, ...payload]);
    await _pairingSocket!.flush();

    print('TV should display PIN now!');
  }
  // Step 4: Send Pairing Secret (after user sees PIN on TV)
  // Future<void> _sendPairingSecret(String pin) async {
  //   // Hash the PIN with certificates
  //   final secretHash = await _computeSecretHash(pin);

  //   final secret = PairingSecret()
  //     ..secret = secretHash;

  //   final outer = OuterMessage()
  //     ..protocolVersion = 2
  //     ..status = 200
  //     ..pairingSecret = secret;

  //   final payload = outer.writeToBuffer();
  //   final lenPrefix = _encodeVarint(payload.length);

  //   _pairingSocket!.add([...lenPrefix, ...payload]);
  //   await _pairingSocket!.flush();

  //   print('✅ Sent PairingSecret');
  // }

  // Compute the secret hash as per protocol
  // Future<Uint8List> _computeSecretHash(String pin) async {
  //   // Extract RSA public keys from certificates
  //   final clientCert = _clientCertificate; // Your client certificate
  //   final serverCert = _serverCertificate; // Server certificate from TLS handshake

  //   // Parse certificates and get RSA public keys
  //   // (You'll need to extract modulus and exponent from both certs)

  //   final digest = crypto.sha256;
  //   final output = AccumulatorSink<crypto.Digest>();
  //   final input = digest.startChunkedConversion(output);

  //   // Add client modulus
  //   input.add(_clientModulus);
  //   // Add client exponent
  //   input.add(_clientExponent);
  //   // Add server modulus
  //   input.add(_serverModulus);
  //   // Add server exponent
  //   input.add(_serverExponent);

  //   // Add last 4 characters of PIN as bytes
  //   final pinLast4 = pin.substring(2, 6); // Characters at index 2-5
  //   final pinBytes = hex.decode(pinLast4);
  //   input.add(pinBytes);

  //   input.close();

  //   return Uint8List.fromList(output.events.single.bytes);
  // }

  // Future<void> sendKeyEvent(AndroidKeyCode keyCode, String description) async {
  //   final cmd = KeyEvent()
  //     ..code = keyCode
  //     ..description = description;

  //   final cmdBytes = cmd.writeToBuffer();

  //   // Encrypt using AES-GCM
  //   final cipher = crypto.AesGcm.with256bits();
  //   final box = await cipher.encrypt(
  //     cmdBytes,
  //     secretKey: _secretKey,
  //     nonce: _aesIv,
  //   );

  //   // Send encrypted payload
  //   _channel.sink.add(box.concatenation());
  // }
  List<int> _buffer = [];
  void _handlePairingMessage(Uint8List data) {
    print(
      '📥 Received ${data.length} bytes: ${data.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}',
    );

    // Add to buffer
    _buffer.addAll(data);
    _processBuffer();
  }

  void _processBuffer() {
    while (_buffer.isNotEmpty) {
      try {
        // Read varint length prefix
        int messageLength = 0;
        int shift = 0;
        int varintBytes = 0;

        // Parse the varint
        for (int i = 0; i < _buffer.length && i < 5; i++) {
          int byte = _buffer[i];
          messageLength |= (byte & 0x7F) << shift;
          varintBytes++;

          if ((byte & 0x80) == 0) {
            // Varint complete (bit 7 is not set)
            break;
          }
          shift += 7;
        }

        // Check if we have enough bytes for the complete message
        int totalBytesNeeded = varintBytes + messageLength;
        if (_buffer.length < totalBytesNeeded) {
          print(
            '⏳ Waiting for more data. Have ${_buffer.length}, need $totalBytesNeeded bytes',
          );
          return; // Wait for more data
        }

        // Extract the message
        final messageBytes = Uint8List.fromList(
          _buffer.sublist(varintBytes, varintBytes + messageLength),
        );

        print(
          '✂️ Extracted message: length=$messageLength, varintBytes=$varintBytes',
        );

        // Remove processed bytes from buffer
        _buffer = _buffer.sublist(totalBytesNeeded);

        // Parse protobuf
        final msg = OuterMessage.fromBuffer(messageBytes);

        // Handle the message
        _handleOuterMessage(msg);
      } catch (e, stackTrace) {
        print('⚠️ Error parsing message: $e');
        print(
          '   Buffer hex: ${_buffer.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}',
        );
        print(stackTrace);

        // Clear buffer on error to recover
        _buffer.clear();
        return;
      }
    }
  }

  void _handleOuterMessage(OuterMessage msg) {
    print('whichMessage  =====> ${msg.whichMessage()}');
    print('msg status  =====> ${msg.status}');

    switch (msg.whichMessage()) {
      case OuterMessage_Message.pairingResponse:
        print('🔐 Received PairingResponse');
        _sendPairingOption();
        // _sendPairingOptionsWithCrypto();
        // _sendPairingConfiguration();
        break;

      case OuterMessage_Message.pairingRequestAck:
        print('✅ PairingRequest ack acknowledged');
        break;
      case OuterMessage_Message.pairingConfigurationAck:
        print('✅ PairingConfiguration acknowledged');
        if (msg.pairingConfigurationAck.hasSelectedKeyExchange()) {
          print(
            '   Key exchange: ${msg.pairingConfigurationAck.selectedKeyExchange}',
          );
        }
        break;

      case OuterMessage_Message.pairingOption:
        print('✅ TV confirmed encoding settings');
        // print(
        //   'preferredKeyExchanges ${msg.pairingOption.preferredKeyExchanges}',
        // );
        // print(
        //   'preferredSecretExchanges ${msg.pairingOption.preferredSecretExchanges}',
        // );

        if (msg.pairingOption.outputEncodings.isNotEmpty) {
          final encoding = msg.pairingOption.outputEncodings.first;

          print(
            '   Encoding: ${encoding.type}, Length: ${encoding.symbolLength}',
          );
        }
        print('   Role: ${msg.pairingOption.preferredRole}');

        // Check the role the TV selected
        if (msg.pairingOption.preferredRole == RoleType.ROLE_TYPE_OUTPUT ||
            msg.pairingOption.preferredRole == RoleType.ROLE_TYPE_INPUT) {
          print('📺 PIN should be displayed on TV screen NOW!');
        }
        _sendPairingConfiguration();
        break;

      case OuterMessage_Message.pairingOptionAck:
        print('✅ PairingOptions acknowledged');
        print('📺 TV should display PIN now!');
        break;

      case OuterMessage_Message.secretResponse:
        if (msg.secretResponse.status == 200) {
          print('🎉 Pairing successful!');
        } else {
          print('❌ Pairing failed: ${msg.secretResponse.status}');
        }
        break;

      case OuterMessage_Message.notSet:
        if (msg.status == 400) {
          print('❌ Error 400 - Bad request');
        } else if (msg.status == 200) {
          print('✅ Empty 200 acknowledgment');
        }
        break;

      default:
        print('⚠️ Unknown message: ${msg.whichMessage()}');
    }
  }

  Future<void> _onPairingComplete() async {
    _isPaired = true;

    // Store certificate for future use
    final prefs = await SharedPreferences.getInstance();
    final certContent = await File(_certPath!).readAsString();
    final keyContent = await File(_keyPath!).readAsString();

    await prefs.setString('atv_cert_$host', certContent);
    await prefs.setString('atv_key_$host', keyContent);

    print('💾 Certificate stored for future use\n');

    _pairingSocket?.close();
    _pairingSocket = null;
  }

  Uint8List _computePairingSecret(String pin) {
    // Hash: client_modulus + client_exponent + server_modulus + server_exponent + gamma
    // gamma = last 4 chars of PIN converted to bytes

    final clientMod = _removeLeadingZeros(
      _bigIntToBytes(_clientPublicKey!.modulus!),
    );
    final clientExp = _removeLeadingZeros(
      _bigIntToBytes(_clientPublicKey!.exponent!),
    );
    final serverMod = _removeLeadingZeros(
      _bigIntToBytes(_serverPublicKey!.modulus!),
    );
    final serverExp = _removeLeadingZeros(
      _bigIntToBytes(_serverPublicKey!.exponent!),
    );

    // Get last 4 characters of PIN and convert hex to bytes
    final gamma = pin.substring(2, 6);
    final gammaBytes = _hexToBytes(gamma);

    final input = BytesBuilder()
      ..add(clientMod)
      ..add(clientExp)
      ..add(serverMod)
      ..add(serverExp)
      ..add(gammaBytes);

    final digest = sha256.convert(input.toBytes());
    return Uint8List.fromList(digest.bytes);
  }

  Future<void> enterPairingCode(String pin) async {
    // Compute SHA-256 hash as per protocol
    final secret = _computePairingSecret(pin);

    final secretMsg = PairingSecret()..secret = secret;

    final outerMessage = OuterMessage()
      ..protocolVersion = 1
      ..status = 200
      ..pairingSecret = secretMsg;

    final bytes = outerMessage.writeToBuffer();
    _pairingSocket!.add(bytes);
    await _pairingSocket!.flush();

    print('✅ Sent pairing secret\n');
  }

  // Send Options instead of Configuration!
  Future<void> _sendPairingOptionsWithCrypto() async {
    print('📤 Sending PairingConfiguration (Crypto Negotiation)...\n');

    final options = PairingOptions()
      // 1. Send Crypto Prefs
      // ..preferredKeyExchanges.add(KeyExchange.ECDH_P256)
      // ..preferredSecretExchanges.add(SecretExchange.HMAC_SHA256)
      ..inputEncodings.add(
        Encoding()
          ..type = Encoding_EncodingType.ENCODING_TYPE_HEXADECIMAL
          ..symbolLength = 6,
      )
      // Add output encoding (same as input)
      // ..outputEncodings.add(
      //   Encoding()
      //     ..type = Encoding_EncodingType.ENCODING_TYPE_HEXADECIMAL
      //     ..symbolLength = 6,
      // )
      ..preferredRole = RoleType.ROLE_TYPE_INPUT;

    final outerMessage = OuterMessage()
      ..protocolVersion = 2
      ..status = 200
      ..pairingOption = options;
    final payload = outerMessage.writeToBuffer();
    final lengthPrefix = encodeVarint(payload.length);
    final messageToSend = [...lengthPrefix, ...payload];
    _pairingSocket!.add(messageToSend);
    // send with 4-byte big-endian length prefix as you already do

    _pairingSocket!.add(messageToSend);
    await _pairingSocket!.flush();

    print('✅ Sent PairingOptionWithConfig\n');
    // ... (use your correct 4-byte prefix logic to send the message)
  }

  Future<void> _sendPairingConfiguration() async {
    final config = PairingConfiguration()
      ..preferredKeyExchanges.add(KeyExchange.X25519)
      ..preferredSecretExchanges.add(SecretExchange.HMAC_SHA256)
      ..clientRole = RoleType.ROLE_TYPE_OUTPUT;

    final outer = OuterMessage()
      ..protocolVersion = 2
      ..status = 200
      ..pairingConfiguration = config;

    final payload = outer.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    print('📤 Sending PairingConfiguration...');
    _pairingSocket!.add([...lenPrefix, ...payload]);
    await _pairingSocket!.flush();
    print('✅ Sent PairingConfiguration');
  }

  Future<void> _sendPairingOption() async {
    final options = PairingOptions()
      // Add input encoding
      ..inputEncodings.add(
        Encoding()
          ..type = Encoding_EncodingType.ENCODING_TYPE_HEXADECIMAL
          ..symbolLength = 6,
      )
      // Add output encoding (same as input)
      // ..outputEncodings.add(
      //   Encoding()
      //     ..type = Encoding_EncodingType.ENCODING_TYPE_HEXADECIMAL
      //     ..symbolLength = 6,
      // )
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

  Future<void> connect() async {
    if (!_isPaired) {
      throw Exception('Not paired. Call startPairing() first');
    }

    if (_isConnected) {
      print('⚠️  Already connected\n');
      return;
    }

    print('🔐 Connecting to $host:6466 (command port)...\n');

    final context = SecurityContext()
      ..useCertificateChain(_certPath!)
      ..usePrivateKey(_keyPath!);

    try {
      _commandSocket = await SecureSocket.connect(
        host,
        6466, // COMMAND PORT
        context: context,
        timeout: Duration(seconds: 10),
        onBadCertificate: (cert) => true,
      );

      print('✅ Connected to command port\n');

      _setupCommandListener();
      _isConnected = true;

      // Wait for initial device info
      await Future.delayed(Duration(milliseconds: 500));
    } catch (e) {
      print('❌ Command connection failed: $e\n');
      rethrow;
    }
  }

  void _setupCommandListener() {
    _commandSocket!.listen(
      (data) => _handleCommandMessage(data),
      onError: (e) {
        print('❌ Command error: $e');
        _isConnected = false;
      },
      onDone: () {
        print('🔌 Command connection closed');
        _isConnected = false;
      },
    );
  }

  void _handleCommandMessage(Uint8List data) {
    try {
      // Parse as OuterMessage (command protocol)
      final message = OuterMessage.fromBuffer(data);

      // if (message.hasRemoteDeviceInfo()) {
      //   final info = message.remoteDeviceInfo;
      //   print('📺 Device: ${info.model} by ${info.vendor}\n');
      // }

      // Handle other message types as needed
    } catch (e) {
      print('⚠️  Error parsing command message: $e');
    }
  }

  Future<void> _generateClientCertificate() async {
    print('🔑 Generating RSA key pair...\n');

    final rsaParams = RSAKeyGeneratorParameters(
      BigInt.parse('65537'),
      2048,
      64,
    );
    final random = FortunaRandom();
    final seed = Uint8List.fromList(
      List.generate(32, (i) => Random.secure().nextInt(256)),
    );
    random.seed(KeyParameter(seed));

    final keyGen = RSAKeyGenerator()
      ..init(ParametersWithRandom(rsaParams, random));
    final keyPair = keyGen.generateKeyPair();

    _clientPublicKey = keyPair.publicKey as RSAPublicKey;
    _clientPrivateKey = keyPair.privateKey as RSAPrivateKey;

    // Generate certificate
    final certPem = _generateX509Certificate();
    final keyPem = _generatePrivateKeyPEM();

    // Save to temp files
    _certPath = '${Directory.systemTemp.path}/atv_cert_$host.pem';
    _keyPath = '${Directory.systemTemp.path}/atv_key_$host.pem';

    // await File(_certPath!).writeAsString(certPem);
    // await File(_keyPath!).writeAsString(keyPem);
    await File(_certPath!).writeAsString(certPem, flush: true);
    await File(_keyPath!).writeAsString(keyPem, flush: true);

    print('✅ Generated certificate and key\n');
  }

  Future<void> _extractKeysFromCert(String certPem, String keyPem) async {
    print('🔑 Extracting keys from stored certificate...\n');

    try {
      // Extract private key from PEM
      _clientPrivateKey = CryptoUtils.rsaPrivateKeyFromPem(keyPem);
      print('✅ Extracted private key\n');

      // Extract public key from certificate
      final x509Cert = X509Utils.x509CertificateFromPem(certPem);
      final pubKeyData = x509Cert.tbsCertificate!.subjectPublicKeyInfo.bytes;

      _clientPublicKey = _parsePublicKey(pubKeyData!);
      print('✅ Extracted public key from certificate\n');
    } catch (e) {
      print('❌ Error extracting keys: $e\n');
      rethrow;
    }
  }

  String _generateX509Certificate() {
    // Build TBSCertificate (To Be Signed Certificate)
    final tbsCertificate = ASN1Sequence();

    // Version (v3 = 2, wrapped in context tag [0])
    final version = ASN1Sequence(tag: 0xA0);
    version.add(ASN1Integer(BigInt.from(2)));
    tbsCertificate.add(version);

    // Serial Number
    final serialNumber = BigInt.from(DateTime.now().millisecondsSinceEpoch);
    tbsCertificate.add(ASN1Integer(serialNumber));

    // Signature Algorithm
    final signatureAlgorithm = ASN1Sequence();
    signatureAlgorithm.add(
      ASN1ObjectIdentifier([1, 2, 840, 113549, 1, 1, 11]),
    ); // sha256WithRSAEncryption
    signatureAlgorithm.add(ASN1Null());
    tbsCertificate.add(signatureAlgorithm);

    // Issuer (CN=atvremote)
    final issuer = _buildDistinguishedName('atvremote');
    tbsCertificate.add(issuer);

    // Validity
    final now = DateTime.now().toUtc();
    final notAfter = now.add(Duration(days: 3650));
    final validity = ASN1Sequence();
    validity.add(ASN1UtcTime(now));
    validity.add(ASN1UtcTime(notAfter));
    tbsCertificate.add(validity);

    // Subject (same as Issuer for self-signed)
    tbsCertificate.add(issuer);

    // SubjectPublicKeyInfo
    final subjectPublicKeyInfo = _buildPublicKeyInfo();
    tbsCertificate.add(subjectPublicKeyInfo);

    // Extensions (optional, but good to have for v3)
    final extensions = _buildExtensions();
    tbsCertificate.add(extensions);

    // Encode TBSCertificate
    final tbsBytes = tbsCertificate.encodedBytes;

    // Sign the TBSCertificate
    final signature = _signData(tbsBytes);

    // Build final Certificate
    final certificate = ASN1Sequence();
    certificate.add(tbsCertificate);
    certificate.add(signatureAlgorithm);
    certificate.add(ASN1BitString(signature));

    // Encode and convert to PEM
    final certBytes = certificate.encodedBytes;
    return _toPem(certBytes, 'CERTIFICATE');
  }

  ASN1Sequence _buildDistinguishedName(String commonName) {
    final dn = ASN1Sequence();

    // Add CN (Common Name)
    final cnSet = ASN1Set();
    final cnSequence = ASN1Sequence();
    cnSequence.add(ASN1ObjectIdentifier([2, 5, 4, 3])); // CN OID
    cnSequence.add(ASN1UTF8String(commonName));
    cnSet.add(cnSequence);
    dn.add(cnSet);

    return dn;
  }

  ASN1Sequence _buildPublicKeyInfo() {
    final publicKeySeq = ASN1Sequence();

    // Algorithm Identifier
    final algorithmSeq = ASN1Sequence();
    algorithmSeq.add(
      ASN1ObjectIdentifier([1, 2, 840, 113549, 1, 1, 1]),
    ); // rsaEncryption
    algorithmSeq.add(ASN1Null());
    publicKeySeq.add(algorithmSeq);

    // Public Key
    final publicKeyInnerSeq = ASN1Sequence();
    publicKeyInnerSeq.add(ASN1Integer(_clientPublicKey!.modulus!));
    publicKeyInnerSeq.add(ASN1Integer(_clientPublicKey!.exponent!));

    final publicKeyBitString = ASN1BitString(publicKeyInnerSeq.encodedBytes);
    publicKeySeq.add(publicKeyBitString);

    return publicKeySeq;
  }

  ASN1Sequence _buildExtensions() {
    // Extensions with context tag [3]
    final extensionsWrapper = ASN1Sequence(tag: 0xA3);
    final extensions = ASN1Sequence();

    // Basic Constraints (CA:FALSE)
    final basicConstraints = ASN1Sequence();
    basicConstraints.add(
      ASN1ObjectIdentifier([2, 5, 29, 19]),
    ); // basicConstraints OID
    final basicConstraintsValue = ASN1Sequence();
    basicConstraintsValue.add(ASN1Boolean(false)); // CA:FALSE
    basicConstraints.add(ASN1OctetString(basicConstraintsValue.encodedBytes));
    extensions.add(basicConstraints);

    // Key Usage (Digital Signature, Key Encipherment)
    final keyUsage = ASN1Sequence();
    keyUsage.add(ASN1ObjectIdentifier([2, 5, 29, 15])); // keyUsage OID
    keyUsage.add(ASN1Boolean(true)); // Critical
    // Key usage bits: digitalSignature (0), keyEncipherment (2)
    final keyUsageBits = Uint8List.fromList([0xA0]); // 10100000 in binary
    final keyUsageValue = ASN1BitString(keyUsageBits, unusedbits: 3);
    keyUsage.add(ASN1OctetString(keyUsageValue.encodedBytes));
    extensions.add(keyUsage);

    extensionsWrapper.add(extensions);
    return extensionsWrapper;
  }

  Uint8List _signData(Uint8List data) {
    final signer = RSASigner(SHA256Digest(), '0609608648016503040201');
    signer.init(true, PrivateKeyParameter<RSAPrivateKey>(_clientPrivateKey!));
    final signature = signer.generateSignature(data);
    return signature.bytes;
  }

  String _generatePrivateKeyPEM() {
    final privateKeySeq = ASN1Sequence();
    privateKeySeq.add(ASN1Integer(BigInt.zero)); // version = 0

    privateKeySeq.add(ASN1Integer(_clientPrivateKey!.modulus!));
    privateKeySeq.add(ASN1Integer(_clientPrivateKey!.publicExponent!));
    privateKeySeq.add(ASN1Integer(_clientPrivateKey!.privateExponent!));
    privateKeySeq.add(ASN1Integer(_clientPrivateKey!.p!));
    privateKeySeq.add(ASN1Integer(_clientPrivateKey!.q!));

    final exp1 =
        _clientPrivateKey!.privateExponent! %
        (_clientPrivateKey!.p! - BigInt.one);
    privateKeySeq.add(ASN1Integer(exp1));

    final exp2 =
        _clientPrivateKey!.privateExponent! %
        (_clientPrivateKey!.q! - BigInt.one);
    privateKeySeq.add(ASN1Integer(exp2));

    final coefficient = _clientPrivateKey!.q!.modInverse(_clientPrivateKey!.p!);
    privateKeySeq.add(ASN1Integer(coefficient));

    // Encode the ASN.1 sequence (this is PKCS#1 DER)
    final pkcs1Bytes = privateKeySeq.encodedBytes;
    final base64String = base64.encode(pkcs1Bytes);

    // Wrap in PEM header/footer
    final buffer = StringBuffer();
    buffer.writeln('-----BEGIN RSA PRIVATE KEY-----');

    for (var i = 0; i < base64String.length; i += 64) {
      final end = (i + 64 < base64String.length) ? i + 64 : base64String.length;
      buffer.writeln(base64String.substring(i, end));
    }

    buffer.write('-----END RSA PRIVATE KEY-----');

    return buffer.toString();
  }

  String _toPem(Uint8List bytes, String label) {
    final base64String = base64.encode(bytes);
    final lines = <String>[];

    // Split into 64-character lines
    for (var i = 0; i < base64String.length; i += 64) {
      final end = (i + 64 < base64String.length) ? i + 64 : base64String.length;
      lines.add(base64String.substring(i, end));
    }

    return '-----BEGIN $label-----\n${lines.join('\n')}\n-----END $label-----';
  }

  RSAPublicKey _extractServerPublicKey(X509Certificate cert) {
    try {
      // _envelope = createPairingSecretEnvelope(serverPublicKeyBytes: cert.der);

      final parsed = X509Utils.x509CertificateFromPem(cert.pem);

      final pubKeyData = parsed.tbsCertificate!.subjectPublicKeyInfo; // type
      final key = _parsePublicKey(pubKeyData.bytes!);

      return key;
    } catch (e, st) {
      print('Error extracting server public key: $e\n$st');
      rethrow;
    }
  }

  // Helper to chunk base64 into 64 char lines
  String _chunk64(String input) {
    final buffer = StringBuffer();
    for (var i = 0; i < input.length; i += 64) {
      buffer.writeln(
        input.substring(i, i + 64 > input.length ? input.length : i + 64),
      );
    }
    return buffer.toString();
  }

  RSAPublicKey _parsePublicKey(String pem) {
    final parser = RSAKeyParser();
    return parser.parse(pem) as RSAPublicKey;
  }
}

Uint8List _bigIntToBytes(BigInt bigInt) {
  var hex = bigInt.toRadixString(16);
  if (hex.length % 2 != 0) hex = '0$hex';
  return Uint8List.fromList(
    List.generate(
      hex.length ~/ 2,
      (i) => int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16),
    ),
  );
}

Uint8List _removeLeadingZeros(Uint8List bytes) {
  int start = 0;
  while (start < bytes.length && bytes[start] == 0) {
    start++;
  }
  return bytes.sublist(start);
}

Uint8List _hexToBytes(String hex) {
  return Uint8List.fromList(
    List.generate(
      hex.length ~/ 2,
      (i) => int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16),
    ),
  );
}

Uint8List extractEcPointFromPemCert(Uint8List der) {
  // DER of full certificate

  // Parse top-level certificate sequence
  final topParser = ASN1Parser(der);
  final topSeq = topParser.nextObject() as ASN1Sequence;
  // topSeq: [ tbsCertificate, signatureAlgorithm, signatureValue ]
  if (topSeq.elements.isEmpty) {
    throw StateError('Invalid certificate ASN.1 structure');
  }

  // tbsCertificate is the first element
  final tbs = topSeq.elements[0];
  if (tbs is! ASN1Sequence) {
    throw StateError('Unexpected tbsCertificate structure');
  }
  final tbsSeq = tbs;

  // Search inside tbsSequence for a child that is a SubjectPublicKeyInfo:
  // SubjectPublicKeyInfo is SEQUENCE { algorithm, subjectPublicKey BIT STRING }
  ASN1Sequence? spkiSeq;
  for (final el in tbsSeq.elements) {
    if (el is ASN1Sequence &&
        el.elements.length >= 2 &&
        el.elements[1] is ASN1BitString) {
      spkiSeq = el;
      break;
    }
  }

  // fallback: common position index for subjectPublicKeyInfo (usually near the end)
  if (spkiSeq == null) {
    // many certs place subjectPublicKeyInfo at index 6; try that defensively
    final idx = 6;
    if (tbsSeq.elements.length > idx && tbsSeq.elements[idx] is ASN1Sequence) {
      final maybe = tbsSeq.elements[idx] as ASN1Sequence;
      if (maybe.elements.length >= 2 && maybe.elements![1] is ASN1BitString) {
        spkiSeq = maybe;
      }
    }
  }

  if (spkiSeq == null) {
    throw StateError('Could not locate SubjectPublicKeyInfo in certificate');
  }

  final bitString = spkiSeq.elements![1] as ASN1BitString;
  final pubBytes = bitString.valueBytes();

  // Normalize: some encoders include a leading 0x00 padding in the BIT STRING. Remove it.
  final normalized = (pubBytes.isNotEmpty && pubBytes[0] == 0x00)
      ? pubBytes.sublist(1)
      : pubBytes;

  // At this point normalized should be the EC point in uncompressed form: 0x04 || X || Y
  if (normalized.length != 65 || normalized[0] != 0x04) {
    // If compressed form or other length, try to handle compressed -> uncompressed is non-trivial here.
    throw StateError(
      'Unexpected EC public key format: length=${normalized.length}',
    );
  }

  return Uint8List.fromList(normalized);
}

Uint8List encodeVarint(int value) {
  final bytes = <int>[];
  var v = value;
  do {
    var byte = v & 0x7F; // Get the lowest 7 bits
    v = v >>> 7; // Unsigned shift right by 7

    // If there are more bits left, set the Continuation Bit (MSB)
    if (v != 0) {
      byte |= 0x80;
    }

    bytes.add(byte);
  } while (v != 0);

  return Uint8List.fromList(bytes);
}
