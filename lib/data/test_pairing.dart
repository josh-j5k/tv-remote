// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:convert';
// import 'dart:math';
// // ignore: depend_on_referenced_packages
// import 'package:crypto/crypto.dart';
// import 'package:pointycastle/export.dart';
// import 'package:remote_app/data/constants/constants.dart';
// import 'package:remote_app/src/generated/auth.pb.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:remote_app/src/rsa_key_parser.dart';

// // Import your generated protobuf files

// class AndroidTVRemote {
//   final String host;
//   final String clientName;

//   String? _certPath;
//   String? _keyPath;
//   RSAPublicKey? _clientPublicKey;
//   RSAPrivateKey? _clientPrivateKey;
//   RSAPublicKey? _serverPublicKey;

//   SecureSocket? _pairingSocket;
//   SecureSocket? _commandSocket;

//   bool _isPaired = false;
//   bool _isConnected = false;

//   AndroidTVRemote({required this.host, this.clientName = client});

//   /// Initialize: Check for stored certificate or generate new one
//   Future<bool> initialize() async {
//     print('🔧 Initializing Android TV Remote...\n');

//     final prefs = await SharedPreferences.getInstance();

//     // Check if we have stored certificate
//     final storedCert = prefs.getString('atv_cert_$host');
//     final storedKey = prefs.getString('atv_key_$host');

//     if (storedCert != null && storedKey != null) {
//       print('✅ Found stored certificate\n');

//       // Write to temp files
//       _certPath = '${Directory.systemTemp.path}/atv_cert_$host.pem';
//       _keyPath = '${Directory.systemTemp.path}/atv_key_$host.pem';

//       await File(_certPath!).writeAsString(storedCert);
//       await File(_keyPath!).writeAsString(storedKey);

//       // Parse the certificate to extract public key
//       await _extractKeysFromCert(storedCert, storedKey);

//       _isPaired = true;
//       return true;
//     }

//     print('📝 No stored certificate found. Generating new one...\n');
//     await _generateClientCertificate();

//     return false;
//   }

//   /// Generate client RSA certificate
//   Future<void> _generateClientCertificate() async {
//     print('🔑 Generating RSA key pair...\n');

//     final rsaParams = RSAKeyGeneratorParameters(
//       BigInt.parse('65537'),
//       2048,
//       64,
//     );
//     final random = FortunaRandom();
//     final seed = Uint8List.fromList(
//       List.generate(32, (i) => Random.secure().nextInt(256)),
//     );
//     random.seed(KeyParameter(seed));

//     final keyGen = RSAKeyGenerator()
//       ..init(ParametersWithRandom(rsaParams, random));
//     final keyPair = keyGen.generateKeyPair();

//     _clientPublicKey = keyPair.publicKey as RSAPublicKey;
//     _clientPrivateKey = keyPair.privateKey as RSAPrivateKey;

//     // Generate PEM certificate
//     final certPem = _createSelfSignedCertPEM();
//     final keyPem = _createPrivateKeyPEM();

//     // Save to temp files
//     _certPath = '${Directory.systemTemp.path}/atv_cert_$host.pem';
//     _keyPath = '${Directory.systemTemp.path}/atv_key_$host.pem';

//     await File(_certPath!).writeAsString(certPem);
//     await File(_keyPath!).writeAsString(keyPem);

//     print('✅ Generated certificate and key\n');
//   }

//   Future<void> _extractKeysFromCert(String certPem, String keyPem) async {
//     // Parse the stored certificate to extract RSA keys
//     // You mentioned you have RSA key parsers already
//     // Use them here to populate _clientPublicKey and _clientPrivateKey

//     print('🔑 Extracting keys from stored certificate...\n');
//     // TODO: Use your RSA parser here

//     _clientPublicKey = _parsePublicKey(certPem);
//   }

//   String _createSelfSignedCertPEM() {
//     // Create a minimal self-signed X.509 certificate
//     // Common Name should be "atvremote" as per protocol

//     final now = DateTime.now();
//     final notAfter = now.add(Duration(days: 3650)); // 10 years

