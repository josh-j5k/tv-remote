import 'package:flutter/material.dart';

ValueNotifier<Map<String, dynamic>> appDataNotifier =
    ValueNotifier<Map<String, dynamic>>({
      "friendlyName": null,
      'isConnected': false,
      'handShakeKey': null,
      'urlBase': null,
      'location': null,
    });
// ValueNotifier<bool> isConnectedNotifier = ValueNotifier<bool>(false);
// ValueNotifier<String?> tvUrlBaseNotifier = ValueNotifier<String?>(null);
