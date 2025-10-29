import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
// import 'package:pointycastle/export.dart';
import 'package:asn1lib/asn1lib.dart';
import 'package:pointycastle/export.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:pointycastle/api.dart';
import 'package:cryptography/cryptography.dart' as crypto;
import 'package:remote_app/data/constants/constants.dart';
import 'package:remote_app/src/generated/auth.pb.dart';
import 'package:remote_app/src/generated/keycodes.pb.dart';
import 'package:remote_app/src/rsa_key_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:web_socket_channel/io.dart' show IOWebSocketChannel;
import 'package:web_socket_channel/web_socket_channel.dart';

// Utility: generate secure random bytes
Uint8List randomBytes(int length) {
  final rnd = Random.secure();
  return Uint8List.fromList(
    List<int>.generate(length, (_) => rnd.nextInt(256)),
  );
}

class TvRemoteClient {
  final String host;
  final String clientName;

  String? _certPath;
  String? _keyPath;
  RSAPublicKey? _clientPublicKey;
  RSAPrivateKey? _clientPrivateKey;
  RSAPublicKey? _serverPublicKey;

  SecureSocket? _pairingSocket;
  SecureSocket? _commandSocket;

  bool _isPaired = false;
  bool _isConnected = false;

  TvRemoteClient({required this.host, this.clientName = client});

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

  // Future<void> connectAndAuthenticate() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? secret;
  //   final appData = prefs.getString('app_data');
  //   if (appData != null) {
  //     secret = jsonDecode(appData)['secret'];
  //   }

  //   // print(wsUrl);
  //   // _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
  //   final url = 'ws://192.168.1.185:6467';

  //   _channel = await SecureSocket.connect(
  //     host,
  //     6467, // PAIRING PORT
  //     context: context,
  //     timeout: Duration(seconds: 10),
  //     onBadCertificate: (cert) {
  //       print('📜 Received server certificate\n');
  //       _serverPublicKey = _extractServerPublicKey(cert);
  //       return true;
  //     },
  //   );
  //   print("WebSocket connected");

  //   // Set up listener FIRST before sending anything
  //   _channel.stream.listen(
  //     (data) {
  //       print("Received data: ${(data as Uint8List).length} bytes");

  //       try {
  //         final remoteMessage = RemoteMessage.fromBuffer(data);

  //         if (remoteMessage.hasPairingResponse()) {
  //           final pairingResp = remoteMessage.pairingResponse;
  //           print("Pairing Response Status: ${pairingResp.status}");

  //           if (pairingResp.status == 201) {
  //             print("✅ Waiting for PIN on TV screen");
  //             // PIN should now be displayed on TV
  //             // Now prompt user to enter the PIN
  //           } else if (pairingResp.status == 200) {
  //             print("✅ Pairing successful!");
  //           } else {
  //             print("❌ Pairing failed with status: ${pairingResp.status}");
  //           }
  //         }

  //         if (remoteMessage.hasRemoteError()) {
  //           print("❌ Error: ${remoteMessage.remoteError.errorCode}");
  //         }
  //       } catch (e) {
  //         print("Error parsing response: $e");
  //       }
  //     },
  //     onError: (error) {
  //       print("Stream error: $error");
  //     },
  //     onDone: () {
  //       print("Stream closed");
  //     },
  //   );

  //   // Wait a moment for listener to be ready
  //   await Future.delayed(Duration(milliseconds: 100));

  //   // NOW send the pairing request
  //   final pairingReq = PairingRequest()
  //     ..clientId = clientId
  //     ..clientName = client;

  //   final remoteMessage = RemoteMessage()..pairingRequest = pairingReq;

  //   _channel.sink.add(remoteMessage.writeToBuffer());
  //   print("Sent PairingRequest");
  //   // 1. Generate AES session key & IV
  //   _aesKey = randomBytes(32); // 256-bit
  //   _aesIv = randomBytes(12); // AES-GCM IV
  //   _secretKey = crypto.SecretKey(_aesKey);

  //   // 2. Encrypt AES key using RSA-OAEP
  //   final rsaCipher = RSAEngine()
  //     ..init(
  //       true,
  //       PublicKeyParameter<RSAPublicKey>(_parsePublicKey(serverPublicKeyPem)),
  //     );

  //   final sessionBlob = Uint8List.fromList([..._aesKey, ..._aesIv]);
  //   final encryptedSessionKey = rsaCipher.process(sessionBlob);

  //   // 3. Build protobuf AuthRequest
  //   final req = AuthRequest()
  //     ..encryptedSessionKey = encryptedSessionKey
  //     ..clientNonce = randomBytes(12)
  //     ..clientId = "tv_remote"
  //     ..ts = Int64(DateTime.now().millisecondsSinceEpoch);

  //   // 4. Send protobuf bytes over WebSocket
  //   final data = req.writeToBuffer();

  //   _channel.sink.add(data);
  //   await _channel.sink.done;
  //   // 5. Wait for AuthResponse
  //   final responseBytes = await _channel.stream.first as Uint8List;
  //   final resp = AuthResponse.fromBuffer(responseBytes);

  //   // 6. Decrypt AES-GCM payload
  //   final cipher = crypto.AesGcm.with256bits();
  //   final decrypted = await cipher.decrypt(
  //     crypto.SecretBox(
  //       resp.aesCiphertext,
  //       nonce: _aesIv,
  //       mac: crypto.Mac(resp.aesTag),
  //     ),
  //     secretKey: _secretKey,
  //   );

