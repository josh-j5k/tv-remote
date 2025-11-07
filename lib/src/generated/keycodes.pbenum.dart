// This is a generated file - do not edit.
//
// Generated from keycodes.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RemoteKeyCode extends $pb.ProtobufEnum {
  static const RemoteKeyCode KEYCODE_UNKNOWN =
      RemoteKeyCode._(0, _omitEnumNames ? '' : 'KEYCODE_UNKNOWN');

  /// navigation
  static const RemoteKeyCode KEYCODE_DPAD_UP =
      RemoteKeyCode._(19, _omitEnumNames ? '' : 'KEYCODE_DPAD_UP');
  static const RemoteKeyCode KEYCODE_DPAD_DOWN =
      RemoteKeyCode._(20, _omitEnumNames ? '' : 'KEYCODE_DPAD_DOWN');
  static const RemoteKeyCode KEYCODE_DPAD_LEFT =
      RemoteKeyCode._(21, _omitEnumNames ? '' : 'KEYCODE_DPAD_LEFT');
  static const RemoteKeyCode KEYCODE_DPAD_RIGHT =
      RemoteKeyCode._(22, _omitEnumNames ? '' : 'KEYCODE_DPAD_RIGHT');
  static const RemoteKeyCode KEYCODE_DPAD_CENTER =
      RemoteKeyCode._(23, _omitEnumNames ? '' : 'KEYCODE_DPAD_CENTER');
  static const RemoteKeyCode KEYCODE_BACK =
      RemoteKeyCode._(4, _omitEnumNames ? '' : 'KEYCODE_BACK');
  static const RemoteKeyCode KEYCODE_HOME =
      RemoteKeyCode._(3, _omitEnumNames ? '' : 'KEYCODE_HOME');
  static const RemoteKeyCode KEYCODE_MENU =
      RemoteKeyCode._(82, _omitEnumNames ? '' : 'KEYCODE_MENU');
  static const RemoteKeyCode KEYCODE_GUIDE =
      RemoteKeyCode._(172, _omitEnumNames ? '' : 'KEYCODE_GUIDE');
  static const RemoteKeyCode KEYCODE_INFO =
      RemoteKeyCode._(165, _omitEnumNames ? '' : 'KEYCODE_INFO');
  static const RemoteKeyCode KEYCODE_SETTINGS =
      RemoteKeyCode._(176, _omitEnumNames ? '' : 'KEYCODE_SETTINGS');

  /// media
  static const RemoteKeyCode KEYCODE_MEDIA_PLAY =
      RemoteKeyCode._(126, _omitEnumNames ? '' : 'KEYCODE_MEDIA_PLAY');
  static const RemoteKeyCode KEYCODE_MEDIA_PAUSE =
      RemoteKeyCode._(127, _omitEnumNames ? '' : 'KEYCODE_MEDIA_PAUSE');
  static const RemoteKeyCode KEYCODE_MEDIA_PLAY_PAUSE =
      RemoteKeyCode._(85, _omitEnumNames ? '' : 'KEYCODE_MEDIA_PLAY_PAUSE');
  static const RemoteKeyCode KEYCODE_MEDIA_STOP =
      RemoteKeyCode._(86, _omitEnumNames ? '' : 'KEYCODE_MEDIA_STOP');
  static const RemoteKeyCode KEYCODE_MEDIA_NEXT =
      RemoteKeyCode._(87, _omitEnumNames ? '' : 'KEYCODE_MEDIA_NEXT');
  static const RemoteKeyCode KEYCODE_MEDIA_PREVIOUS =
      RemoteKeyCode._(88, _omitEnumNames ? '' : 'KEYCODE_MEDIA_PREVIOUS');
  static const RemoteKeyCode KEYCODE_MEDIA_REWIND =
      RemoteKeyCode._(89, _omitEnumNames ? '' : 'KEYCODE_MEDIA_REWIND');
  static const RemoteKeyCode KEYCODE_MEDIA_FAST_FORWARD =
      RemoteKeyCode._(90, _omitEnumNames ? '' : 'KEYCODE_MEDIA_FAST_FORWARD');
  static const RemoteKeyCode KEYCODE_MEDIA_RECORD =
      RemoteKeyCode._(130, _omitEnumNames ? '' : 'KEYCODE_MEDIA_RECORD');

  /// volume
  static const RemoteKeyCode KEYCODE_VOLUME_UP =
      RemoteKeyCode._(24, _omitEnumNames ? '' : 'KEYCODE_VOLUME_UP');
  static const RemoteKeyCode KEYCODE_VOLUME_DOWN =
      RemoteKeyCode._(25, _omitEnumNames ? '' : 'KEYCODE_VOLUME_DOWN');
  static const RemoteKeyCode KEYCODE_MUTE =
      RemoteKeyCode._(91, _omitEnumNames ? '' : 'KEYCODE_MUTE');

  /// tv_specific
  static const RemoteKeyCode KEYCODE_TV =
      RemoteKeyCode._(170, _omitEnumNames ? '' : 'KEYCODE_TV');
  static const RemoteKeyCode KEYCODE_TV_POWER =
      RemoteKeyCode._(177, _omitEnumNames ? '' : 'KEYCODE_TV_POWER');
  static const RemoteKeyCode KEYCODE_TV_INPUT =
      RemoteKeyCode._(178, _omitEnumNames ? '' : 'KEYCODE_TV_INPUT');
  static const RemoteKeyCode KEYCODE_CHANNEL_UP =
      RemoteKeyCode._(166, _omitEnumNames ? '' : 'KEYCODE_CHANNEL_UP');
  static const RemoteKeyCode KEYCODE_CHANNEL_DOWN =
      RemoteKeyCode._(167, _omitEnumNames ? '' : 'KEYCODE_CHANNEL_DOWN');
  static const RemoteKeyCode KEYCODE_TV_RADIO_SERVICE =
      RemoteKeyCode._(232, _omitEnumNames ? '' : 'KEYCODE_TV_RADIO_SERVICE');
  static const RemoteKeyCode KEYCODE_TV_DATA_SERVICE =
      RemoteKeyCode._(230, _omitEnumNames ? '' : 'KEYCODE_TV_DATA_SERVICE');
  static const RemoteKeyCode KEYCODE_TV_TELETEXT =
      RemoteKeyCode._(233, _omitEnumNames ? '' : 'KEYCODE_TV_TELETEXT');
  static const RemoteKeyCode KEYCODE_TV_NETWORK =
      RemoteKeyCode._(241, _omitEnumNames ? '' : 'KEYCODE_TV_NETWORK');
  static const RemoteKeyCode KEYCODE_TV_SATELLITE =
      RemoteKeyCode._(237, _omitEnumNames ? '' : 'KEYCODE_TV_SATELLITE');
  static const RemoteKeyCode KEYCODE_TV_ANTENNA_CABLE =
      RemoteKeyCode._(238, _omitEnumNames ? '' : 'KEYCODE_TV_ANTENNA_CABLE');

  /// system
  static const RemoteKeyCode KEYCODE_POWER =
      RemoteKeyCode._(26, _omitEnumNames ? '' : 'KEYCODE_POWER');
  static const RemoteKeyCode KEYCODE_SLEEP =
      RemoteKeyCode._(223, _omitEnumNames ? '' : 'KEYCODE_SLEEP');
  static const RemoteKeyCode KEYCODE_WAKEUP =
      RemoteKeyCode._(224, _omitEnumNames ? '' : 'KEYCODE_WAKEUP');
  static const RemoteKeyCode KEYCODE_APP_SWITCH =
      RemoteKeyCode._(187, _omitEnumNames ? '' : 'KEYCODE_APP_SWITCH');
  static const RemoteKeyCode KEYCODE_ASSIST =
      RemoteKeyCode._(219, _omitEnumNames ? '' : 'KEYCODE_ASSIST');
  static const RemoteKeyCode KEYCODE_VOICE_ASSIST =
      RemoteKeyCode._(231, _omitEnumNames ? '' : 'KEYCODE_VOICE_ASSIST');

  /// numeric
  static const RemoteKeyCode KEYCODE_0 =
      RemoteKeyCode._(7, _omitEnumNames ? '' : 'KEYCODE_0');
  static const RemoteKeyCode KEYCODE_1 =
      RemoteKeyCode._(8, _omitEnumNames ? '' : 'KEYCODE_1');
  static const RemoteKeyCode KEYCODE_2 =
      RemoteKeyCode._(9, _omitEnumNames ? '' : 'KEYCODE_2');
  static const RemoteKeyCode KEYCODE_3 =
      RemoteKeyCode._(10, _omitEnumNames ? '' : 'KEYCODE_3');
  static const RemoteKeyCode KEYCODE_4 =
      RemoteKeyCode._(11, _omitEnumNames ? '' : 'KEYCODE_4');
  static const RemoteKeyCode KEYCODE_5 =
      RemoteKeyCode._(12, _omitEnumNames ? '' : 'KEYCODE_5');
  static const RemoteKeyCode KEYCODE_6 =
      RemoteKeyCode._(13, _omitEnumNames ? '' : 'KEYCODE_6');
  static const RemoteKeyCode KEYCODE_7 =
      RemoteKeyCode._(14, _omitEnumNames ? '' : 'KEYCODE_7');
  static const RemoteKeyCode KEYCODE_8 =
      RemoteKeyCode._(15, _omitEnumNames ? '' : 'KEYCODE_8');
  static const RemoteKeyCode KEYCODE_9 =
      RemoteKeyCode._(16, _omitEnumNames ? '' : 'KEYCODE_9');

  /// misc
  static const RemoteKeyCode KEYCODE_ENTER =
      RemoteKeyCode._(66, _omitEnumNames ? '' : 'KEYCODE_ENTER');
  static const RemoteKeyCode KEYCODE_DEL =
      RemoteKeyCode._(67, _omitEnumNames ? '' : 'KEYCODE_DEL');
  static const RemoteKeyCode KEYCODE_SPACE =
      RemoteKeyCode._(62, _omitEnumNames ? '' : 'KEYCODE_SPACE');
  static const RemoteKeyCode KEYCODE_PAGE_UP =
      RemoteKeyCode._(92, _omitEnumNames ? '' : 'KEYCODE_PAGE_UP');
  static const RemoteKeyCode KEYCODE_PAGE_DOWN =
      RemoteKeyCode._(93, _omitEnumNames ? '' : 'KEYCODE_PAGE_DOWN');
  static const RemoteKeyCode KEYCODE_PROG_RED =
      RemoteKeyCode._(183, _omitEnumNames ? '' : 'KEYCODE_PROG_RED');
  static const RemoteKeyCode KEYCODE_PROG_GREEN =
      RemoteKeyCode._(184, _omitEnumNames ? '' : 'KEYCODE_PROG_GREEN');
  static const RemoteKeyCode KEYCODE_PROG_YELLOW =
      RemoteKeyCode._(185, _omitEnumNames ? '' : 'KEYCODE_PROG_YELLOW');
  static const RemoteKeyCode KEYCODE_PROG_BLUE =
      RemoteKeyCode._(186, _omitEnumNames ? '' : 'KEYCODE_PROG_BLUE');

  static const $core.List<RemoteKeyCode> values = <RemoteKeyCode>[
    KEYCODE_UNKNOWN,
    KEYCODE_DPAD_UP,
    KEYCODE_DPAD_DOWN,
    KEYCODE_DPAD_LEFT,
    KEYCODE_DPAD_RIGHT,
    KEYCODE_DPAD_CENTER,
    KEYCODE_BACK,
    KEYCODE_HOME,
    KEYCODE_MENU,
    KEYCODE_GUIDE,
    KEYCODE_INFO,
    KEYCODE_SETTINGS,
    KEYCODE_MEDIA_PLAY,
    KEYCODE_MEDIA_PAUSE,
    KEYCODE_MEDIA_PLAY_PAUSE,
    KEYCODE_MEDIA_STOP,
    KEYCODE_MEDIA_NEXT,
    KEYCODE_MEDIA_PREVIOUS,
    KEYCODE_MEDIA_REWIND,
    KEYCODE_MEDIA_FAST_FORWARD,
    KEYCODE_MEDIA_RECORD,
    KEYCODE_VOLUME_UP,
    KEYCODE_VOLUME_DOWN,
    KEYCODE_MUTE,
    KEYCODE_TV,
    KEYCODE_TV_POWER,
    KEYCODE_TV_INPUT,
    KEYCODE_CHANNEL_UP,
    KEYCODE_CHANNEL_DOWN,
    KEYCODE_TV_RADIO_SERVICE,
    KEYCODE_TV_DATA_SERVICE,
    KEYCODE_TV_TELETEXT,
    KEYCODE_TV_NETWORK,
    KEYCODE_TV_SATELLITE,
    KEYCODE_TV_ANTENNA_CABLE,
    KEYCODE_POWER,
    KEYCODE_SLEEP,
    KEYCODE_WAKEUP,
    KEYCODE_APP_SWITCH,
    KEYCODE_ASSIST,
    KEYCODE_VOICE_ASSIST,
    KEYCODE_0,
    KEYCODE_1,
    KEYCODE_2,
    KEYCODE_3,
    KEYCODE_4,
    KEYCODE_5,
    KEYCODE_6,
    KEYCODE_7,
    KEYCODE_8,
    KEYCODE_9,
    KEYCODE_ENTER,
    KEYCODE_DEL,
    KEYCODE_SPACE,
    KEYCODE_PAGE_UP,
    KEYCODE_PAGE_DOWN,
    KEYCODE_PROG_RED,
    KEYCODE_PROG_GREEN,
    KEYCODE_PROG_YELLOW,
    KEYCODE_PROG_BLUE,
  ];

  static final $core.Map<$core.int, RemoteKeyCode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RemoteKeyCode? valueOf($core.int value) => _byValue[value];

  const RemoteKeyCode._(super.value, super.name);
}

