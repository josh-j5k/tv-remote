import 'package:flutter/material.dart';
import "package:remote_app/features/welcome/page/otp_input.dart";

class OtpDialog extends StatefulWidget {
  final String title;
  final String subtitle;
  final int length;
  final ValueChanged<String>? onCompleted;

  const OtpDialog({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.length,
    required this.onCompleted,
  }) : super(key: key);

  @override
  State<OtpDialog> createState() => _OtpDialogState();
}

class _OtpDialogState extends State<OtpDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromARGB(249, 7, 7, 21),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40),
                const Icon(Icons.lock_outline, size: 48, color: Colors.blue),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.subtitle,
              style: TextStyle(fontSize: 14, color: Colors.grey[300]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            OtpInput(
              length: widget.length,
              fieldWidth: 45,
              fieldHeight: 60,
              spacing: 10,
              onCompleted: widget.onCompleted,
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
