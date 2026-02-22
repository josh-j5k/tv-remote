import 'package:android_tv_remote/core/services/tv_remote_button_handler.dart';
import 'package:android_tv_remote/core/themes/app_colors.dart';
import 'package:android_tv_remote/core/themes/app_text_styles.dart';
import 'package:android_tv_remote/core/utils/gesture_event_handler.dart';
import 'package:android_tv_remote/src/generated/keycodes.pb.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/app_spacing.dart';

class ControlsWidget extends StatelessWidget {
  final RemoteButtonHandler? buttonHandler;
  final RemoteKeyInject_RemoteKeyCode keyCode;
  final IconData icon;
  final String direction;
  const ControlsWidget({
    super.key,
    required this.buttonHandler,
    required this.keyCode,
    required this.icon,
    required this.direction,
  });
  @override
  Widget build(BuildContext context) {
    final AppTextStyles textStyles = AppTextStyles(
      screenHeight: MediaQuery.of(context).size.height,
      screenWidth: MediaQuery.of(context).size.width,
    );
    final AppSpacing spacing = AppSpacing(
      screenHeight: MediaQuery.of(context).size.height,
      screenWidth: MediaQuery.of(context).size.width,
    );
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
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          //  minimumSize: Size(75.0, 48.0),
          width: spacing.paddingInline2xl() * 2.9,
          decoration: BoxDecoration(
            color: AppColors.button,
            borderRadius: direction == "top"
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
          ),

          child: Icon(
            icon,
            color: AppColors.text,
            size: textStyles.fontSize2xl(),
          ),
        ),
      ),
    );
  }
}
