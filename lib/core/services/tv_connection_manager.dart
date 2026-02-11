import 'dart:io';

// import 'package:android_tv_remote/core/services/tv_command_response_handler.dart';
class TvConnectionManager {
  final bool isPaired;
  final String certPath;
  final String keyPath;
  final String host;
  SecureSocket? commandSocket;
  bool? isConnected;

  TvConnectionManager({
    required this.isPaired,
    required this.certPath,
    required this.keyPath,
    required this.host,
  });
}
