import 'package:android_tv_remote/core/services/models/discovered_tv_list.dart';
import 'package:android_tv_remote/core/services/tv_remote_client.dart';
import 'package:android_tv_remote/core/themes/app_colors.dart';
import 'package:android_tv_remote/core/themes/app_spacing.dart';
import 'package:android_tv_remote/core/themes/app_text_styles.dart';
import 'package:android_tv_remote/core/utils/discover_android_tvs.dart';
import 'package:android_tv_remote/core/utils/discover_device.dart';
import 'package:android_tv_remote/features/welcome/widget/expanding_bar_animation.dart';
// import 'package:android_tv_remote/features/welcome/widget/expanding_bar_animation_simple.dart';
import 'package:flutter/material.dart';
import 'package:android_tv_remote/features/home/logic/notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

const port = 6466;

class WelcomeModal extends StatefulWidget {
  const WelcomeModal({super.key});
  @override
  State<WelcomeModal> createState() => _WelcomeModalState();
}

class _WelcomeModalState extends State<WelcomeModal> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPreferences? _prefs;
  List<DiscoveredTvList> data = [];
  bool _searching = true;
  final DiscoverDevice discoverDevice = DiscoverDevice();
  @override
  void initState() {
    super.initState();
    _loadPreferences();
    // discoverAndroidTVs();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _searching = true;
    });
    data.clear();
    // final discovered = await discoverDevice.init();
    // print(discoverDevice.searching);
    final discovered = await discoverAndroidTVs();
    // print(discovered);
    if (!mounted) return;
    setState(() {
      data = discovered;
    });
    setState(() {
      _searching = false;
    });
  }

  Future<void> setTVData(DiscoveredTvList item) async {
    final newValue = DiscoveredTvList(
      friendlyName: item.friendlyName,
      host: item.host,
      isConnected: true,
      port: item.port,
      scheme: item.scheme,
    );

    appDataNotifier.value = newValue;

    //  host: '192.168.1.185',
    final host = item.host;
    // print(host);
    final prefHost = _prefs!.getString('atv_key_$host');
    if (prefHost != null) {
      Navigator.of(context).pop();
      return;
    }

    final tvRemoteClient = TvRemoteClient(host: item.host!);
    final alreadyPaired = await tvRemoteClient.initialize();
    if (!alreadyPaired) {
      if (!mounted) return;
      await tvRemoteClient.authenticate(context, mounted);
    }
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final AppTextStyles textStyles = AppTextStyles(
      screenHeight: MediaQuery.of(context).size.height,
      screenWidth: MediaQuery.of(context).size.width,
    );
    AppSpacing spacing = AppSpacing(
      screenHeight: MediaQuery.of(context).size.height,
      screenWidth: MediaQuery.of(context).size.width,
    );
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondary,

      appBar: AppBar(
        // actionsPadding: EdgeInsets.only(right: spacing.paddingInline()),
        title: Text(
          "Connect your TV",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: textStyles.fontSize2xl(),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: CloseButton(
          style: ButtonStyle(
            iconSize: WidgetStateProperty.all(textStyles.fontSize2xl()),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
        ),
        backgroundColor: AppColors.secondary,
      ), // Transparent dark overlay
      body: Padding(
        padding: EdgeInsets.all(spacing.paddingInline()),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  "Select the device you want to connect to or activate a previously connected device.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: textStyles.fontSizeXl(),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Expanded(
              child: Container(
                // height: double.minPositive,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: AppColors.box,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowPrimary, // shadow color
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
                      color: Color(0xFF0F0F31),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                        child: Text(
                          "Make sure your device is connected to same WiFi network as your phone or tablet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color.fromARGB(166, 255, 255, 255),
                            fontSize: textStyles.fontSizeLg(),
                          ),
                        ),
                      ),
                    ),
                    // AnimatedContainer(duration: duration),
                    if (_searching) ExpandingBarAnimation(),

                    Expanded(
                      flex: 5,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(spacing.paddingInline()),
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
                                                item.friendlyName!,
                                                style: TextStyle(
                                                  fontSize: textStyles
                                                      .fontSizeLg(),
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                _prefs?.getString(
                                                          'atv_key_${item.host}',
                                                        ) !=
                                                        null
                                                    ? "Not Connected"
                                                    : "New",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: const Color.fromARGB(
                                                    166,
                                                    255,
                                                    255,
                                                    255,
                                                  ),
                                                  fontSize: textStyles
                                                      .fontSizeLg(),
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
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Color.fromARGB(255, 15, 15, 49),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                          child: TextButton(
                            onPressed: () => _loadData(),
                            child: Wrap(
                              spacing: 10.0,
                              children: [
                                Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                  size: textStyles.fontSizeXl() * 1.3,
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
                                    fontSize: textStyles.fontSizeXl(),
                                  ),
                                ),
                              ],
                            ),
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
