import 'dart:io';
import 'package:android_tv_remote/core/utils/encode_varint.dart';
import 'package:android_tv_remote/src/generated/keycodes.pb.dart';

class TvCommandProcessor {
  final SecureSocket? commandSocket;
  final int imeCounter;
  final int imeFieldCounter;
  const TvCommandProcessor({
    required this.commandSocket,
    required this.imeCounter,
    required this.imeFieldCounter,
  });

  Future<void> sendKeyCommand(RemoteKeyInject_RemoteKeyCode keyCode) async {
    await sendKeyShortPress(keyCode);
  }

  Future<void> sendKeyPress(RemoteKeyInject_RemoteKeyCode keyCode) async {
    final message = RemoteMessage()
      ..remoteKeyInject = (RemoteKeyInject()
        ..keyCode = keyCode
        ..direction = RemoteDirection.PRESSED);

    final payload = message.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    commandSocket?.add([...lenPrefix, ...payload]);
    await commandSocket?.flush();
  }

  Future<void> sendKeyRelease(RemoteKeyInject_RemoteKeyCode keyCode) async {
    final message = RemoteMessage()
      ..remoteKeyInject = (RemoteKeyInject()
        ..keyCode = keyCode
        ..direction = RemoteDirection.RELEASED);

    final payload = message.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    commandSocket?.add([...lenPrefix, ...payload]);
    await commandSocket?.flush();
  }

  /// Send key with SHORT_PRESS direction (complete press and release in one message)
  Future<void> sendKeyShortPress(RemoteKeyInject_RemoteKeyCode keyCode) async {
    if (commandSocket == null) {
      return;
    }
    final message = RemoteMessage()
      ..remoteKeyInject = (RemoteKeyInject()
        ..keyCode = keyCode
        ..direction = RemoteDirection.SHORT_PRESS);

    final payload = message.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    commandSocket?.add([...lenPrefix, ...payload]);
    await commandSocket?.flush();
  }

  Future<void> sendText(String text) async {
    // final message = RemoteMessage();
    // int paramValue = text.length - 1;
    final imeObject = RemoteImeObject()
      ..start = 0
      ..end = text.length
      ..value = text;
    final editInfo = RemoteEditInfo()
      ..insert = 1
      ..textFieldStatus = imeObject;
    final batchEdit = RemoteImeBatchEdit()
      ..imeCounter = imeCounter
      ..fieldCounter = imeFieldCounter
      ..editInfo.add(editInfo);
    final message = RemoteMessage()..remoteImeBatchEdit = batchEdit;

    final payload = message.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);
    commandSocket?.add([...lenPrefix, ...payload]);
    await commandSocket?.flush();

    print('✅ Text sent');
    // message.remoteImeBatchEdit.mergeFromMessage(batchEdit);
  }

  // Launch an app (e.g., Netflix)
  Future<void> launchApp(String deeplink) async {
    if (Uri.parse(deeplink).scheme.isEmpty) {
      deeplink = "market://launch?id=$deeplink";
    }
    final appMessage = RemoteMessage()
      ..remoteAppLinkLaunchRequest = (RemoteAppLinkLaunchRequest()
        ..appLink = deeplink);

    final payload = appMessage.writeToBuffer();
    final lenPrefix = encodeVarint(payload.length);

    commandSocket?.add([...lenPrefix, ...payload]);
    await commandSocket?.flush();

    print('✅ Launched app: $deeplink');
  }
}
