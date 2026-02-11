import 'dart:async';
import 'dart:io';
// import 'dart:typed_data';
// import 'package:android_tv_remote/core/services/error_messanger.dart';
import 'package:android_tv_remote/core/services/tv_certificate.dart';
import 'package:android_tv_remote/core/services/tv_command_processor.dart';
import 'package:android_tv_remote/core/services/tv_command_response_handler.dart';
// import 'package:android_tv_remote/core/services/tv_connection_manager.dart';
import 'package:android_tv_remote/core/services/tv_pairing.dart';
import 'package:pointycastle/export.dart';
import 'package:android_tv_remote/src/generated/auth.pb.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';

class TvRemoteClient {
  final String host;
  final void Function(OuterMessage)? handleMessage;
  String? _certPath;
  String? _keyPath;
  RSAPublicKey? _clientPublicKey;
  SecureSocket? _commandSocket;
  bool _isPaired = false;
  // bool _isConnected = false;
  TvCertificate certificates = TvCertificate();
  TvRemoteClient({required this.host, this.handleMessage});
  int imeCounter = 0;
  int imeFieldCounter = 0;
  Future<bool> initialize() async {
    final prefs = await SharedPreferences.getInstance();

    final storedCert = prefs.getString('atv_cert_$host');
    final storedKey = prefs.getString('atv_key_$host');
    if (storedCert != null && storedKey != null) {
      _certPath = '${Directory.systemTemp.path}/atv_cert_$host.pem';
      _keyPath = '${Directory.systemTemp.path}/atv_key_$host.pem';

      await File(_certPath!).writeAsString(storedCert, flush: true);
      await File(_keyPath!).writeAsString(storedKey, flush: true);
      final data = await certificates.extractKeysFromCert(
        storedCert,
        storedKey,
      );
      // _clientPrivateKey = data.$1;
      _clientPublicKey = data.$2;

      _isPaired = true;
      return _isPaired;
    }
    _isPaired = false;
    final deviceId = await _getDeviceIdentifier();
    final data = await certificates.generateClientCertificate(deviceId, host);
    // _clientPrivateKey = data.clientPrivateKey;
    _clientPublicKey = data.clientPublicKey;
    _certPath = data.certPath;
    _keyPath = data.keyPath;
    return _isPaired;
  }

  Future<void> authenticate(dynamic context, bool mounted) async {
    final tvPairing = TvPairing(
      host: host,
      clientPublicKey: _clientPublicKey!,
      certPath: _certPath!,
      keyPath: _keyPath!,
      context: context,
      mounted: mounted,
    );
    await tvPairing.startPairing();
    _isPaired = true;
  }

  Future<TvCommandProcessor?> connect() async {
    if (_certPath == null) return null;
    if (!_isPaired) {
      throw Exception('Not paired. Call startPairing() first');
    }

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

      // Wait for initial device info
      await Future.delayed(Duration(milliseconds: 500));
      final command = TvCommandProcessor(
        commandSocket: _commandSocket!,
        imeCounter: imeCounter,
        imeFieldCounter: imeFieldCounter,
      );
      print("ready to use");
      return command;
    } catch (e) {
      print('❌ Command connection failed: $e\n');
      rethrow;
    }

    // _isConnected = connectionManager.isConnected!;
  }

  void _setupCommandListener() {
    final commandResponse = TvCommandResponseHandler(
      isPaired: _isPaired,
      commandSocket: _commandSocket,
    );
    imeCounter = commandResponse.imeCounter;
    imeFieldCounter = commandResponse.imeFieldCounter;
    _commandSocket!.listen(
      (data) => commandResponse.handleSocketMessage(data),
      onError: (e) {
        print('❌ Command error: $e');
        // _isConnected = false;
      },
      onDone: () {
        // print('🔌 Command connection closed');
        _commandSocket = null;
        // _isConnected = false;
      },
      cancelOnError: false,
    );
  }

  Future<String> _getDeviceIdentifier() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id; // Unique Android ID
    }

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? 'ios-device';
    }
    return 'emulator-device';
  }
}