//     // This is simplified - use your certificate generation logic
//     // The key requirements:
//     // - Subject CN=atvremote
//     // - Validity period of ~10 years
//     // - Self-signed

//     return '''-----BEGIN CERTIFICATE-----
// [YOUR_CERTIFICATE_DATA_HERE]
// -----END CERTIFICATE-----''';
//   }

//   String _createPrivateKeyPEM() {
//     // Export private key in PKCS#1 or PKCS#8 format
//     // Use your RSA key export logic

//     return '''-----BEGIN RSA PRIVATE KEY-----
// [YOUR_PRIVATE_KEY_DATA_HERE]
// -----END RSA PRIVATE KEY-----''';
//   }

//   /// Start pairing process on port 6467
//   Future<void> startPairing() async {
//     if (_isPaired) {
//       print('⚠️  Already paired. Use connect() to authenticate.\n');
//       return;
//     }

//     if (_certPath == null || _keyPath == null) {
//       throw Exception('Certificate not initialized. Call initialize() first');
//     }

//     print('🔐 Starting pairing on $host:6467...\n');

//     final context = SecurityContext()
//       ..useCertificateChain(_certPath!)
//       ..usePrivateKey(_keyPath!);

//     try {
//       _pairingSocket = await SecureSocket.connect(
//         host,
//         6467, // PAIRING PORT
//         context: context,
//         timeout: Duration(seconds: 10),
//         onBadCertificate: (cert) {
//           print('📜 Received server certificate\n');
//           _serverPublicKey = _extractServerPublicKey(cert);
//           return true;
//         },
//       );

//       print('✅ Connected to pairing port\n');

//       _setupPairingListener();
//       await Future.delayed(Duration(milliseconds: 500));

//       // Send pairing request using OuterMessage protocol
//       await _sendPairingRequest();
//     } catch (e) {
//       print('❌ Pairing connection failed: $e\n');
//       rethrow;
//     }
//   }

//   void _setupPairingListener() {
//     _pairingSocket!.listen(
//       (data) => _handlePairingMessage(data),
//       onError: (e) => print('❌ Pairing error: $e'),
//       onDone: () => print('🔌 Pairing connection closed'),
//     );
//   }

//   void _handlePairingMessage(Uint8List data) {
//     try {
//       print('📩 Received ${data.length} bytes\n');

//       // Parse as OuterMessage (pairing protocol)
//       final outerMessage = RemoteMessage.fromBuffer(data);

//       if (outerMessage.hasPairingResponse()) {
//         print('✅ Pairing request acknowledged\n');
//         _sendPairingOption();
//       } else if (outerMessage.hasPairingOption()) {
//         print('✅ Pairing option acknowledged\n');
//         _sendPairingConfiguration();
//       } else if (outerMessage.hasPairingConfigurationAck()) {
//         print('✅ ✅ ✅ CHECK TV SCREEN FOR PIN! ✅ ✅ ✅\n');
//       } else if (outerMessage.hasPairingSecretAck()) {
//         print('✅ ✅ ✅ PAIRING SUCCESSFUL! ✅ ✅ ✅\n');
//         _onPairingComplete();
//       }
//     } catch (e) {
//       print('⚠️  Error parsing pairing message: $e');
//     }
//   }

//   Future<void> _sendPairingRequest() async {
//     print('📤 Sending PairingRequest...\n');

//     final pairingRequest = PairingRequest()
//       ..clientId = 'com.flutter.atvremote'
//       ..clientName = clientName;

//     final outerMessage = OuterMessage()
//       ..protocolVersion = 2
//       ..status = 200
//       ..pairingRequest = pairingRequest;

//     final bytes = outerMessage.writeToBuffer();
//     _pairingSocket!.add(bytes);
//     await _pairingSocket!.flush();

//     print('✅ Sent PairingRequest\n');
//   }

//   Future<void> _sendPairingOption() async {
//     print('📤 Sending PairingOption...\n');

//     final encoding = Encoding()
//       ..type = Encoding_EncodingType.ENCODING_TYPE_HEXADECIMAL
//       ..symbolLength = 6;

