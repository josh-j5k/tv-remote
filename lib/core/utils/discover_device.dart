import 'dart:async';
import 'package:android_tv_remote/core/services/models/discovered_tv_list.dart';
import 'package:android_tv_remote/features/home/logic/notifier.dart';
import 'package:upnp2/upnp.dart';

class DiscoverDevice {
  bool searching = false;
  List<DiscoveredTvList> data = [];

  DiscoverDevice();

  Future<List<DiscoveredTvList>> init({
    Duration timeout = const Duration(seconds: 10),
  }) async {
    searching = true;
    data.clear();

    final completer = Completer<List<DiscoveredTvList>>();

    try {
      await discoverDIALDevices(completer);

      // Wait for discovery to complete or timeout
      return await completer.future.timeout(
        timeout,
        onTimeout: () {

          searching = false;
          return data;
        },
      );
    } catch (e) {
      print('❌ Discovery error: $e');
      searching = false;
      return data;
    }
  }

  Future<void> discoverDIALDevices(
    Completer<List<DiscoveredTvList>> completer,
  ) async {
    final disc = DeviceDiscoverer();
    // data.add(
    //   DiscoveredTvList(
    //     friendlyName: "Star UHD TV",
    //     host: "192.168.1.185",
    //     isConnected: false,
    //     port: 8008,
    //     scheme: "http",
    //   ),
    // );

    await disc.start(ipv6: false);

    disc.quickDiscoverClients().listen(
      (client) async {
        bool isValidLocation =
            client.location != null && client.location!.contains(".xml");

        if (isValidLocation) {
          try {
            final dev = await client.getDevice();
            if (dev != null &&
                dev.deviceType == 'urn:dial-multiscreen-org:device:dial:1') {
              final uri = Uri.parse(dev.url!);

              // Avoid duplicates
              if (!data.any((d) => d.host == uri.host)) {
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
          } catch (e) {
            print('⚠️ Error processing device: $e');
          }
        }
      },
      onError: (error) {
        print("❌ Stream error: $error");
        // Don't complete on error, continue discovering
      },
      onDone: () {
        searching = false;
        // Complete the future with the discovered devices
        if (!completer.isCompleted) {
          completer.complete(data);
        }
      },
      cancelOnError: false, // Continue on errors
    );
  }
}
