import 'package:flutter/material.dart';
import "package:android_tv_remote/core/services/otp_dialog.dart";

Future<String?> showOtpDialog({
  required BuildContext context,
  String title = 'Enter Verification Code',
  String subtitle = 'We sent a code to your phone',
  int length = 6,
  bool barrierDismissible = false,
  void Function(String)? onCompleted,
}) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return OtpDialog(
        title: title,
        subtitle: subtitle,
        length: length,
        onCompleted: onCompleted,
      );
    },
  );
}