//     final options = Options()
//       ..inputEncodings.add(encoding)
//       ..outputEncodings.add(encoding)
//       ..preferredRole = Options_RoleType.ROLE_TYPE_INPUT;

//     final outerMessage = OuterMessage()
//       ..protocolVersion = 2
//       ..status = 200
//       ..pairingOption = options;

//     final bytes = outerMessage.writeToBuffer();
//     _pairingSocket!.add(bytes);
//     await _pairingSocket!.flush();

//     print('✅ Sent PairingOption\n');
//   }

//   Future<void> _sendPairingConfiguration() async {
//     print('📤 Sending PairingConfiguration...\n');

//     final encoding = Encoding()
//       ..type = Encoding_EncodingType.ENCODING_TYPE_HEXADECIMAL
//       ..symbolLength = 6;

//     final config = Configuration()
//       ..encoding = encoding
//       ..clientRole = Options_RoleType.ROLE_TYPE_INPUT;

//     final outerMessage = OuterMessage()
//       ..protocolVersion = 2
//       ..status = 200
//       ..pairingConfiguration = config;

//     final bytes = outerMessage.writeToBuffer();
//     _pairingSocket!.add(bytes);
//     await _pairingSocket!.flush();

//     print('✅ Sent PairingConfiguration\n');
//   }

//   /// User enters PIN from TV screen
//   Future<void> enterPairingCode(String pin) async {
//     if (_pairingSocket == null) {
//       throw Exception('Not in pairing mode');
//     }

//     print('🔐 Computing secret for PIN: $pin\n');

//     // Compute SHA-256 hash as per protocol
//     final secret = _computePairingSecret(pin);

//     final secretMsg = Secret()..secret = secret;

//     final outerMessage = OuterMessage()
//       ..protocolVersion = 2
//       ..status = 200
//       ..pairingSecret = secretMsg;

//     final bytes = outerMessage.writeToBuffer();
//     _pairingSocket!.add(bytes);
//     await _pairingSocket!.flush();

//     print('✅ Sent pairing secret\n');
//   }

//   Uint8List _computePairingSecret(String pin) {
//     // Hash: client_modulus + client_exponent + server_modulus + server_exponent + gamma
//     // gamma = last 4 chars of PIN converted to bytes

//     final clientMod = _removeLeadingZeros(
//       _bigIntToBytes(_clientPublicKey!.modulus!),
//     );
//     final clientExp = _removeLeadingZeros(
//       _bigIntToBytes(_clientPublicKey!.exponent!),
//     );
//     final serverMod = _removeLeadingZeros(
//       _bigIntToBytes(_serverPublicKey!.modulus!),
//     );
//     final serverExp = _removeLeadingZeros(
//       _bigIntToBytes(_serverPublicKey!.exponent!),
//     );

//     // Get last 4 characters of PIN and convert hex to bytes
//     final gamma = pin.substring(2, 6);
//     final gammaBytes = _hexToBytes(gamma);

//     final input = BytesBuilder()
//       ..add(clientMod)
//       ..add(clientExp)
//       ..add(serverMod)
//       ..add(serverExp)
//       ..add(gammaBytes);

//     final digest = sha256.convert(input.toBytes());
//     return Uint8List.fromList(digest.bytes);
//   }

//   RSAPublicKey? _extractServerPublicKey(X509Certificate cert) {
//     // Parse the X509 certificate to extract RSA public key
//     // Use your RSA parser here
//     print('🔑 Extracting server public key from certificate...\n');

//     // TODO: Implement using your RSA parser
//     return _parsePublicKey(cert);
//   }

//   Future<void> _onPairingComplete() async {
//     _isPaired = true;

//     // Store certificate for future use
//     final prefs = await SharedPreferences.getInstance();
//     final certContent = await File(_certPath!).readAsString();
//     final keyContent = await File(_keyPath!).readAsString();

//     await prefs.setString('atv_cert_$host', certContent);
//     await prefs.setString('atv_key_$host', keyContent);

//     print('💾 Certificate stored for future use\n');

//     _pairingSocket?.close();
//     _pairingSocket = null;
//   }

