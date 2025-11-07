// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:remote_app/data/constants/constants.dart';
// import 'package:remote_app/data/test_pairing.dart';
import 'package:remote_app/data/tv_remote.dart';
import 'package:remote_app/features/home/logic/notifier.dart';
import 'package:multicast_dns/multicast_dns.dart';
// import 'package:remote_app/core/utils/discover_device.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upnp2/upnp.dart' hide Icon; // <<< SWITCHED to upnp2
import 'dart:async';

// import 'dart:core' as $core;
const port = 6466;

class WelcomeModal extends StatefulWidget {
  const WelcomeModal({super.key});
  @override
  State<WelcomeModal> createState() => _WelcomeModalState();
}

class _WelcomeModalState extends State<WelcomeModal> {
  @override
  void initState() {
    super.initState();
    // _loadPreferences();
    // discoverAndroidTVs();
    discoverDIALDevices();
  }

  Future<void> discoverAndroidTVs() async {
    final client = MDnsClient();
    await client.start();

    try {
      await for (final PtrResourceRecord ptr
          in client
              .lookup<PtrResourceRecord>(
                ResourceRecordQuery.serverPointer(
                  '_androidtvremote2._tcp.local',
                ),
              )
              .timeout(Duration(seconds: 10))) {
        print('\n═══════════════════════════════════');
        print('📺 Found PTR: ${ptr.domainName}');

        // Resolve SRV
        await for (final SrvResourceRecord srv
            in client
                .lookup<SrvResourceRecord>(
                  ResourceRecordQuery.service(ptr.domainName),
                )
                .timeout(Duration(seconds: 5))) {
          // Get TXT records (might contain important info)
          await for (final TxtResourceRecord txt
              in client
                  .lookup<TxtResourceRecord>(
                    ResourceRecordQuery.text(ptr.domainName),
                  )
                  .timeout(Duration(seconds: 5))) {
            print('📝 TXT Records:');
            // for (var entry in txt.texts) {
            //   print('   $entry');
            // }
          }

          // Get IPv4
          await for (final IPAddressResourceRecord ip
              in client
                  .lookup<IPAddressResourceRecord>(
                    ResourceRecordQuery.addressIPv4(srv.target),
                  )
                  .timeout(Duration(seconds: 5))) {
            // await testPortConnection(ip.address.address, srv.port);
            // await connectViaTCP(ip.address.address, srv.port);

            print('🌐 IPv4: ${ip.address.address}');
          }

          // Try IPv6 too
          try {
            await for (final IPAddressResourceRecord ip
                in client
                    .lookup<IPAddressResourceRecord>(
                      ResourceRecordQuery.addressIPv6(srv.target),
                    )
                    .timeout(Duration(seconds: 2))) {
              print('🌐 IPv6: ${ip.address.address}');
            }
          } catch (e) {
            print('⚠️  No IPv6');
          }
          print('═══════════════════════════════════\n');
        }
      }
    } catch (e) {
      print('❌ Error: $e');
    } finally {
      client.stop();
    }
  }

  // ignore: unused_local_variable
  Future<void> setTVData(item) async {
    final newValue = Map<String, dynamic>.from(appDataNotifier.value)
      ..['isConnected'] = true
      ..['friendlyName'] = item['friendlyName']
      ..['port'] = item['port']
      ..['host'] = item['host']
      ..['scheme'] = item['scheme'];
    appDataNotifier.value = newValue;

    final String link = item['host'];
    final String wss = link.replaceAll("http", "wss") + ":$port";
    final remote = TvRemoteClient(host: '192.168.1.185');
    final alreadyPaired = await remote.initialize();
    if (!alreadyPaired) {
      // Start pairing process
      await remote.startPairing();

      // // Wait for PIN to appear on TV
      // print('Enter the PIN shown on TV:');
      // final pin = stdin.readLineSync()!;

      // await remote.enterPairingCode(pin);

      // Wait for pairing to complete
      await Future.delayed(Duration(seconds: 2));
    }

    // Start pairing on port 6467

    // Navigator.of(context).pop();
  }

  List<Map<String, dynamic>> data = [];
  Future<void> discoverDIALDevices() async {
    final disc = DeviceDiscoverer();
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
            setState(() {
              data.add({
                "friendlyName": dev.friendlyName,
                "scheme": uri.scheme,
                "port": uri.port,
                'host': uri.host,
              });
            });
          }
        }
        // super.initState();
      },
      onError: (error) {
        // Catch stream-level errors
        print("Stream error: $error");
        // Stream continues
      },
    );
  }

  Future<void> _loadPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 7, 7, 21),
      appBar: AppBar(
        title: Text(
          "Connect your TV",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: CloseButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(249, 7, 7, 21),
      ), // Transparent dark overlay
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  "Select the device you want to connect to or activate a previously connected device.",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Expanded(
              child: Container(
                // height: double.minPositive,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 17, 17, 32),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: 0.2,
                      ), // shadow color
                      spreadRadius: 2, // how wide the shadow spreads
                      blurRadius: 10, // how soft the shadow looks
                      offset: const Offset(
                        0,
                        5,
                      ), // horizontal, vertical shadow offset
                    ),
                  ],
                ),
                width: double.maxFinite,
                margin: EdgeInsets.only(top: 25.0),
                child: Column(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 15, 15, 49),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                        child: Text(
                          "Make sure your device is connected to same WiFi network as your phone or tablet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color.fromARGB(166, 255, 255, 255),
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: SizedBox(
                          child: Column(
                            children: data.map((item) {
                              return Column(
                                children: [
                                  TextButton(
                                    onPressed: () => setTVData(item),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item['friendlyName']!,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "New",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: const Color.fromARGB(
                                                  166,
                                                  255,
                                                  255,
                                                  255,
                                                ),
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          size: 25.0,
                                          color: const Color.fromARGB(
                                            152,
                                            255,
                                            255,
                                            255,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(255, 15, 15, 49),
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Wrap(
                            spacing: 15.0,
                            children: [
                              Icon(
                                Icons.refresh,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              Text(
                                "Refresh",
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: SizedBox(
                child: Text(
                  "I don't see the device",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
