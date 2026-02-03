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

class RemoteDirection extends $pb.ProtobufEnum {
  static const RemoteDirection REMOTE_DIRECTION_UNKNOWN =
      RemoteDirection._(0, _omitEnumNames ? '' : 'REMOTE_DIRECTION_UNKNOWN');
  static const RemoteDirection PRESSED =
      RemoteDirection._(1, _omitEnumNames ? '' : 'PRESSED');
  static const RemoteDirection RELEASED =
      RemoteDirection._(2, _omitEnumNames ? '' : 'RELEASED');
  static const RemoteDirection SHORT_PRESS =
      RemoteDirection._(3, _omitEnumNames ? '' : 'SHORT_PRESS');

  static const $core.List<RemoteDirection> values = <RemoteDirection>[
    REMOTE_DIRECTION_UNKNOWN,
    PRESSED,
    RELEASED,
    SHORT_PRESS,
  ];

  static final $core.List<RemoteDirection?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static RemoteDirection? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RemoteDirection._(super.value, super.name);
}

class RemoteVolumeDirection extends $pb.ProtobufEnum {
  static const RemoteVolumeDirection VOLUME_DIRECTION_UNKNOWN =
      RemoteVolumeDirection._(
          0, _omitEnumNames ? '' : 'VOLUME_DIRECTION_UNKNOWN');
  static const RemoteVolumeDirection VOLUME_UP =
      RemoteVolumeDirection._(1, _omitEnumNames ? '' : 'VOLUME_UP');
  static const RemoteVolumeDirection VOLUME_DOWN =
      RemoteVolumeDirection._(2, _omitEnumNames ? '' : 'VOLUME_DOWN');

  static const $core.List<RemoteVolumeDirection> values =
      <RemoteVolumeDirection>[
    VOLUME_DIRECTION_UNKNOWN,
    VOLUME_UP,
    VOLUME_DOWN,
  ];

  static final $core.List<RemoteVolumeDirection?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static RemoteVolumeDirection? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RemoteVolumeDirection._(super.value, super.name);
}

class RemoteKeyInject_RemoteKeyCode extends $pb.ProtobufEnum {
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_UNKNOWN =
      RemoteKeyInject_RemoteKeyCode._(
          0, _omitEnumNames ? '' : 'KEYCODE_UNKNOWN');

  /// navigation
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_DPAD_UP =
      RemoteKeyInject_RemoteKeyCode._(
          19, _omitEnumNames ? '' : 'KEYCODE_DPAD_UP');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_DPAD_DOWN =
      RemoteKeyInject_RemoteKeyCode._(
          20, _omitEnumNames ? '' : 'KEYCODE_DPAD_DOWN');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_DPAD_LEFT =
      RemoteKeyInject_RemoteKeyCode._(
          21, _omitEnumNames ? '' : 'KEYCODE_DPAD_LEFT');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_DPAD_RIGHT =
      RemoteKeyInject_RemoteKeyCode._(
          22, _omitEnumNames ? '' : 'KEYCODE_DPAD_RIGHT');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_DPAD_CENTER =
      RemoteKeyInject_RemoteKeyCode._(
          23, _omitEnumNames ? '' : 'KEYCODE_DPAD_CENTER');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_BACK =
      RemoteKeyInject_RemoteKeyCode._(4, _omitEnumNames ? '' : 'KEYCODE_BACK');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_HOME =
      RemoteKeyInject_RemoteKeyCode._(3, _omitEnumNames ? '' : 'KEYCODE_HOME');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_MENU =
      RemoteKeyInject_RemoteKeyCode._(82, _omitEnumNames ? '' : 'KEYCODE_MENU');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_GUIDE =
      RemoteKeyInject_RemoteKeyCode._(
          172, _omitEnumNames ? '' : 'KEYCODE_GUIDE');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_INFO =
      RemoteKeyInject_RemoteKeyCode._(
          165, _omitEnumNames ? '' : 'KEYCODE_INFO');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_SETTINGS =
      RemoteKeyInject_RemoteKeyCode._(
          176, _omitEnumNames ? '' : 'KEYCODE_SETTINGS');

