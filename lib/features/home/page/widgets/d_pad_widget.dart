import 'package:android_tv_remote/core/services/tv_remote_button_handler.dart';
import 'package:android_tv_remote/core/themes/app_colors.dart';
import 'package:android_tv_remote/core/utils/gesture_event_handler.dart';
import 'package:android_tv_remote/src/generated/keycodes.pb.dart';
import 'package:flutter/material.dart';

Widget dPad(
  RemoteKeyInject_RemoteKeyCode keyCode,
  RemoteButtonHandler? buttonHandler,
  double? angle,
) {
  return GestureDetector(
    onTapDown: (_) async {
      onTapDown(keyCode, buttonHandler);
    },
    onTapUp: (_) async {
      onTapUp(keyCode, buttonHandler);
    },
    onTapCancel: () {
      onTapCancel(keyCode, buttonHandler);
    },
    child: Container(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      decoration: BoxDecoration(
        color: AppColors.button,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: angle != null
          ? Transform.rotate(
              // angle: -pi / 2,
              angle: angle,
              child: Icon(Icons.play_arrow, size: 30, color: AppColors.text),
            )
          : Icon(Icons.play_arrow, size: 30, color: AppColors.text),
    ),
  );
}
