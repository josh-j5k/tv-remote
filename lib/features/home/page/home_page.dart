import 'dart:math';
import 'package:android_tv_remote/core/services/tv_command_processor.dart';
import 'package:android_tv_remote/core/themes/app_colors.dart';
import 'package:android_tv_remote/core/themes/app_spacing.dart';
import 'package:android_tv_remote/core/themes/app_text_styles.dart';
import 'package:android_tv_remote/features/home/page/dialogs/show_keyboard_dialog.dart';
import 'package:android_tv_remote/features/home/page/dialogs/show_numbers_keyboard.dart';
import 'package:android_tv_remote/features/home/page/widgets/controls_widget.dart';
import 'package:android_tv_remote/features/home/page/widgets/d_pad_widget.dart';
import 'package:android_tv_remote/features/home/page/widgets/default_button_widget.dart';
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
    print("refreshing");
    print(_remoteClient == null);
    if (appDataNotifier.value.isConnected == true) {
      showReconnectingDialog(context);
      reconnectRemoteClient().then((_) {
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
    if (appDataNotifier.value.host == null) {
      return;
    }
    if (_remoteClient != null) {
      return;
    }
    _remoteClient = TvRemoteClient(host: appDataNotifier.value.host!);
    final alreadyPaired = await _remoteClient!.initialize();
    if (!alreadyPaired) {
      return;
    }
    _commandProcessor = await _remoteClient?.connect();
    final buttonHandler = RemoteButtonHandler(
      commandProcessor: _commandProcessor,
    );
    setState(() {
      _buttonHandler = buttonHandler;
    });
  }

  Future<void> reconnectRemoteClient() async {
    _remoteClient = TvRemoteClient(host: appDataNotifier.value.host!);
    final alreadyPaired = await _remoteClient!.initialize();
    if (!alreadyPaired) {
      return;
    }
    _commandProcessor = await _remoteClient?.connect();
    final buttonHandler = RemoteButtonHandler(
      commandProcessor: _commandProcessor,
    );
    setState(() {
      _buttonHandler = buttonHandler;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    // print("height is $height:, width is $width");
    AppSpacing spacing = AppSpacing(screenHeight: height, screenWidth: width);
    final AppTextStyles textStyles = AppTextStyles(
      screenHeight: height,
      screenWidth: width,
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
                                      fontSize: textStyles.fontSizeXl(),
                                    ),
                                  ),
                                  Text(
                                    appData.isConnected
                                        ? 'Connected'
                                        : 'TV is not connected',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: textStyles.fontSizeLg(),
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
                                          textStyles.fontSize2xl(),
                                          textStyles.fontSizeLg(),
                                          textStyles.fontSize2xl(),
                                          textStyles.fontSizeLg(),
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
                                        size: textStyles.fontSizeXl(),
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
                          //  power button
                          DefaultButtonWidget(
                            buttonHandler: _buttonHandler,
                            keyCode:
                                RemoteKeyInject_RemoteKeyCode.KEYCODE_POWER,
                            icon: Icons.power_settings_new,
                            iconColor: Color.fromARGB(255, 255, 31, 98),
                          ),
                          DefaultButtonWidget(
                            buttonHandler: _buttonHandler,
                            keyCode:
                                RemoteKeyInject_RemoteKeyCode.KEYCODE_TV_INPUT,
                            icon: Icons.input,
                            iconColor: null,
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
                                  child: ControlsWidget(
                                    buttonHandler: _buttonHandler,
                                    keyCode: RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_CHANNEL_UP,
                                    direction: "top",
                                    icon: Icons.keyboard_arrow_up,
                                  ),
                                ),

                                Container(
                                  color: AppColors.button,
                                  width: textStyles.fontSize2xl() * 2.7,
                                  child: Center(
                                    child: Text(
                                      "Ch",
                                      style: TextStyle(
                                        backgroundColor: AppColors.button,
                                        color: Colors.grey,
                                        height: 1.0,
                                        fontSize: textStyles.fontSizeLg(),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ControlsWidget(
                                    buttonHandler: _buttonHandler,
                                    keyCode: RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_CHANNEL_DOWN,
                                    direction: "bottom",
                                    icon: Icons.keyboard_arrow_down,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                spacing: spacing.smDivider(),
                                children: [
                                  DefaultButtonWidget(
                                    buttonHandler: _buttonHandler,
                                    keyCode: RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_SEARCH,
                                    icon: Icons.search,
                                    iconColor: null,
                                  ),

                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.button,

                                      padding: EdgeInsets.fromLTRB(
                                        textStyles.fontSize2xl(),
                                        textStyles.fontSizeLg(),
                                        textStyles.fontSize2xl(),
                                        textStyles.fontSizeLg(),
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
                                      size: textStyles.fontSizeXl(),
                                      color: AppColors.text,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: spacing.smDivider()),
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.button,
                                      minimumSize: Size(40, 40),
                                      padding: EdgeInsets.fromLTRB(
                                        textStyles.fontSize2xl() * 1.8,
                                        textStyles.fontSizeLg(),
                                        textStyles.fontSize2xl() * 1.8,
                                        textStyles.fontSizeLg(),
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
                                          size: textStyles.fontSizeXl(),
                                          color: AppColors.text,
                                        ),
                                        Text(
                                          "Apps",
                                          style: TextStyle(
                                            fontSize: textStyles.fontSizeLg(),
                                            color: AppColors.text,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: spacing.lgDivider(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ControlsWidget(
                                    buttonHandler: _buttonHandler,
                                    keyCode: RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_VOLUME_UP,
                                    direction: "top",
                                    icon: Icons.add,
                                  ),
                                ),

                                Container(
                                  color: AppColors.button,
                                  width: textStyles.fontSize2xl() * 2.7,
                                  child: Center(
                                    child: Text(
                                      "Vol",
                                      style: TextStyle(
                                        backgroundColor: AppColors.button,
                                        color: Colors.grey,
                                        height: 1.0,
                                        fontSize: textStyles.fontSizeLg(),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ControlsWidget(
                                    buttonHandler: _buttonHandler,
                                    keyCode: RemoteKeyInject_RemoteKeyCode
                                        .KEYCODE_VOLUME_DOWN,
                                    direction: "bottom",
                                    icon: Icons.remove,
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
                          DefaultButtonWidget(
                            buttonHandler: _buttonHandler,
                            keyCode:
                                RemoteKeyInject_RemoteKeyCode.KEYCODE_SETTINGS,
                            icon: Icons.settings,
                            iconColor: null,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              spacing.centerSpacing(),
                              0,
                              0.0,
                            ),
                            child: DPadWidget(
                              keyCode:
                                  RemoteKeyInject_RemoteKeyCode.KEYCODE_DPAD_UP,
                              buttonHandler: _buttonHandler,
                              angle: -pi / 2,
                            ),
                          ),
                          DefaultButtonWidget(
                            buttonHandler: _buttonHandler,
                            keyCode: RemoteKeyInject_RemoteKeyCode.KEYCODE_HOME,
                            icon: Icons.home,
                            iconColor: null,
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
                          DPadWidget(
                            keyCode:
                                RemoteKeyInject_RemoteKeyCode.KEYCODE_DPAD_LEFT,
                            buttonHandler: _buttonHandler,
                            angle: -pi / 1,
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
                              padding: EdgeInsets.all(textStyles.fontSizeXl()),
                            ),
                            onPressed: () => _buttonHandler?.onShortPress(
                              RemoteKeyInject_RemoteKeyCode.KEYCODE_DPAD_CENTER,
                            ),
                            child: Text(
                              "OK",
                              style: TextStyle(
                                fontSize: textStyles.fontSizeLg(),
                              ),
                            ),
                          ),
                          DPadWidget(
                            keyCode: RemoteKeyInject_RemoteKeyCode
                                .KEYCODE_DPAD_RIGHT,
                            buttonHandler: _buttonHandler,
                            angle: null,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DefaultButtonWidget(
                            buttonHandler: _buttonHandler,
                            keyCode: RemoteKeyInject_RemoteKeyCode.KEYCODE_MENU,
                            icon: Icons.menu,
                            iconColor: null,
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              spacing.centerSpacing(),
                            ),
                            child: DPadWidget(
                              keyCode: RemoteKeyInject_RemoteKeyCode
                                  .KEYCODE_DPAD_DOWN,
                              buttonHandler: _buttonHandler,
                              angle: pi / 2,
                            ),
                          ),
                          DefaultButtonWidget(
                            buttonHandler: _buttonHandler,
                            keyCode: RemoteKeyInject_RemoteKeyCode.KEYCODE_BACK,
                            icon: Icons.arrow_back,
                            iconColor: null,
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
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.button,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60), // Large curve
                                    topRight: Radius.circular(
                                      0,
                                    ), // Sharp corner
                                    bottomLeft: Radius.circular(
                                      60,
                                    ), // Slight curve
                                    bottomRight: Radius.circular(
                                      0,
                                    ), // Dramatic curve
                                  ),
                                ),
                                padding: EdgeInsets.fromLTRB(
                                  textStyles.fontSizeLg(),
                                  textStyles.fontSizeLg() * 0.978,
                                  textStyles.fontSizeLg(),
                                  textStyles.fontSizeLg() * 0.978,
                                ),
                              ),
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                showKeyboardDialog(context, _commandProcessor);
                              },
                              child: Icon(
                                Icons.keyboard,
                                size: textStyles.fontSizeLg(),
                                color: AppColors.text,
                              ),
                            ),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.button,
                                padding: EdgeInsets.fromLTRB(
                                  textStyles.fontSizeLg(),
                                  textStyles.fontSizeLg() * 0.91,
                                  textStyles.fontSizeLg(),
                                  textStyles.fontSizeLg() * 0.91,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0), // Large curve
                                    topRight: Radius.circular(
                                      0,
                                    ), // Sharp corner
                                    bottomLeft: Radius.circular(
                                      0,
                                    ), // Slight curve
                                    bottomRight: Radius.circular(
                                      0,
                                    ), // Dramatic curve
                                  ),
                                ),
                                // minimumSize: Size(40, 40),
                              ),
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                showNumbersKeyboard(context, _buttonHandler);
                              },
                              child: Text(
                                "123",
                                style: TextStyle(
                                  fontSize: textStyles.fontSizeLg() * 0.8,
                                  color: AppColors.text,
                                ),
                              ),
                            ),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.button,
                                padding: EdgeInsets.fromLTRB(
                                  textStyles.fontSizeLg(),
                                  textStyles.fontSizeLg() * 0.91,
                                  textStyles.fontSizeLg(),
                                  textStyles.fontSizeLg() * 0.91,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0), // Large curve
                                    topRight: Radius.circular(
                                      0,
                                    ), // Sharp corner
                                    bottomLeft: Radius.circular(
                                      0,
                                    ), // Slight curve
                                    bottomRight: Radius.circular(
                                      0,
                                    ), // Dramatic curve
                                  ),
                                ),
                                // minimumSize: Size(40, 40),
                              ),
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                _buttonHandler?.onShortPress(
                                  RemoteKeyInject_RemoteKeyCode.KEYCODE_GUIDE,
                                );
                              },
                              child: Text(
                                "Guide",
                                style: TextStyle(
                                  fontSize: textStyles.fontSizeLg() * 0.8,
                                  color: AppColors.text,
                                ),
                              ),
                            ),

                            width > 370
                                ? ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.button,
                                      padding: EdgeInsets.fromLTRB(
                                        textStyles.fontSizeLg(),
                                        textStyles.fontSizeLg() * 0.867,
                                        textStyles.fontSizeLg(),
                                        textStyles.fontSizeLg() * 0.867,
                                      ),

                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                            0,
                                          ), // Large curve
                                          topRight: Radius.circular(
                                            0,
                                          ), // Sharp corner
                                          bottomLeft: Radius.circular(
                                            0,
                                          ), // Slight curve
                                          bottomRight: Radius.circular(
                                            0,
                                          ), // Dramatic curve
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      HapticFeedback.lightImpact();
                                      await _commandProcessor?.launchApp(
                                        "com.netflix.ninja",
                                      );
                                    },
                                    child: Image.asset(
                                      "assets/icons/icons8-netflix.png",
                                      width: textStyles.fontSizeXl(),
                                      height: textStyles.fontSizeXl(),
                                    ),
                                  )
                                : SizedBox.shrink(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.button,
                                padding: EdgeInsets.fromLTRB(
                                  textStyles.fontSizeLg(),
                                  textStyles.fontSizeLg() * 0.867,
                                  textStyles.fontSizeLg(),
                                  textStyles.fontSizeLg() * 0.867,
                                ),

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
                              ),
                              onPressed: () async {
                                HapticFeedback.lightImpact();
                                await _commandProcessor?.launchApp(
                                  "https://www.youtube.com",
                                );
                              },
                              child: Image.asset(
                                "assets/icons/icons8-youtube.png",
                                width: textStyles.fontSizeXl(),
                                height: textStyles.fontSizeXl(),
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
                            backgroundColor: AppColors.button,

                            padding: EdgeInsets.fromLTRB(
                              textStyles.fontSize2xl(),
                              textStyles.fontSizeLg(),
                              textStyles.fontSize2xl(),
                              textStyles.fontSizeLg(),
                            ),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.settings_remote,
                            size: textStyles.fontSizeLg(),
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
