import 'package:android_tv_remote/core/services/tv_remote_button_handler.dart';
import 'package:android_tv_remote/src/generated/keycodes.pb.dart';

void onTapDown(
  RemoteKeyInject_RemoteKeyCode keyCode,
  RemoteButtonHandler? buttonHandler,
) async {
  await buttonHandler?.onKeyButtonDown(keyCode, enableRepeat: true);
}

void onTapUp(
  RemoteKeyInject_RemoteKeyCode keyCode,
  RemoteButtonHandler? buttonHandler,
) async {
  await buttonHandler?.onButtonUp(keyCode);
}

void onTapCancel(
  RemoteKeyInject_RemoteKeyCode keyCode,
  RemoteButtonHandler? buttonHandler,
) {
  buttonHandler?.onButtonCancel(keyCode);
}
