// import 'dart:io';

import 'package:android_tv_remote/core/services/tv_command_processor.dart';
import 'package:flutter/material.dart';

void showKeyboardDialog(dynamic context, TvCommandProcessor? commandProcessor) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Keyboard Input'),
        content: TextField(
          autofocus: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: 'Type your text here'),
          onChanged: (value) async {
            await commandProcessor?.sendText(value);
          },
          // onSubmitted: (String value) async {
          //   await _remoteClient?.sendText(value);
          //   Navigator.of(context).pop();
          // },
        ),
      );
    },
  );
}