//   /// Connect to command port 6466 after pairing
//   Future<void> connect() async {
//     if (!_isPaired) {
//       throw Exception('Not paired. Call startPairing() first');
//     }

//     if (_isConnected) {
//       print('⚠️  Already connected\n');
//       return;
//     }

//     print('🔐 Connecting to $host:6466 (command port)...\n');

//     final context = SecurityContext()
//       ..useCertificateChain(_certPath!)
//       ..usePrivateKey(_keyPath!);

//     try {
//       _commandSocket = await SecureSocket.connect(
//         host,
//         6466, // COMMAND PORT
//         context: context,
//         timeout: Duration(seconds: 10),
//         onBadCertificate: (cert) => true,
//       );

//       print('✅ Connected to command port\n');

//       _setupCommandListener();
//       _isConnected = true;

//       // Wait for initial device info
//       await Future.delayed(Duration(milliseconds: 500));
//     } catch (e) {
//       print('❌ Command connection failed: $e\n');
//       rethrow;
//     }
//   }

//   void _setupCommandListener() {
//     _commandSocket!.listen(
//       (data) => _handleCommandMessage(data),
//       onError: (e) {
//         print('❌ Command error: $e');
//         _isConnected = false;
//       },
//       onDone: () {
//         print('🔌 Command connection closed');
//         _isConnected = false;
//       },
//     );
//   }

//   RSAPublicKey _parsePublicKey(String pem) {
//     final parser = RSAKeyParser();
//     return parser.parse(pem) as RSAPublicKey;
//   }

//   /// Send a key command to the TV
//   // Future<void> sendKey(String keyCode, {String direction = 'SHORT_PRESS'}) async {
//   //   if (!_isConnected) {
//   //     throw Exception('Not connected. Call connect() first');
//   //   }

//   //   final keyCodeValue = _parseKeyCode(keyCode);
//   //   final directionValue = _parseDirection(direction);

//   //   final command = RemoteCommand()
//   //     ..keyCode = keyCodeValue
//   //     ..direction = directionValue;

//   //   final message = RemoteMessage()
//   //     ..remoteCommand = command;

//   //   final bytes = message.writeToBuffer();
//   //   _commandSocket!.add(bytes);
//   //   await _commandSocket!.flush();

//   //   print('✅ Sent key: $keyCode\n');
//   // }

//   // int _parseKeyCode(String keyCode) {
//   //   // Map string key codes to integers
//   //   // Use your RemoteKeyCode enum from generated protobuf
//   //   final keyMap = {
//   //     'POWER': RemoteKeyCode.KEYCODE_POWER,
//   //     'HOME': RemoteKeyCode.KEYCODE_HOME,
//   //     'BACK': RemoteKeyCode.KEYCODE_BACK,
//   //     'DPAD_UP': RemoteKeyCode.KEYCODE_DPAD_UP,
//   //     'DPAD_DOWN': RemoteKeyCode.KEYCODE_DPAD_DOWN,
//   //     'DPAD_LEFT': RemoteKeyCode.KEYCODE_DPAD_LEFT,
//   //     'DPAD_RIGHT': RemoteKeyCode.KEYCODE_DPAD_RIGHT,
//   //     'DPAD_CENTER': RemoteKeyCode.KEYCODE_DPAD_CENTER,
//   //     'VOLUME_UP': RemoteKeyCode.KEYCODE_VOLUME_UP,
//   //     'VOLUME_DOWN': RemoteKeyCode.KEYCODE_VOLUME_DOWN,
//   //     // Add more as needed
//   //   };

//   //   return keyMap[keyCode]?.value ?? 0;
//   // }

//   // int _parseDirection(String direction) {
//   //   final dirMap = {
//   //     'SHORT_PRESS': RemoteDirection.SHORT_PRESS,
//   //     'START_LONG_PRESS': RemoteDirection.START_LONG_PRESS,
//   //     'END_LONG_PRESS': RemoteDirection.END_LONG_PRESS,
//   //   };

//   //   return dirMap[direction]?.value ?? RemoteDirection.SHORT_PRESS.value;
//   // }