  /// media
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_MEDIA_PLAY =
      RemoteKeyInject_RemoteKeyCode._(
          126, _omitEnumNames ? '' : 'KEYCODE_MEDIA_PLAY');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_MEDIA_PAUSE =
      RemoteKeyInject_RemoteKeyCode._(
          127, _omitEnumNames ? '' : 'KEYCODE_MEDIA_PAUSE');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_MEDIA_PLAY_PAUSE =
      RemoteKeyInject_RemoteKeyCode._(
          85, _omitEnumNames ? '' : 'KEYCODE_MEDIA_PLAY_PAUSE');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_MEDIA_STOP =
      RemoteKeyInject_RemoteKeyCode._(
          86, _omitEnumNames ? '' : 'KEYCODE_MEDIA_STOP');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_MEDIA_NEXT =
      RemoteKeyInject_RemoteKeyCode._(
          87, _omitEnumNames ? '' : 'KEYCODE_MEDIA_NEXT');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_MEDIA_PREVIOUS =
      RemoteKeyInject_RemoteKeyCode._(
          88, _omitEnumNames ? '' : 'KEYCODE_MEDIA_PREVIOUS');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_MEDIA_REWIND =
      RemoteKeyInject_RemoteKeyCode._(
          89, _omitEnumNames ? '' : 'KEYCODE_MEDIA_REWIND');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_MEDIA_FAST_FORWARD =
      RemoteKeyInject_RemoteKeyCode._(
          90, _omitEnumNames ? '' : 'KEYCODE_MEDIA_FAST_FORWARD');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_MEDIA_RECORD =
      RemoteKeyInject_RemoteKeyCode._(
          130, _omitEnumNames ? '' : 'KEYCODE_MEDIA_RECORD');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_SEARCH =
      RemoteKeyInject_RemoteKeyCode._(
          84, _omitEnumNames ? '' : 'KEYCODE_SEARCH');

  /// volume
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_VOLUME_UP =
      RemoteKeyInject_RemoteKeyCode._(
          24, _omitEnumNames ? '' : 'KEYCODE_VOLUME_UP');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_VOLUME_DOWN =
      RemoteKeyInject_RemoteKeyCode._(
          25, _omitEnumNames ? '' : 'KEYCODE_VOLUME_DOWN');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_MUTE =
      RemoteKeyInject_RemoteKeyCode._(91, _omitEnumNames ? '' : 'KEYCODE_MUTE');

  /// tv_specific
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV =
      RemoteKeyInject_RemoteKeyCode._(170, _omitEnumNames ? '' : 'KEYCODE_TV');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_POWER =
      RemoteKeyInject_RemoteKeyCode._(
          177, _omitEnumNames ? '' : 'KEYCODE_TV_POWER');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_INPUT =
      RemoteKeyInject_RemoteKeyCode._(
          178, _omitEnumNames ? '' : 'KEYCODE_TV_INPUT');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_CHANNEL_UP =
      RemoteKeyInject_RemoteKeyCode._(
          166, _omitEnumNames ? '' : 'KEYCODE_CHANNEL_UP');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_CHANNEL_DOWN =
      RemoteKeyInject_RemoteKeyCode._(
          167, _omitEnumNames ? '' : 'KEYCODE_CHANNEL_DOWN');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_RADIO_SERVICE =
      RemoteKeyInject_RemoteKeyCode._(
          232, _omitEnumNames ? '' : 'KEYCODE_TV_RADIO_SERVICE');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_DATA_SERVICE =
      RemoteKeyInject_RemoteKeyCode._(
          230, _omitEnumNames ? '' : 'KEYCODE_TV_DATA_SERVICE');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_TELETEXT =
      RemoteKeyInject_RemoteKeyCode._(
          233, _omitEnumNames ? '' : 'KEYCODE_TV_TELETEXT');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_NETWORK =
      RemoteKeyInject_RemoteKeyCode._(
          241, _omitEnumNames ? '' : 'KEYCODE_TV_NETWORK');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_SATELLITE =
      RemoteKeyInject_RemoteKeyCode._(
          237, _omitEnumNames ? '' : 'KEYCODE_TV_SATELLITE');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_ANTENNA_CABLE =
      RemoteKeyInject_RemoteKeyCode._(
          238, _omitEnumNames ? '' : 'KEYCODE_TV_ANTENNA_CABLE');

  /// system
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_POWER =
      RemoteKeyInject_RemoteKeyCode._(
          26, _omitEnumNames ? '' : 'KEYCODE_POWER');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_SLEEP =
      RemoteKeyInject_RemoteKeyCode._(
          223, _omitEnumNames ? '' : 'KEYCODE_SLEEP');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_WAKEUP =
      RemoteKeyInject_RemoteKeyCode._(
          224, _omitEnumNames ? '' : 'KEYCODE_WAKEUP');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_APP_SWITCH =
      RemoteKeyInject_RemoteKeyCode._(
          187, _omitEnumNames ? '' : 'KEYCODE_APP_SWITCH');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_ASSIST =
      RemoteKeyInject_RemoteKeyCode._(
          219, _omitEnumNames ? '' : 'KEYCODE_ASSIST');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_VOICE_ASSIST =
      RemoteKeyInject_RemoteKeyCode._(
          231, _omitEnumNames ? '' : 'KEYCODE_VOICE_ASSIST');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_INPUT_HDMI_1 =
      RemoteKeyInject_RemoteKeyCode._(
          243, _omitEnumNames ? '' : 'KEYCODE_TV_INPUT_HDMI_1');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_INPUT_HDMI_2 =
      RemoteKeyInject_RemoteKeyCode._(
          244, _omitEnumNames ? '' : 'KEYCODE_TV_INPUT_HDMI_2');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_INPUT_HDMI_3 =
      RemoteKeyInject_RemoteKeyCode._(
          245, _omitEnumNames ? '' : 'KEYCODE_TV_INPUT_HDMI_3');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_INPUT_HDMI_4 =
      RemoteKeyInject_RemoteKeyCode._(
          246, _omitEnumNames ? '' : 'KEYCODE_TV_INPUT_HDMI_4');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_INPUT_COMPONENT_1 =
      RemoteKeyInject_RemoteKeyCode._(
          249, _omitEnumNames ? '' : 'KEYCODE_TV_INPUT_COMPONENT_1');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_TV_INPUT_COMPOSITE_1 =
      RemoteKeyInject_RemoteKeyCode._(
          247, _omitEnumNames ? '' : 'KEYCODE_TV_INPUT_COMPOSITE_1');

