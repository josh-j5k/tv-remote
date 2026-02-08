import 'dart:async';
import 'package:remote_app/data/tv_remote.dart';
import 'package:remote_app/src/generated/keycodes.pb.dart';

class RemoteButtonHandler {
  TvRemoteClient? remoteService;
  Timer? _longPressTimer;
  Timer? _repeatTimer;
  bool _isRepeating = false;
  RemoteKeyInject_RemoteKeyCode? _currentKey;
  RemoteButtonHandler(this.remoteService);

  /// For D-Pad and other buttons - uses RemoteKeyInject
  Future<void> onKeyButtonDown(
    RemoteKeyInject_RemoteKeyCode keyCode, {
    Duration longPressThreshold = const Duration(milliseconds: 1000),
    Duration repeatInterval = const Duration(milliseconds: 150),
    bool enableRepeat = true,
  }) async {
    if (remoteService == null) return;

    // Cancel any existing timers first
    _cancelAllTimers();

    _currentKey = keyCode;
    _isRepeating = false;

    // Send initial press (don't await)
    remoteService!.sendKeyPress(keyCode);

    // Start long press timer
    _longPressTimer = Timer(longPressThreshold, () {
      if (enableRepeat && _currentKey == keyCode) {
        _isRepeating = true;
        // Start repeat timer
        _repeatTimer = Timer.periodic(repeatInterval, (timer) {
          if (remoteService != null && _currentKey == keyCode) {
            remoteService!.sendKeyShortPress(keyCode);
          }
        });
      }
    });
  }

  Future<void> onButtonUp(RemoteKeyInject_RemoteKeyCode keyCode) async {
    _cancelAllTimers();

    // if (_isRepeating) {
    //   print('✅ Repeat ended for ${keyCode.name}');
    // } else {
    //   print('🔼 Key released (short press): ${keyCode.name}');
    // }

    // Send release event (don't await)
    if (remoteService != null) {
      remoteService!.sendKeyRelease(keyCode);
    }

    // Reset state
    _isRepeating = false;
    _currentKey = null;
  }

  void onButtonCancel(RemoteKeyInject_RemoteKeyCode keyCode) {
    _cancelAllTimers();

    print('❌ Key cancelled: ${keyCode.name}');

    // Send release event (don't await)
    if (remoteService != null) {
      remoteService!.sendKeyRelease(keyCode);
    }

    _isRepeating = false;
    _currentKey = null;
  }

  void _cancelAllTimers() {
    _longPressTimer?.cancel();
    _longPressTimer = null;
    _repeatTimer?.cancel();
    _repeatTimer = null;
  }

  void dispose() {
    _cancelAllTimers();
  }
}
