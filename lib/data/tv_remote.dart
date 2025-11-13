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

class TvRemoteClient {
  final String host;
  final void Function(OuterMessage) handleMessage;

  String? _certPath;
  String? _keyPath;
  RSAPublicKey? _clientPublicKey;
  RSAPrivateKey? _clientPrivateKey;
  RSAPublicKey? _serverPublicKey;
  SecureSocket? _pairingSocket;
  SecureSocket? _commandSocket;
  bool _isPaired = false;
  bool _isConnected = false;
  dynamic secret;
  TvRemoteClient({required this.host, required this.handleMessage});

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

  // Step 4: Send Pairing Secret (after user sees PIN on TV)
  Future<void> sendPairingSecret(String pin) async {
    final encodedSecret = await _encodeSecret(pin);

    // Store this for command port later
    //  final _sharedSecret = Uint8List.fromList(encodedSecret);

    final secret = PairingSecret()..secret = encodedSecret;

    final outer = OuterMessage()
      ..protocolVersion = 2
      ..status =
          200 // Your TV requires this
      ..pairingSecret = secret;

    final payload = outer.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    print('📤 Sending PairingSecret...');
    print('   PIN: $pin');

    print(
      '   Bytes: ${[...lenPrefix, ...payload].map((b) => b.toRadixString(16)).join(' ')}',
    );

    _pairingSocket!.add([...lenPrefix, ...payload]);
    await _pairingSocket!.flush();
    print('✅ Sent PairingSecret');
  }

  List<int> _buffer = [];
  List<int> _commandBuffer = [];
  void handleSocketMessage(Uint8List data) {
    print(
      '📥 Received ${data.length} bytes: ${data.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}',
    );
    _buffer.addAll(data);
    // Add to buffer
    _processBuffer();
  }

  Future<void> _processBuffer() async {
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

        // Remove processed bytes from _buffer
        _buffer = _buffer.sublist(totalBytesNeeded);
        if (_isPaired) {
          final msg = RemoteMessage.fromBuffer(messageBytes);
          _handleCommandMessage(msg);
        } else {
          final msg = OuterMessage.fromBuffer(messageBytes);
          handleMessage(msg);
        }
      } catch (e, stackTrace) {
        print('⚠️ Error parsing message: $e');
        print(
          '   Buffer hex: ${_buffer.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}',
        );
        print(stackTrace);

        // Clear _buffer on error to recover
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
  }

