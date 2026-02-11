import 'package:android_tv_remote/core/services/opt_fun.dart';
import 'package:flutter/material.dart';

class TvPairingDialogService {
  final dynamic context;
  final Future<void> Function(String pin) sendPairingSecret;
  const TvPairingDialogService({
    required this.context,
    required this.sendPairingSecret,
  });
  Future<void> showPinDialog(context) async {
    showOtpDialog(
      context: context,
      title: 'Enter TV PIN',
      subtitle: 'Enter the pin shown on the TV',
      length: 6,
      onCompleted: getPin,
    );
  }

  void getPin(String value) async {
    final pin = value.trim().toUpperCase().replaceAll(RegExp(r'[^0-9A-F]'), '');

    if (pin.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'PIN must be exactly 6 characters. You entered: "$value"',
          ),
        ),
      );
      return;
    }

    if (!RegExp(r'^[0-9A-F]{6}$').hasMatch(pin)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'PIN must only contain 0-9 and A-F. You entered: "$value"',
          ),
        ),
      );
      return;
    }
    Navigator.of(context).pop();
    await sendPairingSecret(value);
  }
}
