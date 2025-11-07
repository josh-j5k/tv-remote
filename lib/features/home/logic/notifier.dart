import 'package:flutter/material.dart';

ValueNotifier<Map<String, dynamic>> appDataNotifier =
    ValueNotifier<Map<String, dynamic>>({
      "friendlyName": null,
      'isConnected': false,
      'secret': null,
      'host': null,
      'scheme': null,
      'wsPairingPort': null,
      'wsCommandPort': null,
      'port': null,
    });
// ValueNotifier<bool> isConnectedNotifier = ValueNotifier<bool>(false);
// ValueNotifier<String?> tvUrlBaseNotifier = ValueNotifier<String?>(null);
