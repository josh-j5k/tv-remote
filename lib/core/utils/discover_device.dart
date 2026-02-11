// import 'package:flutter/material.dart';
import 'package:android_tv_remote/core/services/models/discovered_tv_list.dart';
import 'package:android_tv_remote/features/home/logic/notifier.dart';
import 'package:upnp2/upnp.dart'; // <<< SWITCHED to upnp2
import 'dart:async';

Future<List<DiscoveredTvList>> discoverDIALDevices() async {
  List<DiscoveredTvList> data = [];
  final disc = DeviceDiscoverer();

  data.add(
    DiscoveredTvList(
      friendlyName: "Star TV UHD",
      host: "192.168.1.185",
      isConnected: false,
      port: 8008,
      scheme: "http",
    ),
  );
  await disc.start(ipv6: false);
  disc.quickDiscoverClients().listen(
    (client) async {
      // Check if this might be a DIAL device before fetching
      // final usn = client.usn?.toLowerCase() ?? '';
      // final server = client.server?.toLowerCase() ?? '';
      // bool isLikelyAndroidTV =
      //     usn.contains('android') ||
      //     usn.contains('nfandroid') ||
      //     server.contains('chromecast');

      bool isValidLocation =
          client.location != null && client.location!.contains(".xml");

      if (isValidLocation) {
        final dev = await client.getDevice();
        if (dev != null &&
            dev.deviceType == 'urn:dial-multiscreen-org:device:dial:1') {
          final uri = Uri.parse(dev.url!);
          data.add(
            DiscoveredTvList(
              friendlyName: dev.friendlyName!,
              host: uri.host,
              isConnected: appDataNotifier.value.host == uri.host,
              port: uri.port,
              scheme: uri.scheme,
            ),
          );
        }
      }
    },
    onError: (error) {
      // Catch stream-level errors
      print("Stream error: $error");
      // Stream continues
    },
  );
  return data;
}