  /// numeric
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_0 =
      RemoteKeyInject_RemoteKeyCode._(7, _omitEnumNames ? '' : 'KEYCODE_0');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_1 =
      RemoteKeyInject_RemoteKeyCode._(8, _omitEnumNames ? '' : 'KEYCODE_1');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_2 =
      RemoteKeyInject_RemoteKeyCode._(9, _omitEnumNames ? '' : 'KEYCODE_2');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_3 =
      RemoteKeyInject_RemoteKeyCode._(10, _omitEnumNames ? '' : 'KEYCODE_3');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_4 =
      RemoteKeyInject_RemoteKeyCode._(11, _omitEnumNames ? '' : 'KEYCODE_4');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_5 =
      RemoteKeyInject_RemoteKeyCode._(12, _omitEnumNames ? '' : 'KEYCODE_5');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_6 =
      RemoteKeyInject_RemoteKeyCode._(13, _omitEnumNames ? '' : 'KEYCODE_6');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_7 =
      RemoteKeyInject_RemoteKeyCode._(14, _omitEnumNames ? '' : 'KEYCODE_7');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_8 =
      RemoteKeyInject_RemoteKeyCode._(15, _omitEnumNames ? '' : 'KEYCODE_8');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_9 =
      RemoteKeyInject_RemoteKeyCode._(16, _omitEnumNames ? '' : 'KEYCODE_9');

  /// misc
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_ENTER =
      RemoteKeyInject_RemoteKeyCode._(
          66, _omitEnumNames ? '' : 'KEYCODE_ENTER');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_DEL =
      RemoteKeyInject_RemoteKeyCode._(67, _omitEnumNames ? '' : 'KEYCODE_DEL');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_SPACE =
      RemoteKeyInject_RemoteKeyCode._(
          62, _omitEnumNames ? '' : 'KEYCODE_SPACE');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_PAGE_UP =
      RemoteKeyInject_RemoteKeyCode._(
          92, _omitEnumNames ? '' : 'KEYCODE_PAGE_UP');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_PAGE_DOWN =
      RemoteKeyInject_RemoteKeyCode._(
          93, _omitEnumNames ? '' : 'KEYCODE_PAGE_DOWN');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_PROG_RED =
      RemoteKeyInject_RemoteKeyCode._(
          183, _omitEnumNames ? '' : 'KEYCODE_PROG_RED');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_PROG_GREEN =
      RemoteKeyInject_RemoteKeyCode._(
          184, _omitEnumNames ? '' : 'KEYCODE_PROG_GREEN');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_PROG_YELLOW =
      RemoteKeyInject_RemoteKeyCode._(
          185, _omitEnumNames ? '' : 'KEYCODE_PROG_YELLOW');
  static const RemoteKeyInject_RemoteKeyCode KEYCODE_PROG_BLUE =
      RemoteKeyInject_RemoteKeyCode._(
          186, _omitEnumNames ? '' : 'KEYCODE_PROG_BLUE');

  static const $core.List<RemoteKeyInject_RemoteKeyCode> values =
      <RemoteKeyInject_RemoteKeyCode>[
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
    KEYCODE_SEARCH,
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
    KEYCODE_TV_INPUT_HDMI_1,
    KEYCODE_TV_INPUT_HDMI_2,
    KEYCODE_TV_INPUT_HDMI_3,
    KEYCODE_TV_INPUT_HDMI_4,
    KEYCODE_TV_INPUT_COMPONENT_1,
    KEYCODE_TV_INPUT_COMPOSITE_1,
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

  static final $core.Map<$core.int, RemoteKeyInject_RemoteKeyCode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RemoteKeyInject_RemoteKeyCode? valueOf($core.int value) =>
      _byValue[value];

  const RemoteKeyInject_RemoteKeyCode._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
