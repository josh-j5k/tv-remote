import 'dart:async';
import 'package:android_tv_remote/core/services/tv_command_processor.dart';
import 'package:android_tv_remote/src/generated/keycodes.pb.dart';
import 'package:flutter/services.dart';

class RemoteButtonHandler {
  TvCommandProcessor? commandProcessor;
  Timer? _longPressTimer;
  Timer? _repeatTimer;
  bool _isRepeating = false;
  RemoteKeyInject_RemoteKeyCode? _currentKey;
  Duration longPressThreshold = Duration(milliseconds: 400);
  Duration repeatInterval = Duration(milliseconds: 10);
  RemoteButtonHandler({required this.commandProcessor});

  Future<void> onShortPress(RemoteKeyInject_RemoteKeyCode keyCode) async {
    if (commandProcessor == null) return;
    await commandProcessor!.sendKeyShortPress(keyCode);
    SystemSound.play(SystemSoundType.click);
    HapticFeedback.lightImpact();
  }

  /// For D-Pad and other buttons - uses RemoteKeyInject
  Future<void> onKeyButtonDown(
    RemoteKeyInject_RemoteKeyCode keyCode, {

    bool enableRepeat = true,
  }) async {
    if (commandProcessor == null) return;
    // Cancel any existing timers first
    _cancelAllTimers();

    _currentKey = keyCode;
    _isRepeating = false;

    // Send initial press (don't await)
    commandProcessor!.sendKeyShortPress(keyCode);
    SystemSound.play(SystemSoundType.click);
    HapticFeedback.lightImpact();
    // print('🔽 Key pressed: ${keyCode.name}');
    // Start long press timer
    _longPressTimer = Timer(longPressThreshold, () {
      // commandProcessor!.sendKeyPress(keyCode);
      if (enableRepeat && _currentKey == keyCode) {
        _isRepeating = true;
        // Start repeat timer

        // print('🔁 Long press detected, starting repeat for ${keyCode.name}');
        _repeatTimer = Timer.periodic(repeatInterval, (timer) {
          if (commandProcessor != null && _currentKey == keyCode) {
            HapticFeedback.lightImpact();
            commandProcessor!.sendKeyPress(keyCode);
          }
        });
      }
    });
  }

  Future<void> onButtonUp(RemoteKeyInject_RemoteKeyCode keyCode) async {
    if (!_isRepeating) {
      _cancelAllTimers();
    }

    // Send release event (don't await)
    if (commandProcessor != null) {
      commandProcessor!.sendKeyRelease(keyCode);
    }

    // Reset state
    _isRepeating = false;
    _currentKey = null;
  }

  void onButtonCancel(RemoteKeyInject_RemoteKeyCode keyCode) {
    _cancelAllTimers();

    // print('❌ Key cancelled: ${keyCode.name}');

    // Send release event (don't await)
    if (commandProcessor != null) {
      commandProcessor!.sendKeyRelease(keyCode);
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
