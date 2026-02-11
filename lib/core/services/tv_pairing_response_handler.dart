import 'dart:typed_data';
import 'package:android_tv_remote/core/services/tv_pairing_dialog_service.dart';
import 'package:android_tv_remote/src/generated/auth.pb.dart';
import 'package:flutter/widgets.dart';

class TvPairingResponseHandler {
  Future<void> Function() sendPairingOption;
  Future<void> Function() sendPairingConfiguration;
  Future<void> Function(String pin) sendPairingSecret;
  Future<void> Function() onPairingComplete;
  bool mounted;
  dynamic context;
  TvPairingResponseHandler({
    required this.sendPairingOption,
    required this.sendPairingConfiguration,
    required this.sendPairingSecret,
    required this.onPairingComplete,
    required this.mounted,
    required this.context,
  });
  List<int> _buffer = [];

  void handleSocketMessage(Uint8List data) {
    _buffer.addAll(data);
    _processBuffer();
  }

  Future<void> _processBuffer() async {
    while (_buffer.isNotEmpty) {
      try {
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
          return;
        }

        final messageBytes = Uint8List.fromList(
          _buffer.sublist(varintBytes, varintBytes + messageLength),
        );

        _buffer = _buffer.sublist(totalBytesNeeded);

        final msg = OuterMessage.fromBuffer(messageBytes);
        _handleMessage(msg);
      } catch (e, stackTrace) {
        print('⚠️ Error in buffer processing: $e');
        print('Stack trace: $stackTrace');
        _buffer.clear();
        return;
      }
    }
  }

  void _handleMessage(OuterMessage msg) async {
    // print('whichMessage  =====> ${msg.whichMessage()}');
    // print('msg status  =====> ${msg.status}');
    final tvPairingDialog = TvPairingDialogService(
      context: context,
      sendPairingSecret: sendPairingSecret,
    );
    switch (msg.whichMessage()) {
      case OuterMessage_Message.pairingResponse:
        // print('🔐 Received PairingResponse');
        sendPairingOption();
        break;

      case OuterMessage_Message.pairingRequestAck:
        // print('✅ PairingRequest ack acknowledged');
        break;
      case OuterMessage_Message.pairingConfigurationAck:
        tvPairingDialog.showPinDialog(context);
        break;

      case OuterMessage_Message.pairingOption:
        if (msg.pairingOption.preferredRole == RoleType.ROLE_TYPE_OUTPUT ||
            msg.pairingOption.preferredRole == RoleType.ROLE_TYPE_INPUT) {}

        sendPairingConfiguration();
        break;

      case OuterMessage_Message.pairingOptionAck:
        // print('✅ PairingOptions acknowledged');
        // print('📺 TV should display PIN now!');
        break;
      case OuterMessage_Message.pairingSecretAck:
        if (msg.status == 200 && msg.pairingSecretAck.secret.isNotEmpty) {
          await onPairingComplete();
          if (!mounted) return;
          Navigator.of(context).pop();
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
}
