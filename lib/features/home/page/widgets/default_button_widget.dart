import 'package:android_tv_remote/core/services/tv_remote_button_handler.dart';
import 'package:android_tv_remote/core/themes/app_colors.dart';
import 'package:android_tv_remote/core/themes/app_text_styles.dart';
import 'package:android_tv_remote/core/themes/app_spacing.dart';
import 'package:android_tv_remote/src/generated/keycodes.pb.dart';
import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  final RemoteButtonHandler? buttonHandler;
  final RemoteKeyInject_RemoteKeyCode keyCode;
  final IconData icon;
  final Color? iconColor;

  const DefaultButtonWidget({
    super.key,
    required this.buttonHandler,
    required this.keyCode,
    required this.icon,
    required this.iconColor,
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.button,
        minimumSize: Size(40.0, 40.0),
        padding: EdgeInsets.fromLTRB(
           spacing.paddingInline2xl(),
           spacing.paddingBlockMd(),
           spacing.paddingInline2xl(),
           spacing.paddingBlockMd(),
        ),
      ),
      onPressed: () => buttonHandler?.onShortPress(keyCode),
      child: Icon(
        icon,
        size: textStyles.fontSizeXl(),
        color: iconColor ?? AppColors.text,
      ),
    );
  }
}

// const Color.fromARGB(255, 255, 31, 98)