//   // Utility methods
//   Uint8List _bigIntToBytes(BigInt bigInt) {
//     var hex = bigInt.toRadixString(16);
//     if (hex.length % 2 != 0) hex = '0$hex';
//     return Uint8List.fromList(
//       List.generate(
//         hex.length ~/ 2,
//         (i) => int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16),
//       ),
//     );
//   }

//   Uint8List _removeLeadingZeros(Uint8List bytes) {
//     int start = 0;
//     while (start < bytes.length && bytes[start] == 0) {
//       start++;
//     }
//     return bytes.sublist(start);
//   }

//   Uint8List _hexToBytes(String hex) {
//     return Uint8List.fromList(
//       List.generate(
//         hex.length ~/ 2,
//         (i) => int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16),
//       ),
//     );
//   }
// String _createSelfSignedCertPEM() {
//     final serialNumber = BigInt.from(DateTime.now().millisecondsSinceEpoch);

//     // TBSCertificate
//     final tbsCert = ASN1Sequence();

//     // Version (v3 = 2)
//     final version = ASN1Sequence()..add(ASN1Integer(BigInt.from(2)));
//     tbsCert.add(version);

//     // Serial number
//     tbsCert.add(ASN1Integer(serialNumber));

//     // Signature algorithm
//     final sigAlg = ASN1Sequence()
//       ..add(ASN1ObjectIdentifier([1, 2, 840, 113549, 1, 1, 11]))
//       ..add(ASN1Null());
//     tbsCert.add(sigAlg);

//     // Issuer (CN=atvremote only)
//     final issuer = ASN1Sequence();
//     final cnSet = ASN1Set();
//     final cnSeq = ASN1Sequence()
//       ..add(ASN1ObjectIdentifier([2, 5, 4, 3]))
//       ..add(ASN1UTF8String('atvremote'));
//     cnSet.add(cnSeq);
//     issuer.add(cnSet);
//     tbsCert.add(issuer);

//     // Validity
//     final now = DateTime.now();
//     final validity = ASN1Sequence()
//       ..add(ASN1UtcTime(now))
//       ..add(ASN1UtcTime(now.add(Duration(days: 3650))));
//     tbsCert.add(validity);

//     // Subject (same as issuer)
//     tbsCert.add(issuer);

//     // Subject public key info
//     final pubKeySeq = ASN1Sequence()
//       ..add(ASN1Integer(_clientPublicKey!.modulus!))
//       ..add(ASN1Integer(_clientPublicKey!.exponent!));

//     final pubKeyBitString = ASN1BitString(pubKeySeq.encodedBytes);
//     final pubKeyAlg = ASN1Sequence()
//       ..add(ASN1ObjectIdentifier([1, 2, 840, 113549, 1, 1, 1]))
//       ..add(ASN1Null());

//     final subjectPublicKeyInfo = ASN1Sequence()
//       ..add(pubKeyAlg)
//       ..add(pubKeyBitString);
//     tbsCert.add(subjectPublicKeyInfo);

//     // Sign the certificate
//     final signer = RSASigner(SHA256Digest(), '0609608648016503040201');
//     signer.init(true, PrivateKeyParameter<RSAPrivateKey>(_clientPrivateKey!));
//     final signature = signer.generateSignature(tbsCert.encodedBytes);

//     // Final certificate
//     final certificate = ASN1Sequence()
//       ..add(tbsCert)
//       ..add(sigAlg)
//       ..add(ASN1BitString(signature.bytes));

//     final certBytes = certificate.encodedBytes;
//     final base64Cert = base64.encode(certBytes);

//     // Format as PEM
//     final pemLines = <String>[];
//     for (var i = 0; i < base64Cert.length; i += 64) {
//       pemLines.add(base64Cert.substring(i, min(i + 64, base64Cert.length)));
//     }
//     final cert =
//         '-----BEGIN CERTIFICATE-----\n${pemLines.join('\n')}\n-----END CERTIFICATE-----';
//     // Return as PEM
//     return cert;
//   }
//   void dispose() {
//     _pairingSocket?.close();
//     _commandSocket?.close();
//   }
// }