class RemoteDirection extends $pb.ProtobufEnum {
  static const RemoteDirection REMOTE_DIRECTION_UNKNOWN =
      RemoteDirection._(0, _omitEnumNames ? '' : 'REMOTE_DIRECTION_UNKNOWN');
  static const RemoteDirection START_LONG_PRESS =
      RemoteDirection._(1, _omitEnumNames ? '' : 'START_LONG_PRESS');
  static const RemoteDirection END_LONG_PRESS =
      RemoteDirection._(2, _omitEnumNames ? '' : 'END_LONG_PRESS');
  static const RemoteDirection SHORT_PRESS =
      RemoteDirection._(3, _omitEnumNames ? '' : 'SHORT_PRESS');

  static const $core.List<RemoteDirection> values = <RemoteDirection>[
    REMOTE_DIRECTION_UNKNOWN,
    START_LONG_PRESS,
    END_LONG_PRESS,
    SHORT_PRESS,
  ];

  static final $core.List<RemoteDirection?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static RemoteDirection? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RemoteDirection._(super.value, super.name);
}

class RemoteErrorCode extends $pb.ProtobufEnum {
  static const RemoteErrorCode REMOTE_ERROR_CODE_UNKNOWN =
      RemoteErrorCode._(0, _omitEnumNames ? '' : 'REMOTE_ERROR_CODE_UNKNOWN');
  static const RemoteErrorCode ERROR_INVALID_SECRET =
      RemoteErrorCode._(401, _omitEnumNames ? '' : 'ERROR_INVALID_SECRET');
  static const RemoteErrorCode ERROR_PAIRING_TIMEOUT =
      RemoteErrorCode._(408, _omitEnumNames ? '' : 'ERROR_PAIRING_TIMEOUT');
  static const RemoteErrorCode ERROR_GENERIC =
      RemoteErrorCode._(500, _omitEnumNames ? '' : 'ERROR_GENERIC');

  static const $core.List<RemoteErrorCode> values = <RemoteErrorCode>[
    REMOTE_ERROR_CODE_UNKNOWN,
    ERROR_INVALID_SECRET,
    ERROR_PAIRING_TIMEOUT,
    ERROR_GENERIC,
  ];

  static final $core.Map<$core.int, RemoteErrorCode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RemoteErrorCode? valueOf($core.int value) => _byValue[value];

  const RemoteErrorCode._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