  //   print("Decrypted AuthResponse: ${utf8.decode(decrypted)}");

  //   print("✅ Authentication complete. Ready to send commands.");
  // }

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
      ..usePrivateKey(_keyPath!, password: '');

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
      _pairingSocket!.listen((data) {
        print("Received data: ${(data).length} bytes");
      });
      _pairingSocket!.first;
      // _setupPairingListener();
      await Future.delayed(Duration(milliseconds: 500));

      // Send pairing request using OuterMessage protocol
      // await _sendPairingRequest();
    } catch (e) {
      print('❌ Pairing connection failed: $e\n');
      rethrow;
    }
  }

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

  void _setupPairingListener() {
    _pairingSocket!.listen(
      (data) => _handlePairingMessage(data),
      onError: (e) => print('❌ Pairing error: $e'),
      onDone: () => print('🔌 Pairing connection closed'),
    );
  }

  void _handlePairingMessage(Uint8List data) {
    try {
      print('📩 Received ${data.length} bytes\n');

      // Parse as OuterMessage (pairing protocol)
      final outerMessage = RemoteMessage.fromBuffer(data);

      if (outerMessage.hasPairingResponse()) {
        print('✅ Pairing request acknowledged\n');
        // _sendPairingOption();
      }
      //  else if (outerMessage.hasPairingOption()) {
      //   print('✅ Pairing option acknowledged\n');
      //   _sendPairingConfiguration();
      // } else if (outerMessage.hasPairingConfigurationAck()) {
      //   print('✅ ✅ ✅ CHECK TV SCREEN FOR PIN! ✅ ✅ ✅\n');
      // } else if (outerMessage.hasPairingSecretAck()) {
      //   print('✅ ✅ ✅ PAIRING SUCCESSFUL! ✅ ✅ ✅\n');
      //   _onPairingComplete();
      // }
    } catch (e) {
      print('⚠️  Error parsing pairing message: $e');
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

  // Future<void> enterPairingCode(String pin) async {
  //   if (_pairingSocket == null) {
  //     throw Exception('Not in pairing mode');
  //   }

  //   print('🔐 Computing secret for PIN: $pin\n');

  //   // Compute SHA-256 hash as per protocol
  //   final secret = _computePairingSecret(pin);

  //   final secretMsg = Secret()
  //     ..secret = secret;

  //   final outerMessage = OuterMessage()
  //     ..protocolVersion = 2
  //     ..status = 200
  //     ..pairingSecret = secretMsg;

  //   final bytes = outerMessage.writeToBuffer();
  //   _pairingSocket!.add(bytes);
  //   await _pairingSocket!.flush();

  //   print('✅ Sent pairing secret\n');
  // }
  //  Future<void> _sendPairingConfiguration() async {
  //   print('📤 Sending PairingConfiguration...\n');

  //   final encoding = Encoding()
  //     ..type = Encoding_EncodingType.ENCODING_TYPE_HEXADECIMAL
  //     ..symbolLength = 6;

  //   final config = Configuration()
  //     ..encoding = encoding
  //     ..clientRole = Options_RoleType.ROLE_TYPE_INPUT;

  //   final outerMessage = OuterMessage()
  //     ..protocolVersion = 2
  //     ..status = 200
  //     ..pairingConfiguration = config;

  //   final bytes = outerMessage.writeToBuffer();
  //   _pairingSocket!.add(bytes);
  //   await _pairingSocket!.flush();

  //   print('✅ Sent PairingConfiguration\n');
  // }
  // Future<void> _sendPairingOption() async {
  //   print('📤 Sending PairingOption...\n');

  //   final encoding = Encoding()
  //     ..type = Encoding_EncodingType.ENCODING_TYPE_HEXADECIMAL
  //     ..symbolLength = 6;

  //   final options = Options()
  //     ..inputEncodings.add(encoding)
  //     ..outputEncodings.add(encoding)
  //     ..preferredRole = Options_RoleType.ROLE_TYPE_INPUT;

  //   final outerMessage = OuterMessage()
  //     ..protocolVersion = 2
  //     ..status = 200
  //     ..pairingOption = options;

  //   final bytes = outerMessage.writeToBuffer();
  //   _pairingSocket!.add(bytes);
  //   await _pairingSocket!.flush();

  //   print('✅ Sent PairingOption\n');
  // }

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
      // Parse as RemoteMessage (command protocol)
      final message = RemoteMessage.fromBuffer(data);

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
    // Parse the stored certificate to extract RSA keys
    // You mentioned you have RSA key parsers already
    // Use them here to populate _clientPublicKey and _clientPrivateKey

    print('🔑 Extracting keys from stored certificate...\n');
    // TODO: Use your RSA parser here
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
      // Convert binary DER to PEM
      final derBytes = cert.der;
      final base64Cert = base64.encode(derBytes);
      final pem =
          '-----BEGIN CERTIFICATE-----\n'
          '${_chunk64(base64Cert)}'
          '-----END CERTIFICATE-----\n';

      // Parse into structured object
      final parsed = X509Utils.x509CertificateFromPem(pem);

      // Access publicKeyData field (exists in X509CertificateData)
      final pubKeyData = parsed.tbsCertificate!.subjectPublicKeyInfo; // type:
      return _parsePublicKey(pubKeyData.bytes!);
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