  Future<void> _sendClientConfiguration() async {
    // First configuration message
    final configure = RemoteConfigure()
      ..code1 =
          622 // 8, 238, 4 as varint
      ..deviceInfo = (RemoteDeviceInfo()
        ..model = 1
        ..vendor = "1"
        ..unknown1 = 1
        ..unknown2 = "1"
        ..packageName = "androidtv-remote"
        ..appVersion = "1.0.0");

    final message = RemoteMessage()..remoteConfigure = configure;

    final payload = message.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    print('📤 Sending client configuration...');
    _commandSocket!.add([...lenPrefix, ...payload]);
    await _commandSocket!.flush();

    // Wait for response, then send second config
    // await Future.delayed(Duration(milliseconds: 100));
    // _sendSecondConfiguration();
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

  void _setupCommandListener() {
    _commandSocket!.listen(
      (data) => handleSocketMessage(data),
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

  void _handleCommandMessage(RemoteMessage msg) {
    // Handle different message types
    print('📥 Command message received');

    // Handle different message types
    if (msg.hasRemoteConfigure()) {
      print('   Type: RemoteConfigure (TV config info)');
      print('   Model: ${msg.remoteConfigure.deviceInfo.model}');
      print('   Vendor: ${msg.remoteConfigure.deviceInfo.vendor}');
      print('   Package: ${msg.remoteConfigure.deviceInfo.packageName}');

      // Send client configuration in response
      _sendClientConfiguration();
    } else if (msg.hasRemotePingRequest()) {
      print('   Type: RemotePingRequest (Keep-alive)');
      _sendPong();
    } else if (msg.hasRemoteSetActive()) {
      print('   Type: RemoteSetActive');
      // Send second configuration
      _sendSecondConfiguration();
    }
    // Handle other messages...
  }

  Future<void> sendKeyCommand(RemoteKeyInject_RemoteKeyCode keyCode) async {
    if (_commandSocket == null) {
      print('❌ Not connected to command port');
      return;
    }

    // Send key press
    final pressMessage = RemoteMessage()
      ..remoteKeyInject = (RemoteKeyInject()
        ..keyCode = keyCode
        ..direction = RemoteDirection.PRESSED);

    final pressPayload = pressMessage.writeToBuffer();
    final pressLen = encodeVarint(pressPayload.length);

    _commandSocket!.add([...pressLen, ...pressPayload]);
    await _commandSocket!.flush();

    // Small delay
    await Future.delayed(Duration(milliseconds: 50));

    // Send key release
    final releaseMessage = RemoteMessage()
      ..remoteKeyInject = (RemoteKeyInject()
        ..keyCode = keyCode
        ..direction = RemoteDirection.RELEASED);

    final releasePayload = releaseMessage.writeToBuffer();
    final releaseLen = encodeVarint(releasePayload.length);

    _commandSocket!.add([...releaseLen, ...releasePayload]);
    await _commandSocket!.flush();

    print('✅ Sent key command: $keyCode');
  }

  Future<void> _sendPong() async {
    final pong = RemoteMessage()
      ..remotePingResponse = (RemotePingResponse()..val1 = 25);

    final payload = pong.writeToBuffer();
    // NO length prefix for pong
    _commandSocket!.add(payload);
    await _commandSocket!.flush();
  }

  // Launch an app (e.g., Netflix)
  Future<void> launchApp(String deeplink) async {
    final appMessage = RemoteMessage()
      ..remoteStartApp = (RemoteStartApp()..intentUri = deeplink);

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

  RSAPublicKey _parsePublicKey(String pem) {
    final parser = RSAKeyParser();
    return parser.parse(pem) as RSAPublicKey;
  }

  Future<List<int>> _encodeSecret(String pin) async {
    if (pin.length != 6) {
      throw Exception('PIN must be exactly 6 hex characters');
    }

    if (!RegExp(r'^[0-9A-Fa-f]+$').hasMatch(pin)) {
      throw Exception('PIN must be hexadecimal characters only');
    }
    // Use SHA-256
    final digest = SHA256Digest();

    // Get modulus and exponent as byte arrays
    final clientModulus = _removeLeadingZeros(
      _bigIntToBytes(_clientPublicKey!.modulus!),
    );
    final clientExponent = _removeLeadingZeros(
      _bigIntToBytes(_clientPublicKey!.exponent!),
    );
    final serverModulus = _removeLeadingZeros(
      _bigIntToBytes(_serverPublicKey!.modulus!),
    );
    final serverExponent = _removeLeadingZeros(
      _bigIntToBytes(_serverPublicKey!.exponent!),
    );

    print('🔐 Hash inputs:');
    print(
      '   Client modulus: ${clientModulus.map((b) => b.toRadixString(16)).join(' ')}',
    );
    print(
      '   Client exponent: ${clientExponent.map((b) => b.toRadixString(16)).join(' ')}',
    );
    print(
      '   Server modulus: ${serverModulus.map((b) => b.toRadixString(16)).join(' ')}',
    );
    print(
      '   Server exponent: ${serverExponent.map((b) => b.toRadixString(16)).join(' ')}',
    );

    // Update SHA-256 hash in order
    digest.update(Uint8List.fromList(clientModulus), 0, clientModulus.length);
    digest.update(Uint8List.fromList(clientExponent), 0, clientExponent.length);
    digest.update(Uint8List.fromList(serverModulus), 0, serverModulus.length);
    digest.update(Uint8List.fromList(serverExponent), 0, serverExponent.length);

    // Add last 4 characters of the PIN (hex to bytes)
    // PIN is 6 chars like "A1B2C3" -> use last 4 chars "B2C3"
    final last4Chars = pin.substring(2, 6);
    final pinBytes = _hexStringToBytes(last4Chars);
    print(
      '   Nonce (last 4 chars): ${pinBytes.map((b) => b.toRadixString(16)).join(' ')}',
    );

    digest.update(Uint8List.fromList(pinBytes), 0, pinBytes.length);

    // Compute final hash
    final hash = Uint8List(digest.digestSize);
    digest.doFinal(hash, 0);

    print(
      '✅ Encoded secret: ${hash.map((b) => b.toRadixString(16)).join(' ')}',
    );

    return hash.toList(); // This is 32 bytes (SHA-256)
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
// Uint8List _bigIntToBytes(BigInt number) {
//   var bytes = <int>[];
//   var temp = number;

//   while (temp > BigInt.zero) {
//     bytes.insert(0, (temp & BigInt.from(0xff)).toInt());
//     temp = temp >> 8;
//   }

//   return Uint8List.fromList(bytes.isEmpty ? [0] : bytes);
// }

Uint8List _removeLeadingZeros(Uint8List bytes) {
  int start = 0;
  while (start < bytes.length && bytes[start] == 0) {
    start++;
  }

  return bytes.sublist(start);
}

List<int> _hexStringToBytes(String hex) {
  // Remove any spaces or special characters
  hex = hex.replaceAll(RegExp(r'\s+'), '').toUpperCase();

  // Validate it's a valid hex string
  if (!RegExp(r'^[0-9A-F]+$').hasMatch(hex)) {
    throw Exception('Invalid hex string: must contain only 0-9 and A-F');
  }

  // Must be even length (each byte is 2 hex chars)
  if (hex.length % 2 != 0) {
    throw Exception('Hex string must have even length');
  }

  // Convert hex string to bytes: "B2C3" -> [0xB2, 0xC3]
  final bytes = <int>[];
  for (int i = 0; i < hex.length; i += 2) {
    bytes.add(int.parse(hex.substring(i, i + 2), radix: 16));
  }

  return bytes;
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
