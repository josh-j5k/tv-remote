import 'dart:math';
import 'package:flutter/material.dart';
import 'package:remote_app/data/remote_button_handler.dart';
import 'package:remote_app/data/tv_remote.dart';
import 'package:remote_app/features/home/logic/notifier.dart';
import 'package:remote_app/features/home/page/apps_page.dart';
import 'package:remote_app/features/home/page/reconnecting_widget.dart';
import 'package:remote_app/features/welcome/page/welcome_page.dart';
import 'package:remote_app/features/home/logic/observer.dart';
import 'package:remote_app/src/generated/keycodes.pb.dart';

final btnBgColor = Color.fromARGB(255, 18, 18, 18);
final btnTextColor = Color.fromARGB(255, 215, 215, 215);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with RouteAware, WidgetsBindingObserver {
  ModalRoute? _route;
  TvRemoteClient? _remoteClient;
  bool _isMuted = false;
  RemoteButtonHandler? _buttonHandler;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshData();
    }
  }

  void tapDown(RemoteKeyInject_RemoteKeyCode keyCode) async {
    await _buttonHandler?.onKeyButtonDown(
      keyCode,
      longPressThreshold: Duration(milliseconds: 1000),
      repeatInterval: Duration(milliseconds: 150),
      enableRepeat: true,
    );
  }

  void tapUp(RemoteKeyInject_RemoteKeyCode keyCode) async {
    await _buttonHandler?.onButtonUp(keyCode);
  }

  void tapCancel(RemoteKeyInject_RemoteKeyCode keyCode) {
    _buttonHandler?.onButtonCancel(keyCode);
  }

  void _refreshData() {
    if (appDataNotifier.value['isConnected'] == true) {
      showReconnectingDialog(context);
      initializeRemoteClient().then((_) {
        if (!mounted) return;
        Navigator.of(context).pop();
      });
    }
  }

  @override
  void didPopNext() {
    initializeRemoteClient();
  }

  void showKeyboardDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Keyboard Input'),
          content: TextField(
            autofocus: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Type your text here'),
            onChanged: (value) async {
              await _remoteClient?.sendText(value);
            },
            onSubmitted: (String value) async {
              await _remoteClient?.sendText(value);
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  void showNumbersKeyboard() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 15, 15, 49),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
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
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(250, 0, 0, 9),
                            minimumSize: Size(60.0, 60.0),
                            padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            shape: CircleBorder(),
                          ),
                          child: Text(
                            "1",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(250, 0, 0, 9),
                            minimumSize: Size(60.0, 60.0),
                            padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            shape: CircleBorder(),
                          ),
                          child: Text(
                            "2",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(250, 0, 0, 9),
                            minimumSize: Size(60.0, 60.0),
                            padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            shape: CircleBorder(),
                          ),
                          child: Text(
                            "3",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 20,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(250, 0, 0, 9),
                            minimumSize: Size(60.0, 60.0),
                            padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            shape: CircleBorder(),
                          ),
                          child: Text(
                            "4",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(250, 0, 0, 9),
                            minimumSize: Size(60.0, 60.0),
                            padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            shape: CircleBorder(),
                          ),
                          child: Text(
                            "5",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(250, 0, 0, 9),
                            minimumSize: Size(60.0, 60.0),
                            padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            shape: CircleBorder(),
                          ),
                          child: Text(
                            "6",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 20,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(250, 0, 0, 9),
                            minimumSize: Size(60.0, 60.0),
                            padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            shape: CircleBorder(),
                          ),
                          child: Text(
                            "7",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(250, 0, 0, 9),
                            minimumSize: Size(60.0, 60.0),
                            padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            shape: CircleBorder(),
                          ),
                          child: Text(
                            "8",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(250, 0, 0, 9),
                            minimumSize: Size(60.0, 60.0),
                            padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            shape: CircleBorder(),
                          ),
                          child: Text(
                            "9",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(250, 0, 0, 9),
                          minimumSize: Size(60.0, 60.0),
                          padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                          shape: CircleBorder(),
                        ),
                        child: Text(
                          "0",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
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

  Future<void> initializeRemoteClient() async {
    if (appDataNotifier.value['host'] != null) {
      _remoteClient = TvRemoteClient(host: appDataNotifier.value['host']);
      final alreadyPaired = await _remoteClient!.initialize();
      if (!alreadyPaired) {
        return;
      }
      await _remoteClient?.connect();
      _buttonHandler = RemoteButtonHandler(_remoteClient);
    }
  }

  Future<void> tryAllInputKeycodes() async {
    final keycodes = [
      178, // KEYCODE_TV_INPUT (standard)
      243, // KEYCODE_TV_INPUT_HDMI_1
      244, // KEYCODE_TV_INPUT_HDMI_2
      245, // KEYCODE_TV_INPUT_HDMI_3
      246, // KEYCODE_TV_INPUT_HDMI_4
      247, // KEYCODE_TV_INPUT_COMPOSITE_1
      249, // KEYCODE_TV_INPUT_COMPONENT_1
      242, // KEYCODE_TV_ANTENNA_CABLE
      170, // KEYCODE_TV (might open TV menu)
      176, // KEYCODE_SETTINGS
      241, // KEYCODE_TV_NETWORK
      222, // KEYCODE_MEDIA_AUDIO_TRACK (some TVs use this)
      240, // KEYCODE_STB_INPUT (set-top box input)
    ];

    for (var code in keycodes) {
      print('Trying keycode: $code');
      await _remoteClient?.sendKeyCommand(
        RemoteKeyInject_RemoteKeyCode.valueOf(code) ??
            RemoteKeyInject_RemoteKeyCode.KEYCODE_UNKNOWN,
      );
      await Future.delayed(Duration(milliseconds: 1500));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final double divider = height * 0.03;
    final double paddingInline = width * 0.07;
    final double centerSpacing = 35.0;
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Color.fromARGB(248, 0, 3, 4),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(paddingInline),
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
                      padding: EdgeInsets.fromLTRB(0.0, divider, 0.0, 0.0),
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
                              _remoteClient?.sendKeyCommand(
                                RemoteKeyInject_RemoteKeyCode.KEYCODE_TV_INPUT,
                              );
                            },
                            child: Icon(
                              Icons.input,
                              size: 30,
                              color: btnTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, divider, 0, .0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          SizedBox(
                            height: height * 0.145,
                            child: Column(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTapDown: (_) async {
                                      tapDown(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_CHANNEL_UP,
                                      );
                                    },
                                    // Pass the keyCode
                                    onTapUp: (_) async {
                                      tapUp(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_CHANNEL_UP,
                                      );
                                    },
                                    onTapCancel: () {
                                      tapCancel(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_CHANNEL_UP,
                                      );
                                    },

                                    child: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Container(
                                        //  minimumSize: Size(75.0, 48.0),
                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: btnBgColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(30.0),
                                          ),
                                        ),

                                        child: Icon(
                                          Icons.keyboard_arrow_up,
                                          color: btnTextColor,
                                          size: 30,
                                        ),
                                      ),
                                    ),
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
                                Expanded(
                                  child: GestureDetector(
                                    onTapDown: (_) async {
                                      tapDown(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_CHANNEL_DOWN,
                                      );
                                    },
                                    onTapUp: (_) async {
                                      tapUp(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_CHANNEL_DOWN,
                                      );
                                    },
                                    onTapCancel: () {
                                      tapCancel(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_CHANNEL_DOWN,
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Container(
                                        //  minimumSize: Size(75.0, 48.0),
                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: btnBgColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(30.0),
                                            bottomRight: Radius.circular(30.0),
                                          ),
                                        ),

                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: btnTextColor,
                                          size: 30,
                                        ),
                                      ),
                                    ),
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
                                              .KEYCODE_SEARCH,
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
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return AppsPage(
                                            launchApp: _remoteClient != null
                                                ? (String deepLink) async {
                                                    await _remoteClient!
                                                        .launchApp(deepLink);
                                                  }
                                                : null,
                                          );
                                        },
                                      ),
                                    ),
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
                            height: height * 0.145,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTapDown: (_) async {
                                      tapDown(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_VOLUME_UP,
                                      );
                                    },
                                    onTapUp: (_) async {
                                      tapUp(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_VOLUME_UP,
                                      );
                                    },
                                    onTapCancel: () {
                                      tapCancel(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_VOLUME_UP,
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Container(
                                        //  minimumSize: Size(75.0, 48.0),
                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: btnBgColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(30.0),
                                          ),
                                        ),

                                        child: Icon(
                                          Icons.add,
                                          color: btnTextColor,
                                          size: 30,
                                        ),
                                      ),
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
                                Expanded(
                                  child: GestureDetector(
                                    onTapDown: (_) async {
                                      tapDown(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_VOLUME_DOWN,
                                      );
                                    },
                                    onTapUp: (_) async {
                                      tapUp(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_VOLUME_DOWN,
                                      );
                                    },
                                    onTapCancel: () {
                                      tapCancel(
                                        RemoteKeyInject_RemoteKeyCode
                                            .KEYCODE_VOLUME_DOWN,
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Container(
                                        //  minimumSize: Size(75.0, 48.0),
                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: btnBgColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(30.0),
                                            bottomRight: Radius.circular(30.0),
                                          ),
                                        ),

                                        child: Icon(
                                          Icons.remove,
                                          color: btnTextColor,
                                          size: 30,
                                        ),
                                      ),
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
                      padding: EdgeInsets.fromLTRB(0, divider, 0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: btnBgColor,
                              minimumSize: Size(40.0, 40.0),
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              centerSpacing,
                              0,
                              0.0,
                            ),
                            child: SizedBox(
                              width: 80.0,
                              child: GestureDetector(
                                onTapDown: (_) async {
                                  tapDown(
                                    RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_DPAD_UP,
                                  );
                                },
                                onTapUp: (_) async {
                                  tapUp(
                                    RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_DPAD_UP,
                                  );
                                },
                                onTapCancel: () {
                                  tapCancel(
                                    RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_DPAD_UP,
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  decoration: BoxDecoration(
                                    color: btnBgColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Transform.rotate(
                                    angle: -pi / 2,
                                    child: Icon(
                                      Icons.play_arrow,
                                      size: 30,
                                      color: btnTextColor,
                                    ),
                                  ),
                                ),
                              ),
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
                                RemoteKeyInject_RemoteKeyCode.KEYCODE_HOME,
                              );
                            },
                            child: Icon(
                              Icons.home,
                              size: 30,
                              color: btnTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10.0,
                        children: [
                          SizedBox(
                            width: 80.0,
                            child: GestureDetector(
                              onTapDown: (_) async {
                                tapDown(
                                  RemoteKeyInject_RemoteKeyCode
                                      .KEYCODE_DPAD_LEFT,
                                );
                              },
                              onTapUp: (_) async {
                                tapUp(
                                  RemoteKeyInject_RemoteKeyCode
                                      .KEYCODE_DPAD_LEFT,
                                );
                              },
                              onTapCancel: () {
                                tapCancel(
                                  RemoteKeyInject_RemoteKeyCode
                                      .KEYCODE_DPAD_LEFT,
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                                decoration: BoxDecoration(
                                  color: btnBgColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                child: Transform.rotate(
                                  angle: -pi / 1,
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 30,
                                    color: btnTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: btnBgColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                              ),
                              // minimumSize: Size(30.0, 30.0),
                              padding: EdgeInsets.all(25.5),
                            ),
                            onPressed: () async {
                              await _remoteClient?.sendKeyCommand(
                                RemoteKeyInject_RemoteKeyCode
                                    .KEYCODE_DPAD_CENTER,
                              );
                            },
                            child: Text("OK", style: TextStyle(fontSize: 20.0)),
                          ),
                          SizedBox(
                            width: 80.0,
                            child: GestureDetector(
                              onTapDown: (_) async {
                                tapDown(
                                  RemoteKeyInject_RemoteKeyCode
                                      .KEYCODE_DPAD_RIGHT,
                                );
                              },
                              onTapUp: (_) async {
                                tapUp(
                                  RemoteKeyInject_RemoteKeyCode
                                      .KEYCODE_DPAD_RIGHT,
                                );
                              },
                              onTapCancel: () {
                                tapCancel(
                                  RemoteKeyInject_RemoteKeyCode
                                      .KEYCODE_DPAD_RIGHT,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: btnBgColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                  color: btnTextColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              centerSpacing,
                            ),
                            child: SizedBox(
                              width: 80.0,
                              child: GestureDetector(
                                onTapDown: (_) async {
                                  tapDown(
                                    RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_DPAD_DOWN,
                                  );
                                },
                                onTapUp: (_) async {
                                  tapUp(
                                    RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_DPAD_DOWN,
                                  );
                                },
                                onTapCancel: () {
                                  tapCancel(
                                    RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_DPAD_DOWN,
                                  );
                                },

                                child: Container(
                                  decoration: BoxDecoration(
                                    color: btnBgColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  child: Transform.rotate(
                                    angle: pi / 2,
                                    child: Icon(
                                      Icons.play_arrow,
                                      size: 30,
                                      color: btnTextColor,
                                    ),
                                  ),
                                ),
                              ),
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
                      padding: EdgeInsets.fromLTRB(0, divider, 0, 0.0),
                      child: Container(
                        // padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: btnBgColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: btnBgColor,
                                // minimumSize: Size(40, 40),
                                padding: EdgeInsets.fromLTRB(
                                  25.0,
                                  12.0,
                                  15.0,
                                  12.0,
                                ),
                              ),
                              onPressed: () => showKeyboardDialog(),
                              child: Icon(
                                Icons.keyboard,
                                size: 30,
                                color: btnTextColor,
                              ),
                            ),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: btnBgColor,
                                // minimumSize: Size(40, 40),
                                padding: EdgeInsets.fromLTRB(
                                  10.0,
                                  12.0,
                                  10.0,
                                  12.0,
                                ),
                              ),
                              onPressed: () => showNumbersKeyboard(),
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
                                minimumSize: Size(40, 40),
                                padding: EdgeInsets.fromLTRB(
                                  14.0,
                                  12.0,
                                  14.0,
                                  12.0,
                                ),
                              ),
                              onPressed: () async {
                                await _remoteClient?.launchApp(
                                  "com.netflix.ninja",
                                );
                              },
                              child: Text(
                                "NETFLIX",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.red,
                                ),
                              ),
                            ),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                minimumSize: Size(40.0, 40.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0), // Large curve
                                    topRight: Radius.circular(
                                      60,
                                    ), // Sharp corner
                                    bottomLeft: Radius.circular(
                                      0,
                                    ), // Slight curve
                                    bottomRight: Radius.circular(
                                      60,
                                    ), // Dramatic curve
                                  ),
                                ),
                                padding: EdgeInsets.fromLTRB(
                                  15.0,
                                  12.0,
                                  15.0,
                                  12.0,
                                ),
                              ),
                              onPressed: () async {
                                await _remoteClient?.launchApp(
                                  "https://www.youtube.com",
                                );
                              },
                              child: Text(
                                "YouTube",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: btnTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, divider, 0, 0.0),
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 18, 18, 18),
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
                            Icons.settings_remote,
                            size: 30,
                            color: btnTextColor,
                          ),
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
