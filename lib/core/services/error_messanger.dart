import 'package:flutter/material.dart';

void showErrorSnackbar(String message, dynamic context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
