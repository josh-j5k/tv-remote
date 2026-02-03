import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:asn1lib/asn1lib.dart';
import 'package:pointycastle/export.dart';
import 'package:remote_app/data/constants/constants.dart';
import 'package:remote_app/src/generated/auth.pb.dart';
import 'package:remote_app/src/generated/keycodes.pb.dart';
import 'package:remote_app/src/rsa_key_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:uuid/uuid.dart';

class TvRemoteClient {
  final String host;
  final void Function(OuterMessage)? handleMessage;

  String? _certPath;
  String? _keyPath;
  RSAPublicKey? _clientPublicKey;
  RSAPrivateKey? _clientPrivateKey;
  RSAPublicKey? _serverPublicKey;
  SecureSocket? _pairingSocket;
  SecureSocket? _commandSocket;
  bool _isPaired = false;
  bool _isConnected = false;
  TvRemoteClient({required this.host, this.handleMessage});

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

      // Parse the certificate to extract public key
      await _extractKeysFromCert(storedCert, storedKey);

      _isPaired = true;
      return true;
    }

    print('📝 No stored certificate found. Generating new one...\n');
    await _generateClientCertificate();

    return false;
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

    final context = SecurityContext(withTrustedRoots: false)
      ..useCertificateChain(_certPath!)
      ..usePrivateKey(_keyPath!)
      ..setTrustedCertificates(_certPath!);

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

  Future<void> startPairing() async {
    if (_isPaired) {
      print('⚠️  Already paired. Use connect() to authenticate.\n');
      return;
    }

    if (_certPath == null || _keyPath == null) {
      throw Exception('Certificate not initialized. Call initialize() first');
    }

    print('🔐 Starting pairing on $host:6467...\n');

    final context = SecurityContext(withTrustedRoots: false)
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
      print(_serverPublicKey);
      _pairingSocket!.listen(
        (data) => handleSocketMessage(data),
        onError: (e) => print('❌ Pairing error: $e'),
        onDone: () => print('🔌 Pairing connection closed'),
      );

      await Future.delayed(Duration(milliseconds: 500));

      sendPairingRequest();

      // Send pairing request using OuterMessage protocol
    } catch (e) {
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
    print('\n📊 Secret Details:');
    print('   PIN: $pin');
    print('   Secret length: ${encodedSecret.length} bytes (should be 32)');
    print(
      '   Secret hex: ${encodedSecret.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}',
    );

    final secret = PairingSecret()..secret = encodedSecret;

    final outer = OuterMessage()
      ..protocolVersion = 2
      ..status =
          200 // Your TV requires this
      ..pairingSecret = secret;
    print('\n🔍 OuterMessage check:');
    print('   Has pairingSecret: ${outer.hasPairingSecret()}');
    print('   Protocol version: ${outer.protocolVersion}');
    print('   Status: ${outer.status}');
    final payload = outer.writeToBuffer();
    print('\n📤 Full OuterMessage payload:');
    print('   Length: ${payload.length} bytes');
    print(
      '   Bytes: ${payload.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}',
    );

    final lenPrefix = encodeVarint(payload.length);
    print('\n📏 Length prefix:');
    print(
      '   Bytes: ${lenPrefix.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}',
    );
    print('\n📨 Complete message to send:');
    print('   Total length: ${[...lenPrefix, ...payload].length} bytes');
    print(
      '   Bytes: ${[...lenPrefix, ...payload].map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}',
    );

    print('\n📤 Sending PairingSecret...');
    print('📤 Sending Secret message:');
    print('Pin: $pin');
    print('   Total bytes: ${payload.length}');
    print(
      '   Hex: ${payload.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}',
    );
    print('   lenPrefix: $lenPrefix');

    print('   First 50 bytes: ${payload.take(50).toList()}\n');
    _pairingSocket!.add([...lenPrefix, ...payload]);
    await _pairingSocket!.flush();
    print('✅ Sent PairingSecret');
  }

  List<int> _buffer = [];
  void handleSocketMessage(Uint8List data) {
    // print(
    //   '📥 Received ${data.length} bytes: ${data.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}',
    // );
    _buffer.addAll(data);
    // Add to buffer
    _processBuffer();
  }

  Future<void> _processBuffer() async {
    while (_buffer.isNotEmpty) {
      try {
        if (_isPaired) {
          int messageLength = 0;
          int shift = 0;
          int varintBytes = 0;

          for (int i = 0; i < _buffer.length && i < 5; i++) {
            int byte = _buffer[i];
            messageLength |= (byte & 0x7F) << shift;
            varintBytes++;

            if ((byte & 0x80) == 0) {
              break; // Varint complete
            }
            shift += 7;
          }

          int totalBytesNeeded = varintBytes + messageLength;
          if (_buffer.length < totalBytesNeeded) {
            // print(
            //   '⏳ Waiting for more data. Have ${_buffer.length}, need $totalBytesNeeded bytes',
            // );
            return;
          }

          final messageBytes = Uint8List.fromList(
            _buffer.sublist(varintBytes, varintBytes + messageLength),
          );

          // print(
          //   '✂️ Extracted command message: length=$messageLength, varintBytes=$varintBytes',
          // );
          // print(
          //   '   First 50 bytes: ${messageBytes.take(50).map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}',
          // );
          try {
            final msg = RemoteMessage.fromBuffer(messageBytes);
            // print('✅ Successfully parsed RemoteMessage');
            _handleCommandMessage(msg);
          } catch (e, stackTrace) {
            print('❌ Failed to parse RemoteMessage: $e');
            print('   Stack trace: $stackTrace');
            // Print the problematic bytes for debugging
            print(
              '   Problematic message: ${messageBytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}',
            );
          }

          // Remove processed bytes
          _buffer = _buffer.sublist(totalBytesNeeded);
          return;
        } else {
          // Port 6467: Has varint length prefix
          int messageLength = 0;
          int shift = 0;
          int varintBytes = 0;

          for (int i = 0; i < _buffer.length && i < 5; i++) {
            int byte = _buffer[i];
            messageLength |= (byte & 0x7F) << shift;
            varintBytes++;

            if ((byte & 0x80) == 0) {
              break;
            }
            shift += 7;
          }

          int totalBytesNeeded = varintBytes + messageLength;
          if (_buffer.length < totalBytesNeeded) {
            // print(
            //   '⏳ Waiting for more data. Have ${_buffer.length}, need $totalBytesNeeded bytes',
            // );
            return;
          }

          final messageBytes = Uint8List.fromList(
            _buffer.sublist(varintBytes, varintBytes + messageLength),
          );

          // print(
          //   '✂️ Extracted pairing message: length=$messageLength, varintBytes=$varintBytes',
          // );

          _buffer = _buffer.sublist(totalBytesNeeded);

          final msg = OuterMessage.fromBuffer(messageBytes);
          handleMessage!(msg);
        }
      } catch (e, stackTrace) {
        print('⚠️ Error in buffer processing: $e');
        print('Stack trace: $stackTrace');
        _buffer.clear();
        return;
      }
    }
  }

  Future<void> onPairingComplete() async {
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
    // await connect();
  }

  Future<void> _sendClientConfiguration() async {
    // First configuration message
    final deviceInfo = RemoteDeviceInfo()
      ..model = "Remote App"
      ..vendor = "Dart Client"
      ..unknown1 = 1
      ..unknown2 = "1"
      ..packageName = "androidtv-remote"
      ..appVersion = "1.0.0";

    final configure = RemoteConfigure()
      ..code1 =
          622 // This is the magic value (8, 238, 4 in bytes)
      ..deviceInfo = deviceInfo;

    final message = RemoteMessage()..remoteConfigure = configure;

    final payload = message.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    print('📤 Sending client configuration...');
    print('   Payload length: ${payload.length}');

    _commandSocket!.add([...lenPrefix, ...payload]);
    await _commandSocket!.flush();
    print('✅ Sent client configuration');
  }

  Future<void> _sendSecondConfiguration() async {
    // Second configuration message
    final setActive = RemoteSetActive()..active = 622; // 8, 238, 4 as varint

    final message = RemoteMessage()..remoteSetActive = setActive;

    final payload = message.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    print('📤 Sending second configuration...');
    _commandSocket!.add([...lenPrefix, ...payload]);
    await _commandSocket!.flush();

    print('✅ Ready to send commands!');
  }

  void _setupCommandListener() {
    _commandSocket!.listen(
      (data) => handleSocketMessage(data),
      onError: (e) {
        print('❌ Command error: $e');
        _isConnected = false;
      },
      onDone: () {
        print('🔌 Command connection closed');
        _commandSocket = null;
        _isConnected = false;
      },
      cancelOnError: false,
    );
  }

  int _lastPingVal1 = 0;
  int _lastPingVal2 = 0;
  int _imeCounter = 0;
  int _imeFieldCounter = 0;
  void _handleCommandMessage(RemoteMessage msg) {
    print('📥 Command message received');
    if (msg.hasRemoteConfigure()) {
      _sendClientConfiguration();
    } else if (msg.hasRemotePingRequest()) {
      print('   Type: RemotePingRequest');
      _lastPingVal1 = msg.remotePingRequest.val1;
      _lastPingVal2 = msg.remotePingRequest.val2;

      _sendPong();
    } else if (msg.hasRemoteSetActive()) {
      print('   Type: RemoteSetActive');
      _sendSecondConfiguration();
    } else if (msg.hasRemoteError()) {
      print('   Type: RemoteError ⚠️');
      print('   Error code: ${msg.remoteError.errorCode}');
      print('   Error message: ${msg.remoteError.errorMessage.toString()}');
    } else if (msg.hasRemoteImeBatchEdit()) {
      _imeCounter = msg.remoteImeBatchEdit.imeCounter;
      _imeFieldCounter = msg.remoteImeBatchEdit.fieldCounter;
      msg.remoteImeBatchEdit.editInfo.forEach((edit) {
        print('   imeCounter: ${msg.remoteImeBatchEdit.imeCounter}');
        print('   fieldCounter: ${msg.remoteImeBatchEdit.fieldCounter}');
        print('   Insert: ${edit.insert}');
        if (edit.hasTextFieldStatus()) {
          print(
            '   TextField value: ${edit.textFieldStatus.value} (start: ${edit.textFieldStatus.start}, end: ${edit.textFieldStatus.end})',
          );
        }
      });
    } else {
      print('   Unknown message type');
      // Print raw bytes to debug
      print('   Message fields: ${msg.toString()}');
    }
  }

  Future<void> sendKeyCommand(RemoteKeyInject_RemoteKeyCode keyCode) async {
    if (_commandSocket == null) {
      print('❌ Not connected to command port');
      return;
    }

    await sendKeyShortPress(keyCode);
  }

  /// Send key with PRESSED direction
  Future<void> sendKeyPress(RemoteKeyInject_RemoteKeyCode keyCode) async {
    final message = RemoteMessage()
      ..remoteKeyInject = (RemoteKeyInject()
        ..keyCode = keyCode
        ..direction = RemoteDirection.PRESSED);

    final payload = message.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    _commandSocket!.add([...lenPrefix, ...payload]);
    await _commandSocket!.flush();
  }

  /// Send key with RELEASED direction
  Future<void> sendKeyRelease(RemoteKeyInject_RemoteKeyCode keyCode) async {
    final message = RemoteMessage()
      ..remoteKeyInject = (RemoteKeyInject()
        ..keyCode = keyCode
        ..direction = RemoteDirection.RELEASED);

    final payload = message.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    _commandSocket!.add([...lenPrefix, ...payload]);
    await _commandSocket!.flush();
  }

  /// Send key with SHORT_PRESS direction (complete press and release in one message)
  Future<void> sendKeyShortPress(RemoteKeyInject_RemoteKeyCode keyCode) async {
    final message = RemoteMessage()
      ..remoteKeyInject = (RemoteKeyInject()
        ..keyCode = keyCode
        ..direction = RemoteDirection.SHORT_PRESS);

    final payload = message.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    _commandSocket!.add([...lenPrefix, ...payload]);
    await _commandSocket!.flush();
  }

  Future<void> sendText(String text) async {
    if (_commandSocket == null) {
      return;
    }
    if (!_isConnected) {
      return;
    }
    print('⌨️ Sending text: "$text"');
    print('  normal imeCounter: ${_imeCounter}');
    print('  normal fieldCounter: ${_imeFieldCounter}');
    // final message = RemoteMessage();
    int paramValue = text.length - 1;
    final imeObject = RemoteImeObject()
      ..start = 0
      ..end = text.length
      ..value = text;
    final editInfo = RemoteEditInfo()
      ..insert = 1
      ..textFieldStatus = imeObject;
    final batchEdit = RemoteImeBatchEdit()
      ..imeCounter = _imeCounter
      ..fieldCounter = _imeFieldCounter
      ..editInfo.add(editInfo);
    final message = RemoteMessage()..remoteImeBatchEdit = batchEdit;

    final payload = message.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);
    _commandSocket!.add([...lenPrefix, ...payload]);
    await _commandSocket!.flush();

    print('✅ Text sent');
    // message.remoteImeBatchEdit.mergeFromMessage(batchEdit);
  }

  Future<void> _sendPong() async {
    final pong = RemoteMessage()
      ..remotePingResponse = (RemotePingResponse()
        ..val1 = _lastPingVal1); // Echo back val1 only!

    final payload = pong.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    // INCLUDE length prefix for pong!
    _commandSocket!.add([...lenPrefix, ...payload]);
    await _commandSocket!.flush();
  }

  // Launch an app (e.g., Netflix)
  Future<void> launchApp(String deeplink) async {
    if (_commandSocket == null) {
      return;
    }
    if (!_isConnected) {
      return;
    }
    if (Uri.parse(deeplink).scheme.isEmpty) {
      deeplink = "market://launch?id=$deeplink";
    }
    final appMessage = RemoteMessage()
      ..remoteAppLinkLaunchRequest = (RemoteAppLinkLaunchRequest()
        ..appLink = deeplink);

    final payload = appMessage.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    _commandSocket!.add([...lenPrefix, ...payload]);
    await _commandSocket!.flush();

    print('✅ Launched app: $deeplink');
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

    await File(_certPath!).writeAsString(certPem, flush: true);
    await File(_keyPath!).writeAsString(keyPem, flush: true);

    print('✅ Generated certificate and key\n');
  }

  Future<void> _extractKeysFromCert(String certPem, String keyPem) async {
    print('🔑 Extracting keys from stored certificate...\n');
    try {
      // Extract private key from PEM
      _clientPrivateKey = _parsePrivateKeyFromPem(keyPem);
      print('✅ Extracted private key\n');

      // Extract public key from certificate
      final parsed = X509Utils.x509CertificateFromPem(certPem);

      final pubKeyData = parsed.tbsCertificate!.subjectPublicKeyInfo; // type
      final key = _parsePublicKey(pubKeyData.bytes!);

      _clientPublicKey = key;
      print('✅ Extracted public key from certificate\n');
    } catch (e, st) {
      print('❌ Error extracting keys: $e');
      print('Stack trace: $st\n');

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
      final parsed = X509Utils.x509CertificateFromPem(cert.pem);

      final pubKeyData = parsed.tbsCertificate!.subjectPublicKeyInfo; // type
      final key = _parsePublicKey(pubKeyData.bytes!);

      return key;
    } catch (e, st) {
      print('Error extracting server public key: $e\n$st');
      rethrow;
    }
  }

  RSAPublicKey _parsePublicKey(String pem) {
    final parser = RSAKeyParser();
    return parser.parse(pem) as RSAPublicKey;
  }

  Future<List<int>> _encodeSecret(String pin) async {
    if (!RegExp(r'^[0-9A-F]{6}$').hasMatch(pin)) {
      throw FormatException(
        'Invalid PIN format. Expected 6 hexadecimal characters (0-9, A-F), got: "$pin"',
      );
    }
    // Get modulus and exponent as HEX strings (no leading zeros removed!)
    final clientModHex = _clientPublicKey!.modulus!.toRadixString(16);
    final clientExpHex = _clientPublicKey!.exponent!.toRadixString(16);
    final serverModHex = _serverPublicKey!.modulus!.toRadixString(16);
    final serverExpHex = _serverPublicKey!.exponent!.toRadixString(16);

    print('Hex string lengths:');
    print('   Client modulus: ${clientModHex.length} hex chars');
    print('   Client exponent: ${clientExpHex.length} hex chars');
    print('   Server modulus: ${serverModHex.length} hex chars');
    print('   Server exponent: ${serverExpHex.length} hex chars\n');

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

    print('📌 PIN: $pin');
    print('📌 Gamma (last 4 chars): $gamma');
    print(
      '📌 Gamma bytes: ${gammaBytes.map((b) => '0x${b.toRadixString(16).padLeft(2, '0')}').join(' ')}\n',
    );

    digest.update(Uint8List.fromList(gammaBytes), 0, gammaBytes.length);

    // Compute hash
    final hash = Uint8List(digest.digestSize);
    digest.doFinal(hash, 0);

    print(
      '✅ Computed hash first byte: 0x${hash[0].toRadixString(16).padLeft(2, '0')} (${hash[0]})',
    );
    print(
      '📌 PIN first byte should be: 0x${pin.substring(0, 2)} (${int.parse(pin.substring(0, 2), radix: 16)})\n',
    );

    // Validate
    final expectedFirstByte = int.parse(pin.substring(0, 2), radix: 16);
    if (hash[0] != expectedFirstByte) {
      print('❌ HASH VALIDATION FAILED! First byte mismatch!\n');
    } else {
      print('✅ Hash validation passed!\n');
    }
    return hash.toList();
  }
}

