import 'dart:math';
import 'package:android_tv_remote/core/services/tv_command_processor.dart';
import 'package:android_tv_remote/core/themes/app_colors.dart';
import 'package:android_tv_remote/core/themes/app_spacing.dart';
import 'package:android_tv_remote/features/home/page/dialogs/show_keyboard_dialog.dart';
import 'package:android_tv_remote/features/home/page/dialogs/show_numbers_keyboard.dart';
import 'package:android_tv_remote/features/home/page/widgets/controls_widget.dart';
import 'package:android_tv_remote/features/home/page/widgets/d_pad_widget.dart';
import 'package:flutter/material.dart';
import 'package:android_tv_remote/core/services/tv_remote_button_handler.dart';
import 'package:android_tv_remote/core/services/tv_remote_client.dart';
import 'package:android_tv_remote/features/home/logic/notifier.dart';
import 'package:android_tv_remote/features/tv_apps/tv_apps_page.dart';
import 'package:android_tv_remote/features/home/page/dialogs/reconnecting_dialog.dart';
import 'package:android_tv_remote/features/welcome/page/welcome_page.dart';
import 'package:android_tv_remote/src/generated/keycodes.pb.dart';
import 'package:flutter/services.dart';
import 'package:android_tv_remote/core/observers/app_route_observer.dart';

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
  TvCommandProcessor? _commandProcessor;
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

  void _refreshData() {
    if (appDataNotifier.value.isConnected == true) {
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

  Future<void> initializeRemoteClient() async {
    if (appDataNotifier.value.host != null) {
      _remoteClient = TvRemoteClient(host: appDataNotifier.value.host!);
      final alreadyPaired = await _remoteClient!.initialize();
      if (!alreadyPaired) {
        return;
      }
      _commandProcessor = await _remoteClient?.connect();
      _buttonHandler = RemoteButtonHandler(_commandProcessor);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppSpacing spacing = AppSpacing(
      screenHeight: MediaQuery.of(context).size.height,
      screenWidth: MediaQuery.of(context).size.width,
    );

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: AppColors.primary,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(spacing.paddingInline()),
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
                                    appData.friendlyName ??
                                        'Universal Remote Control',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 224, 224, 224),
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Text(
                                    appData.isConnected
                                        ? 'Connected'
                                        : 'TV is not connected',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              !appData.isConnected
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.button,
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
                                        color: AppColors.text,
                                      ),
                                    )
                                  : SizedBox.shrink(),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0.0,
                        spacing.mdDivider(),
                        0.0,
                        0.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.button,
                              minimumSize: Size(40.0, 40.0),
                              padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            ),
                            onPressed: () => _buttonHandler?.onShortPress(
                              RemoteKeyInject_RemoteKeyCode.KEYCODE_POWER,
                            ),
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
                            onPressed: () => _buttonHandler?.onShortPress(
                              RemoteKeyInject_RemoteKeyCode.KEYCODE_TV_INPUT,
                            ),
                            child: Icon(
                              Icons.input,
                              size: 30,
                              color: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        spacing.mdDivider(),
                        0,
                        .0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          SizedBox(
                            height: spacing.lgDivider(),
                            child: Column(
                              children: [
                                Expanded(
                                  child: controls(
                                    _buttonHandler,
                                    RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_CHANNEL_UP,
                                    "top",
                                  ),
                                ),

                                Container(
                                  color: AppColors.button,
                                  width: 75.0,
                                  child: Center(
                                    child: Text(
                                      "Ch",
                                      style: TextStyle(
                                        backgroundColor: AppColors.button,
                                        color: Colors.grey,
                                        height: 1.0,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: controls(
                                    _buttonHandler,
                                    RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_CHANNEL_DOWN,
                                    "bottom",
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
                                      onPressed: () =>
                                          _buttonHandler?.onShortPress(
                                            RemoteKeyInject_RemoteKeyCode
                                                .KEYCODE_SEARCH,
                                          ),
                                      child: Icon(
                                        Icons.search,
                                        size: 30,
                                        color: AppColors.text,
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
                                          _buttonHandler?.onShortPress(
                                            RemoteKeyInject_RemoteKeyCode
                                                .KEYCODE_VOLUME_UP,
                                          );
                                          setState(() {
                                            _isMuted = false;
                                          });
                                        } else {
                                          _buttonHandler?.onShortPress(
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
                                        color: AppColors.text,
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
                                          return TvAppsPage(
                                            launchApp: _commandProcessor != null
                                                ? (String deepLink) async {
                                                    await _commandProcessor!
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
                                          color: AppColors.text,
                                        ),
                                        Text(
                                          "Apps",
                                          style: TextStyle(
                                            color: AppColors.text,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: spacing.lgDivider(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: controls(
                                    _buttonHandler,
                                    RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_VOLUME_UP,
                                    "top",
                                  ),
                                ),

                                Container(
                                  color: AppColors.button,
                                  width: 75.0,
                                  child: Center(
                                    child: Text(
                                      "Vol",
                                      style: TextStyle(
                                        backgroundColor: AppColors.button,
                                        color: Colors.grey,
                                        height: 1.0,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: controls(
                                    _buttonHandler,
                                    RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_VOLUME_DOWN,
                                    "bottom",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        spacing.mdDivider(),
                        0,
                        0.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.button,
                              minimumSize: Size(40.0, 40.0),
                              padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            ),
                            onPressed: () => _buttonHandler?.onShortPress(
                              RemoteKeyInject_RemoteKeyCode.KEYCODE_SETTINGS,
                            ),
                            child: Icon(
                              Icons.settings,
                              size: 30,
                              color: AppColors.text,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              spacing.centerSpacing(),
                              0,
                              0.0,
                            ),
                            child: SizedBox(
                              width: 80.0,
                              child: dPad(
                                RemoteKeyInject_RemoteKeyCode.KEYCODE_DPAD_UP,
                                _buttonHandler,
                                -pi / 2,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 18, 18, 18),
                              minimumSize: Size(40, 40),
                              padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            ),
                            onPressed: () => _buttonHandler?.onShortPress(
                              RemoteKeyInject_RemoteKeyCode.KEYCODE_HOME,
                            ),
                            child: Icon(
                              Icons.home,
                              size: 30,
                              color: AppColors.text,
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
                            child: dPad(
                              RemoteKeyInject_RemoteKeyCode.KEYCODE_DPAD_LEFT,
                              _buttonHandler,
                              -pi / 1,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.button,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                              ),
                              // minimumSize: Size(30.0, 30.0),
                              padding: EdgeInsets.all(25.5),
                            ),
                            onPressed: () => _buttonHandler?.onShortPress(
                              RemoteKeyInject_RemoteKeyCode.KEYCODE_DPAD_CENTER,
                            ),
                            child: Text("OK", style: TextStyle(fontSize: 20.0)),
                          ),
                          SizedBox(
                            width: 80.0,
                            child: dPad(
                              RemoteKeyInject_RemoteKeyCode.KEYCODE_DPAD_RIGHT,
                              _buttonHandler,
                              null,
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
                              backgroundColor: AppColors.button,
                              minimumSize: Size(40.0, 40.0),
                              padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            ),
                            onPressed: () => _buttonHandler?.onShortPress(
                              RemoteKeyInject_RemoteKeyCode.KEYCODE_MENU,
                            ),
                            child: Icon(
                              Icons.menu,
                              size: 30,
                              color: AppColors.text,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              spacing.centerSpacing(),
                            ),
                            child: SizedBox(
                              width: 80.0,
                              child: dPad(
                                RemoteKeyInject_RemoteKeyCode.KEYCODE_DPAD_DOWN,
                                _buttonHandler,
                                pi / 2,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 18, 18, 18),
                              minimumSize: Size(40, 40),
                              padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                            ),
                            onPressed: () => _buttonHandler?.onShortPress(
                              RemoteKeyInject_RemoteKeyCode.KEYCODE_BACK,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        spacing.mdDivider(),
                        0,
                        0.0,
                      ),
                      child: Container(
                        // padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: AppColors.button,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.button,
                                // minimumSize: Size(40, 40),
                                padding: EdgeInsets.fromLTRB(
                                  25.0,
                                  12.0,
                                  15.0,
                                  12.0,
                                ),
                              ),
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                showKeyboardDialog(context, _commandProcessor);
                              },
                              child: Icon(
                                Icons.keyboard,
                                size: 30,
                                color: AppColors.text,
                              ),
                            ),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.button,
                                // minimumSize: Size(40, 40),
                                padding: EdgeInsets.fromLTRB(
                                  10.0,
                                  12.0,
                                  10.0,
                                  12.0,
                                ),
                              ),
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                showNumbersKeyboard(context, _buttonHandler);
                              },
                              child: Text(
                                "123",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: AppColors.text,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.button,
                                minimumSize: Size(40, 40),
                                padding: EdgeInsets.fromLTRB(
                                  14.0,
                                  12.0,
                                  14.0,
                                  12.0,
                                ),
                              ),
                              onPressed: () async {
                                HapticFeedback.lightImpact();
                                await _commandProcessor?.launchApp(
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
                                HapticFeedback.lightImpact();
                                await _commandProcessor?.launchApp(
                                  "https://www.youtube.com",
                                );
                              },
                              child: Text(
                                "YouTube",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: AppColors.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        spacing.mdDivider(),
                        0,
                        0.0,
                      ),
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
                            color: AppColors.text,
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
