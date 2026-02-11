import 'dart:io';
import 'dart:typed_data';
import 'package:android_tv_remote/src/generated/keycodes.pb.dart';
import 'package:android_tv_remote/core/utils/encode_varint.dart';

class TvCommandResponseHandler {
  bool isPaired;
  SecureSocket? commandSocket;
  TvCommandResponseHandler({
    required this.isPaired,
    required this.commandSocket,
  });
  List<int> _buffer = [];

  void handleSocketMessage(Uint8List data) {
    _buffer.addAll(data);
    _processBuffer();
  }

  Future<void> _processBuffer() async {
    while (_buffer.isNotEmpty) {
      try {
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
          return;
        }

        final messageBytes = Uint8List.fromList(
          _buffer.sublist(varintBytes, varintBytes + messageLength),
        );
        try {
          final msg = RemoteMessage.fromBuffer(messageBytes);
          _handleCommandMessage(msg);
        } catch (e, stackTrace) {
          print('❌ Failed to parse RemoteMessage: $e');
          print('   Stack trace: $stackTrace');
        }

        // Remove processed bytes
        _buffer = _buffer.sublist(totalBytesNeeded);
        return;
      } catch (e, stackTrace) {
        print('⚠️ Error in buffer processing: $e');
        print('Stack trace: $stackTrace');
        _buffer.clear();
        return;
      }
    }
  }

  int _lastPingVal1 = 0;
  // int _lastPingVal2 = 0;
  int imeCounter = 0;
  int imeFieldCounter = 0;
  void _handleCommandMessage(RemoteMessage msg) {
    print('📥 Command message received');
    if (msg.hasRemoteConfigure()) {
      _sendClientConfiguration();
    } else if (msg.hasRemotePingRequest()) {
      print('   Type: RemotePingRequest');
      _lastPingVal1 = msg.remotePingRequest.val1;
      // _lastPingVal2 = msg.remotePingRequest.val2;

      _sendPong();
    } else if (msg.hasRemoteSetActive()) {
      print('   Type: RemoteSetActive');
      _sendSecondConfiguration();
    } else if (msg.hasRemoteError()) {
      print('   Type: RemoteError ⚠️');
      print('   Error code: ${msg.remoteError.errorCode}');
      print('   Error message: ${msg.remoteError.errorMessage.toString()}');
    } else if (msg.hasRemoteImeBatchEdit()) {
      imeCounter = msg.remoteImeBatchEdit.imeCounter;
      imeFieldCounter = msg.remoteImeBatchEdit.fieldCounter;
    } else {
      print('   Unknown message type');
      // Print raw bytes to debug
      print('   Message fields: ${msg.toString()}');
    }
  }

  Future<void> _sendPong() async {
    final pong = RemoteMessage()
      ..remotePingResponse = (RemotePingResponse()
        ..val1 = _lastPingVal1); // Echo back val1 only!

    final payload = pong.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    // INCLUDE length prefix for pong!
    commandSocket!.add([...lenPrefix, ...payload]);
    await commandSocket!.flush();
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

    commandSocket!.add([...lenPrefix, ...payload]);
    await commandSocket!.flush();
    print('✅ Sent client configuration');
  }

  Future<void> _sendSecondConfiguration() async {
    // Second configuration message
    final setActive = RemoteSetActive()..active = 622; // 8, 238, 4 as varint

    final message = RemoteMessage()..remoteSetActive = setActive;

    final payload = message.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    print('📤 Sending second configuration...');
    commandSocket!.add([...lenPrefix, ...payload]);
    await commandSocket!.flush();

    print('✅ Ready to send commands!');
  }
}
