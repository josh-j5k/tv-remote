// import 'package:flutter/material.dart';
import 'package:upnp2/upnp.dart'; // <<< SWITCHED to upnp2
import 'dart:async';

Future<void> discoverDIALDevices() async {
  final disc = DeviceDiscoverer();
  await disc.start(ipv6: false);
  disc.quickDiscoverClients().listen((client) async {
    try {
      final dev = await client.getDevice();
    } catch (e, stack) {
      // print('ERROR: $e - ${client.location}');
      // print(stack);
    }
  });
}