RSAPrivateKey _parsePrivateKeyFromPem(String keyPem) {
  // Remove PEM headers and decode base64
  final keyContent = keyPem
      .replaceAll('-----BEGIN RSA PRIVATE KEY-----', '')
      .replaceAll('-----END RSA PRIVATE KEY-----', '')
      .replaceAll('-----BEGIN PRIVATE KEY-----', '')
      .replaceAll('-----END PRIVATE KEY-----', '')
      .replaceAll('\n', '')
      .replaceAll('\r', '')
      .trim();

  final keyBytes = base64.decode(keyContent);

  // Parse ASN.1 structure
  final asn1Parser = ASN1Parser(keyBytes);
  final topLevelSeq = asn1Parser.nextObject() as ASN1Sequence;

  // PKCS#1 RSAPrivateKey has 9 elements
  // PKCS#8 PrivateKeyInfo has 3 elements
  if (topLevelSeq.elements.length == 9) {
    // PKCS#1 format
    return _parsePKCS1PrivateKey(topLevelSeq);
  } else if (topLevelSeq.elements.length == 3) {
    // PKCS#8 format - extract the inner PKCS#1 key
    final privateKeyOctetString = topLevelSeq.elements[2] as ASN1OctetString;
    final innerParser = ASN1Parser(privateKeyOctetString.octets);
    final innerSeq = innerParser.nextObject() as ASN1Sequence;
    return _parsePKCS1PrivateKey(innerSeq);
  } else {
    throw FormatException('Unknown private key format');
  }
}

RSAPrivateKey _parsePKCS1PrivateKey(ASN1Sequence sequence) {
  // PKCS#1 RSAPrivateKey structure:
  // version, modulus, publicExponent, privateExponent, prime1, prime2, exp1, exp2, coefficient
  final modulus = (sequence.elements[1] as ASN1Integer).valueAsBigInteger;
  final privateExponent =
      (sequence.elements[3] as ASN1Integer).valueAsBigInteger;
  final p = (sequence.elements[4] as ASN1Integer).valueAsBigInteger;
  final q = (sequence.elements[5] as ASN1Integer).valueAsBigInteger;

  return RSAPrivateKey(modulus, privateExponent, p, q);
}

// Uint8List _bigIntToBytes(BigInt bigInt) {
//   var hex = bigInt.toRadixString(16);
//   if (hex.length % 2 != 0) {
//     hex = '0$hex';
//   }

//   return Uint8List.fromList(
//     List.generate(
//       hex.length ~/ 2,
//       (i) => int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16),
//     ),
//   );
// }

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
