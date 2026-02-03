import 'dart:async';
import 'package:remote_app/data/tv_remote.dart';
import 'package:remote_app/src/generated/keycodes.pb.dart';

class RemoteButtonHandler {
  TvRemoteClient? remoteService;
  Timer? _repeatTimer;
  bool _isRepeating = false;

  RemoteButtonHandler(this.remoteService);

  /// For D-Pad and other buttons - uses RemoteKeyInject
  Future<void> onKeyButtonDown(
    RemoteKeyInject_RemoteKeyCode keyCode, {
    Duration longPressThreshold = const Duration(milliseconds: 400),
    Duration repeatInterval = const Duration(milliseconds: 150),
    bool enableRepeat = true,
  }) async {
    if (remoteService == null) return;
    await remoteService!.sendKeyPress(keyCode);
    // Start repeat timer for long press
    _repeatTimer = Timer(longPressThreshold, () {
      _isRepeating = true;
      print('🔁 Key repeat started for ${keyCode.name}');

      if (enableRepeat) {
        // Repeat using SHORT_PRESS
        _repeatTimer = Timer.periodic(repeatInterval, (timer) async {
          await remoteService!.sendKeyShortPress(keyCode);
        });
      }
    });
  }

  /// Call when button released
  Future<void> onButtonUp() async {
    _repeatTimer?.cancel();

    if (_isRepeating) {
      print('✅ Repeat ended');
    }

    // Reset state
    _isRepeating = false;
    _repeatTimer = null;
  }

  void onButtonCancel() {
    _repeatTimer?.cancel();
    _isRepeating = false;
    _repeatTimer = null;
  }

  void dispose() {
    _repeatTimer?.cancel();
  }
}
