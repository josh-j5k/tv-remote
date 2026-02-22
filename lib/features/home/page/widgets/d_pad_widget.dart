import 'package:android_tv_remote/core/services/tv_remote_button_handler.dart';
import 'package:android_tv_remote/core/themes/app_colors.dart';
import 'package:android_tv_remote/core/themes/app_spacing.dart';
import 'package:android_tv_remote/core/themes/app_text_styles.dart';
import 'package:android_tv_remote/core/utils/gesture_event_handler.dart';
import 'package:android_tv_remote/src/generated/keycodes.pb.dart';
import 'package:flutter/material.dart';

class DPadWidget extends StatelessWidget {
  final RemoteKeyInject_RemoteKeyCode keyCode;
  final RemoteButtonHandler? buttonHandler;
  final double? angle;
  const DPadWidget({
    super.key,
    required this.keyCode,
    required this.buttonHandler,
    required this.angle,
  });
  @override
  Widget build(BuildContext context) {
    final AppTextStyles textStyles = AppTextStyles(
      screenHeight: MediaQuery.of(context).size.height,
      screenWidth: MediaQuery.of(context).size.width,
    );
    final AppSpacing spacing = AppSpacing( screenHeight: MediaQuery.of(context).size.height,
      screenWidth: MediaQuery.of(context).size.width);
    return SizedBox(
      width: spacing.paddingInline2xl() * 3,
      child: GestureDetector(
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
          padding: EdgeInsets.fromLTRB(
           spacing.paddingInline2xl(),
            spacing.paddingBlockMd(),
            spacing.paddingInline2xl(),
            spacing.paddingBlockMd(),
          ),
          decoration: BoxDecoration(
            color: AppColors.button,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: angle != null
              ? Transform.rotate(
                  // angle: -pi / 2,
                  angle: angle!,
                  child: Icon(
                    Icons.play_arrow,
                    size: textStyles.fontSizeXl(),
                    color: AppColors.text,
                  ),
                )
              : Icon(
                  Icons.play_arrow,
                  size: textStyles.fontSizeXl(),
                  color: AppColors.text,
                ),
        ),
      ),
    );
  }
}
