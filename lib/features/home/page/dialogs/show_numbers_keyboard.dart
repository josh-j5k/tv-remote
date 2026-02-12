import 'package:android_tv_remote/core/services/tv_remote_button_handler.dart';
import 'package:android_tv_remote/src/generated/keycodes.pbenum.dart';
import 'package:flutter/material.dart';

void showNumbersKeyboard(dynamic context, RemoteButtonHandler? buttonHandler) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 15, 15, 49),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 20,
                    children: [
                      button(
                        buttonHandler,
                        RemoteKeyInject_RemoteKeyCode.KEYCODE_1,
                        "1",
                      ),
                      button(
                        buttonHandler,
                        RemoteKeyInject_RemoteKeyCode.KEYCODE_2,
                        "2",
                      ),
                      button(
                        buttonHandler,
                        RemoteKeyInject_RemoteKeyCode.KEYCODE_3,
                        "3",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 20,
                    children: [
                      button(
                        buttonHandler,
                        RemoteKeyInject_RemoteKeyCode.KEYCODE_4,
                        "4",
                      ),
                      button(
                        buttonHandler,
                        RemoteKeyInject_RemoteKeyCode.KEYCODE_5,
                        "5",
                      ),
                      button(
                        buttonHandler,
                        RemoteKeyInject_RemoteKeyCode.KEYCODE_6,
                        "6",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 20,
                    children: [
                      button(
                        buttonHandler,
                        RemoteKeyInject_RemoteKeyCode.KEYCODE_7,
                        "7",
                      ),
                      button(
                        buttonHandler,
                        RemoteKeyInject_RemoteKeyCode.KEYCODE_8,
                        "8",
                      ),
                      button(
                        buttonHandler,
                        RemoteKeyInject_RemoteKeyCode.KEYCODE_9,
                        "9",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: button(
                      buttonHandler,
                      RemoteKeyInject_RemoteKeyCode.KEYCODE_0,
                      "0",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget button(
  RemoteButtonHandler? buttonHandler,
  RemoteKeyInject_RemoteKeyCode keyCode,
  String number,
) {
  return ElevatedButton(
    onPressed: () =>
        buttonHandler?.onShortPress(RemoteKeyInject_RemoteKeyCode.KEYCODE_8),
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(250, 0, 0, 9),
      minimumSize: Size(60.0, 60.0),
      padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
      shape: CircleBorder(),
    ),
    child: Text("8", style: TextStyle(fontSize: 20, color: Colors.white)),
  );
}
