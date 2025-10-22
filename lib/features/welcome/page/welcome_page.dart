import 'package:flutter/material.dart';
import 'package:remote_app/features/home/logic/notifier.dart';
// import 'package:remote_app/core/utils/discover_device.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upnp2/upnp.dart' hide Icon; // <<< SWITCHED to upnp2
import 'dart:async';

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
    discoverDIALDevices();
  }

  void setTVData(item) {
    final newValue = Map<String, dynamic>.from(appDataNotifier.value)
      ..['isConnected'] = true
      ..['friendlyName'] = item['friendlyName']
      ..['urlBase'] = item['urlBase']
      ..['location'] = item['location'];
    appDataNotifier.value = newValue;
    Navigator.of(context).pop();
  }

  List<Map<String, String?>> data = [];
  Future<void> discoverDIALDevices() async {
    final disc = DeviceDiscoverer();
    await disc.start(ipv6: false);
    disc.quickDiscoverClients().listen((client) async {
      try {
        final dev = await client.getDevice();
        int lastIndex = dev!.urlBase!.lastIndexOf(":");
        String location = dev!.urlBase!.substring(0, lastIndex);
        setState(() {
          data.add({
            "friendlyName": dev!.friendlyName,
            "urlBase": dev.urlBase,
            'location': location,
          });
        });
      } catch (e, stack) {
        // print('ERROR: $e - ${client.location}');
        // print(stack);
      }
      // super.initState();
    });
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
