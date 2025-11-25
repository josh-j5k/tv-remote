import 'package:flutter/material.dart';
import 'package:remote_app/data/tv_remote.dart';
import 'package:remote_app/features/home/logic/notifier.dart';
import 'package:remote_app/features/welcome/page/welcome_page.dart';
import 'package:remote_app/features/home/logic/observer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:remote_app/src/generated/keycodes.pb.dart';

final btnBgColor = Color.fromARGB(255, 18, 18, 18);
final btnTextColor = Color.fromARGB(255, 215, 215, 215);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  ModalRoute? _route;
  TvRemoteClient? _remoteClient;
  SharedPreferences? _prefs;
  final data = appDataNotifier.value;
  bool _isMuted = false;
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _route ??= ModalRoute.of(context);
    routeObserver.subscribe(this, _route!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  // 👇 THIS IS THE IMPORTANT METHOD!
  @override
  void didPopNext() {
    initializeRemoteClient();
  }

  Future<void> initializeRemoteClient() async {
    if (data['host'] != null) {
      _remoteClient = TvRemoteClient(host: data['host']);
      final alreadyPaired = await _remoteClient!.initialize();
      if (!alreadyPaired) {
        return;
      }
      _remoteClient!.connect();
    }
  }

  //  TvRemoteClient? _remoteClient;
  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Color.fromARGB(250, 0, 0, 9),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(30.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ValueListenableBuilder(
                        valueListenable: appDataNotifier,
                        builder: (context, appData, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appData["friendlyName"] ??
                                        'Universal Remote Control',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 224, 224, 224),
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Text(
                                    appData['isConnected']
                                        ? 'Connected'
                                        : 'TV is not connected',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              !appData['isConnected']
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: btnBgColor,
                                        minimumSize: Size(40.0, 40.0),
                                        padding: EdgeInsets.fromLTRB(
                                          25,
                                          12,
                                          25,
                                          12,
                                        ),
                                      ),
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const WelcomeModal();
                                          },
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.public,
                                        size: 30,
                                        color: btnTextColor,
                                      ),
                                    )
                                  : SizedBox.shrink(),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: btnBgColor,
                              minimumSize: Size(40.0, 40.0),
                              padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            ),
                            onPressed: () async {
                              await _remoteClient?.sendKeyCommand(
                                RemoteKeyInject_RemoteKeyCode.KEYCODE_POWER,
                              );
                            },
                            child: Icon(
                              Icons.power_settings_new,
                              size: 30,
                              color: const Color.fromARGB(255, 255, 31, 98),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 18, 18, 18),
                              minimumSize: Size(40, 40),
                              padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            ),
                            onPressed: () async {
                              await _remoteClient?.sendKeyCommand(
                                RemoteKeyInject_RemoteKeyCode.KEYCODE_SETTINGS,
                              );
                            },
                            child: Icon(
                              Icons.settings,
                              size: 30,
                              color: btnTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: btnBgColor,
                                    minimumSize: Size(75.0, 48.0),
                                    padding: EdgeInsets.fromLTRB(
                                      0.0,
                                      15.0,
                                      0.0,
                                      15.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                      ),
                                    ),
                                  ),

                                  onPressed: () async {
                                    await _remoteClient?.sendKeyCommand(
                                      RemoteKeyInject_RemoteKeyCode
                                          .KEYCODE_CHANNEL_UP,
                                    );
                                  },
                                  child: Icon(
                                    Icons.keyboard_arrow_up,
                                    size: 30,
                                    color: btnTextColor,
                                  ),
                                ),
                                Container(
                                  color: btnBgColor,
                                  width: 75.0,
                                  child: Center(
                                    child: Text(
                                      "Ch",
                                      style: TextStyle(
                                        backgroundColor: btnBgColor,
                                        color: Colors.grey,
                                        height: 1.0,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: btnBgColor,
                                    minimumSize: Size(75.0, 48.0),
                                    padding: EdgeInsets.fromLTRB(
                                      0.0,
                                      15.0,
                                      0.0,
                                      15.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0),
                                      ),
                                    ),
                                  ),

                                  onPressed: () async {
                                    await _remoteClient?.sendKeyCommand(
                                      RemoteKeyInject_RemoteKeyCode
                                          .KEYCODE_CHANNEL_DOWN,
                                    );
                                  },
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                    color: btnTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  spacing: 15.0,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color.fromARGB(
                                          255,
                                          18,
                                          18,
                                          18,
                                        ),
                                        minimumSize: Size(40, 40),
                                        padding: EdgeInsets.fromLTRB(
                                          20,
                                          12,
                                          20,
                                          12,
                                        ),
                                      ),
                                      onPressed: () async {
                                        await _remoteClient?.sendKeyCommand(
                                          RemoteKeyInject_RemoteKeyCode
                                              .KEYCODE_TV_SATELLITE,
                                        );
                                      },
                                      child: Icon(
                                        Icons.search,
                                        size: 30,
                                        color: btnTextColor,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color.fromARGB(
                                          255,
                                          18,
                                          18,
                                          18,
                                        ),
                                        minimumSize: Size(40, 40),
                                        padding: EdgeInsets.fromLTRB(
                                          20.0,
                                          12,
                                          20.0,
                                          12,
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (_isMuted) {
                                          await _remoteClient?.sendKeyCommand(
                                            RemoteKeyInject_RemoteKeyCode
                                                .KEYCODE_VOLUME_UP,
                                          );
                                          setState(() {
                                            _isMuted = false;
                                          });
                                        } else {
                                          await _remoteClient?.sendKeyCommand(
                                            RemoteKeyInject_RemoteKeyCode
                                                .KEYCODE_MUTE,
                                          );
                                          setState(() {
                                            _isMuted = true;
                                          });
                                        }
                                      },
                                      child: Icon(
                                        !_isMuted
                                            ? Icons.volume_up
                                            : Icons.volume_off,
                                        size: 30,
                                        color: btnTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 14.0, 0, 0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromARGB(
                                        255,
                                        18,
                                        18,
                                        18,
                                      ),
                                      minimumSize: Size(40, 40),
                                      padding: EdgeInsets.fromLTRB(
                                        40.0,
                                        12.0,
                                        40.0,
                                        12.0,
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      spacing: 5.0,
                                      children: [
                                        Icon(
                                          Icons.apps,
                                          size: 30,
                                          color: btnTextColor,
                                        ),
                                        Text(
                                          "Apps",
                                          style: TextStyle(color: btnTextColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: btnBgColor,
                                    minimumSize: Size(75.0, 48.0),
                                    padding: EdgeInsets.fromLTRB(
                                      0.0,
                                      15.0,
                                      0.0,
                                      15.0,
                                    ),

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                      ),
                                    ),
                                  ),

                                  onPressed: () async {
                                    await _remoteClient?.sendKeyCommand(
                                      RemoteKeyInject_RemoteKeyCode
                                          .KEYCODE_VOLUME_UP,
                                    );
                                  },
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 30.0,
                                      color: btnTextColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: btnBgColor,
                                  width: 75.0,
                                  child: Center(
                                    child: Text(
                                      "Vol",
                                      style: TextStyle(
                                        backgroundColor: btnBgColor,
                                        color: Colors.grey,
                                        height: 1.0,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: btnBgColor,
                                    minimumSize: Size(75.0, 48.0),
                                    padding: EdgeInsets.fromLTRB(
                                      0.0,
                                      15.0,
                                      0.0,
                                      15.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0),
                                      ),
                                    ),
                                  ),

                                  onPressed: () async {
                                    await _remoteClient?.sendKeyCommand(
                                      RemoteKeyInject_RemoteKeyCode
                                          .KEYCODE_VOLUME_DOWN,
                                    );
                                  },
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      size: 30.0,
                                      color: btnTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: btnBgColor,
                              minimumSize: Size(40.0, 40.0),
                              padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            ),
                            onPressed: () async {
                              await _remoteClient?.sendKeyCommand(
                                RemoteKeyInject_RemoteKeyCode.KEYCODE_MENU,
                              );
                            },
                            child: Icon(
                              Icons.menu,
                              size: 30,
                              color: btnTextColor,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 18, 18, 18),
                              minimumSize: Size(40, 40),
                              padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            ),
                            onPressed: () async {
                              await _remoteClient?.sendKeyCommand(
                                RemoteKeyInject_RemoteKeyCode.KEYCODE_BACK,
                              );
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: btnTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(66, 150, 131, 131),
                          // borderRadius: BorderRadius.circular(50.0),
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: btnBgColor,
                                  minimumSize: Size(40.0, 40.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.horizontal(),
                                  ),
                                  padding: EdgeInsets.fromLTRB(
                                    100,
                                    22,
                                    100,
                                    22,
                                  ),
                                ),
                                onPressed: () async {
                                  await _remoteClient?.sendKeyCommand(
                                    RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_DPAD_UP,
                                  );
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_up,
                                  size: 30,
                                  color: btnTextColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: btnBgColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(),
                                      ),
                                      minimumSize: Size(40.0, 40.0),
                                      padding: EdgeInsets.fromLTRB(
                                        35,
                                        30,
                                        27,
                                        30,
                                      ),
                                    ),
                                    onPressed: () async {
                                      await _remoteClient?.sendKeyCommand(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_DPAD_LEFT,
                                      );
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_left,
                                      size: 30,
                                      color: btnTextColor,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: btnBgColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(),
                                      ),
                                      minimumSize: Size(40.0, 40.0),
                                      padding: EdgeInsets.all(30.5),
                                    ),
                                    onPressed: () async {
                                      await _remoteClient?.sendKeyCommand(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_DPAD_CENTER,
                                      );
                                    },
                                    child: Text(
                                      "OK",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: btnBgColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(),
                                      ),
                                      minimumSize: Size(40.0, 40.0),
                                      padding: EdgeInsets.fromLTRB(
                                        35,
                                        30,
                                        27,
                                        30,
                                      ),
                                    ),
                                    onPressed: () async {
                                      await _remoteClient?.sendKeyCommand(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_DPAD_RIGHT,
                                      );
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 30,
                                      color: btnTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: btnBgColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(),
                                  ),
                                  minimumSize: Size(40.0, 40.0),
                                  padding: EdgeInsets.fromLTRB(
                                    100,
                                    22,
                                    100,
                                    22,
                                  ),
                                ),
                                onPressed: () async {
                                  await _remoteClient?.sendKeyCommand(
                                    RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_DPAD_DOWN,
                                  );
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30,
                                  color: btnTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30.0, 0, 30.0),
                      child: Container(
                        // padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: btnBgColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: btnBgColor,
                                minimumSize: Size(40, 40),
                                padding: EdgeInsets.fromLTRB(
                                  25.0,
                                  12.0,
                                  25.0,
                                  12.0,
                                ),
                              ),
                              onPressed: () async {
                                await _remoteClient?.sendKeyCommand(
                                  RemoteKeyInject_RemoteKeyCode.KEYCODE_HOME,
                                );
                              },
                              child: Icon(
                                Icons.home,
                                size: 30,
                                color: btnTextColor,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: btnBgColor,
                                minimumSize: Size(40, 40),
                                padding: EdgeInsets.fromLTRB(
                                  25.0,
                                  12.0,
                                  25.0,
                                  12.0,
                                ),
                              ),
                              onPressed: () {},
                              child: Icon(
                                Icons.keyboard,
                                size: 30,
                                color: btnTextColor,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: btnBgColor,
                                minimumSize: Size(40, 40),
                                padding: EdgeInsets.fromLTRB(
                                  25.0,
                                  12.0,
                                  25.0,
                                  12.0,
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "123",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: btnTextColor,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: btnBgColor,
                                minimumSize: Size(40.0, 40.0),
                                padding: EdgeInsets.fromLTRB(
                                  25.0,
                                  12.0,
                                  25.0,
                                  12.0,
                                ),
                              ),
                              onPressed: () async {},
                              child: Text(
                                "Exit",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: btnTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 18, 18, 18),
                          minimumSize: Size(40, 40),
                          padding: EdgeInsets.fromLTRB(25.0, 12.0, 25.0, 12.0),
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.settings_remote,
                          size: 30,
                          color: btnTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
