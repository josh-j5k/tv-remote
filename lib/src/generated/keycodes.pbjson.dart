// This is a generated file - do not edit.
//
// Generated from keycodes.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use remoteDirectionDescriptor instead')
const RemoteDirection$json = {
  '1': 'RemoteDirection',
  '2': [
    {'1': 'REMOTE_DIRECTION_UNKNOWN', '2': 0},
    {'1': 'PRESSED', '2': 1},
    {'1': 'RELEASED', '2': 2},
    {'1': 'SHORT_PRESS', '2': 3},
  ],
};

/// Descriptor for `RemoteDirection`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List remoteDirectionDescriptor = $convert.base64Decode(
    'Cg9SZW1vdGVEaXJlY3Rpb24SHAoYUkVNT1RFX0RJUkVDVElPTl9VTktOT1dOEAASCwoHUFJFU1'
    'NFRBABEgwKCFJFTEVBU0VEEAISDwoLU0hPUlRfUFJFU1MQAw==');

@$core.Deprecated('Use remoteVolumeDirectionDescriptor instead')
const RemoteVolumeDirection$json = {
  '1': 'RemoteVolumeDirection',
  '2': [
    {'1': 'VOLUME_DIRECTION_UNKNOWN', '2': 0},
    {'1': 'VOLUME_UP', '2': 1},
    {'1': 'VOLUME_DOWN', '2': 2},
  ],
};

/// Descriptor for `RemoteVolumeDirection`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List remoteVolumeDirectionDescriptor = $convert.base64Decode(
    'ChVSZW1vdGVWb2x1bWVEaXJlY3Rpb24SHAoYVk9MVU1FX0RJUkVDVElPTl9VTktOT1dOEAASDQ'
    'oJVk9MVU1FX1VQEAESDwoLVk9MVU1FX0RPV04QAg==');

@$core.Deprecated('Use remoteMessageDescriptor instead')
const RemoteMessage$json = {
  '1': 'RemoteMessage',
  '2': [
    {
      '1': 'remote_configure',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteConfigure',
      '9': 0,
      '10': 'remoteConfigure'
    },
    {
      '1': 'remote_set_active',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteSetActive',
      '9': 0,
      '10': 'remoteSetActive'
    },
    {
      '1': 'remote_error',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteError',
      '9': 0,
      '10': 'remoteError'
    },
    {
      '1': 'remote_ping_request',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.remote.RemotePingRequest',
      '9': 0,
      '10': 'remotePingRequest'
    },
    {
      '1': 'remote_ping_response',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.remote.RemotePingResponse',
      '9': 0,
      '10': 'remotePingResponse'
    },
    {
      '1': 'remote_key_inject',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteKeyInject',
      '9': 0,
      '10': 'remoteKeyInject'
    },
    {
      '1': 'remote_ime_key_inject',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteImeKeyInject',
      '9': 0,
      '10': 'remoteImeKeyInject'
    },
    {
      '1': 'remote_ime_batch_edit',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteImeBatchEdit',
      '9': 0,
      '10': 'remoteImeBatchEdit'
    },
    {
      '1': 'remote_ime_show_request',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteImeShowRequest',
      '9': 0,
      '10': 'remoteImeShowRequest'
    },
    {
      '1': 'remote_voice_begin',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteVoiceBegin',
      '9': 0,
      '10': 'remoteVoiceBegin'
    },
    {
      '1': 'remote_voice_payload',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteVoicePayload',
      '9': 0,
      '10': 'remoteVoicePayload'
    },
    {
      '1': 'remote_voice_end',
      '3': 32,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteVoiceEnd',
      '9': 0,
      '10': 'remoteVoiceEnd'
    },
    {
      '1': 'remote_start',
      '3': 40,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteStart',
      '9': 0,
      '10': 'remoteStart'
    },
    {
      '1': 'remote_set_volume_level',
      '3': 50,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteSetVolumeLevel',
      '9': 0,
      '10': 'remoteSetVolumeLevel'
    },
    {
      '1': 'remote_adjust_volume_level',
      '3': 51,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteAdjustVolumeLevel',
      '9': 0,
      '10': 'remoteAdjustVolumeLevel'
    },
    {
      '1': 'remote_set_preferred_audio_device',
      '3': 60,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteSetPreferredAudioDevice',
      '9': 0,
      '10': 'remoteSetPreferredAudioDevice'
    },
    {
      '1': 'remote_reset_preferred_audio_device',
      '3': 61,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteResetPreferredAudioDevice',
      '9': 0,
      '10': 'remoteResetPreferredAudioDevice'
    },
    {
      '1': 'remote_app_link_launch_request',
      '3': 90,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteAppLinkLaunchRequest',
      '9': 0,
      '10': 'remoteAppLinkLaunchRequest'
    },
  ],
  '8': [
    {'1': 'message'},
  ],
};

/// Descriptor for `RemoteMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteMessageDescriptor = $convert.base64Decode(
    'Cg1SZW1vdGVNZXNzYWdlEkQKEHJlbW90ZV9jb25maWd1cmUYASABKAsyFy5yZW1vdGUuUmVtb3'
    'RlQ29uZmlndXJlSABSD3JlbW90ZUNvbmZpZ3VyZRJFChFyZW1vdGVfc2V0X2FjdGl2ZRgCIAEo'
    'CzIXLnJlbW90ZS5SZW1vdGVTZXRBY3RpdmVIAFIPcmVtb3RlU2V0QWN0aXZlEjgKDHJlbW90ZV'
    '9lcnJvchgDIAEoCzITLnJlbW90ZS5SZW1vdGVFcnJvckgAUgtyZW1vdGVFcnJvchJLChNyZW1v'
    'dGVfcGluZ19yZXF1ZXN0GAggASgLMhkucmVtb3RlLlJlbW90ZVBpbmdSZXF1ZXN0SABSEXJlbW'
    '90ZVBpbmdSZXF1ZXN0Ek4KFHJlbW90ZV9waW5nX3Jlc3BvbnNlGAkgASgLMhoucmVtb3RlLlJl'
    'bW90ZVBpbmdSZXNwb25zZUgAUhJyZW1vdGVQaW5nUmVzcG9uc2USRQoRcmVtb3RlX2tleV9pbm'
    'plY3QYCiABKAsyFy5yZW1vdGUuUmVtb3RlS2V5SW5qZWN0SABSD3JlbW90ZUtleUluamVjdBJP'
    'ChVyZW1vdGVfaW1lX2tleV9pbmplY3QYFCABKAsyGi5yZW1vdGUuUmVtb3RlSW1lS2V5SW5qZW'
    'N0SABSEnJlbW90ZUltZUtleUluamVjdBJPChVyZW1vdGVfaW1lX2JhdGNoX2VkaXQYFSABKAsy'
    'Gi5yZW1vdGUuUmVtb3RlSW1lQmF0Y2hFZGl0SABSEnJlbW90ZUltZUJhdGNoRWRpdBJVChdyZW'
    '1vdGVfaW1lX3Nob3dfcmVxdWVzdBgWIAEoCzIcLnJlbW90ZS5SZW1vdGVJbWVTaG93UmVxdWVz'
    'dEgAUhRyZW1vdGVJbWVTaG93UmVxdWVzdBJIChJyZW1vdGVfdm9pY2VfYmVnaW4YHiABKAsyGC'
    '5yZW1vdGUuUmVtb3RlVm9pY2VCZWdpbkgAUhByZW1vdGVWb2ljZUJlZ2luEk4KFHJlbW90ZV92'
    'b2ljZV9wYXlsb2FkGB8gASgLMhoucmVtb3RlLlJlbW90ZVZvaWNlUGF5bG9hZEgAUhJyZW1vdG'
    'VWb2ljZVBheWxvYWQSQgoQcmVtb3RlX3ZvaWNlX2VuZBggIAEoCzIWLnJlbW90ZS5SZW1vdGVW'
    'b2ljZUVuZEgAUg5yZW1vdGVWb2ljZUVuZBI4CgxyZW1vdGVfc3RhcnQYKCABKAsyEy5yZW1vdG'
    'UuUmVtb3RlU3RhcnRIAFILcmVtb3RlU3RhcnQSVQoXcmVtb3RlX3NldF92b2x1bWVfbGV2ZWwY'
    'MiABKAsyHC5yZW1vdGUuUmVtb3RlU2V0Vm9sdW1lTGV2ZWxIAFIUcmVtb3RlU2V0Vm9sdW1lTG'
    'V2ZWwSXgoacmVtb3RlX2FkanVzdF92b2x1bWVfbGV2ZWwYMyABKAsyHy5yZW1vdGUuUmVtb3Rl'
    'QWRqdXN0Vm9sdW1lTGV2ZWxIAFIXcmVtb3RlQWRqdXN0Vm9sdW1lTGV2ZWwScQohcmVtb3RlX3'
    'NldF9wcmVmZXJyZWRfYXVkaW9fZGV2aWNlGDwgASgLMiUucmVtb3RlLlJlbW90ZVNldFByZWZl'
    'cnJlZEF1ZGlvRGV2aWNlSABSHXJlbW90ZVNldFByZWZlcnJlZEF1ZGlvRGV2aWNlEncKI3JlbW'
    '90ZV9yZXNldF9wcmVmZXJyZWRfYXVkaW9fZGV2aWNlGD0gASgLMicucmVtb3RlLlJlbW90ZVJl'
    'c2V0UHJlZmVycmVkQXVkaW9EZXZpY2VIAFIfcmVtb3RlUmVzZXRQcmVmZXJyZWRBdWRpb0Rldm'
    'ljZRJoCh5yZW1vdGVfYXBwX2xpbmtfbGF1bmNoX3JlcXVlc3QYWiABKAsyIi5yZW1vdGUuUmVt'
    'b3RlQXBwTGlua0xhdW5jaFJlcXVlc3RIAFIacmVtb3RlQXBwTGlua0xhdW5jaFJlcXVlc3RCCQ'
    'oHbWVzc2FnZQ==');

@$core.Deprecated('Use remoteKeyInjectDescriptor instead')
const RemoteKeyInject$json = {
  '1': 'RemoteKeyInject',
  '2': [
    {
      '1': 'key_code',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.remote.RemoteKeyInject.RemoteKeyCode',
      '10': 'keyCode'
    },
    {
      '1': 'direction',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.remote.RemoteDirection',
      '10': 'direction'
    },
  ],
  '4': [RemoteKeyInject_RemoteKeyCode$json],
};

@$core.Deprecated('Use remoteKeyInjectDescriptor instead')
const RemoteKeyInject_RemoteKeyCode$json = {
  '1': 'RemoteKeyCode',
  '2': [
    {'1': 'KEYCODE_UNKNOWN', '2': 0},
    {'1': 'KEYCODE_DPAD_UP', '2': 19},
    {'1': 'KEYCODE_DPAD_DOWN', '2': 20},
    {'1': 'KEYCODE_DPAD_LEFT', '2': 21},
    {'1': 'KEYCODE_DPAD_RIGHT', '2': 22},
    {'1': 'KEYCODE_DPAD_CENTER', '2': 23},
    {'1': 'KEYCODE_BACK', '2': 4},
    {'1': 'KEYCODE_HOME', '2': 3},
    {'1': 'KEYCODE_MENU', '2': 82},
    {'1': 'KEYCODE_GUIDE', '2': 172},
    {'1': 'KEYCODE_INFO', '2': 165},
    {'1': 'KEYCODE_SETTINGS', '2': 176},
    {'1': 'KEYCODE_MEDIA_PLAY', '2': 126},
    {'1': 'KEYCODE_MEDIA_PAUSE', '2': 127},
    {'1': 'KEYCODE_MEDIA_PLAY_PAUSE', '2': 85},
    {'1': 'KEYCODE_MEDIA_STOP', '2': 86},
    {'1': 'KEYCODE_MEDIA_NEXT', '2': 87},
    {'1': 'KEYCODE_MEDIA_PREVIOUS', '2': 88},
    {'1': 'KEYCODE_MEDIA_REWIND', '2': 89},
    {'1': 'KEYCODE_MEDIA_FAST_FORWARD', '2': 90},
    {'1': 'KEYCODE_MEDIA_RECORD', '2': 130},
    {'1': 'KEYCODE_SEARCH', '2': 84},
    {'1': 'KEYCODE_VOLUME_UP', '2': 24},
    {'1': 'KEYCODE_VOLUME_DOWN', '2': 25},
    {'1': 'KEYCODE_MUTE', '2': 91},
    {'1': 'KEYCODE_TV', '2': 170},
    {'1': 'KEYCODE_TV_POWER', '2': 177},
    {'1': 'KEYCODE_TV_INPUT', '2': 178},
    {'1': 'KEYCODE_CHANNEL_UP', '2': 166},
    {'1': 'KEYCODE_CHANNEL_DOWN', '2': 167},
    {'1': 'KEYCODE_TV_RADIO_SERVICE', '2': 232},
    {'1': 'KEYCODE_TV_DATA_SERVICE', '2': 230},
    {'1': 'KEYCODE_TV_TELETEXT', '2': 233},
    {'1': 'KEYCODE_TV_NETWORK', '2': 241},
    {'1': 'KEYCODE_TV_SATELLITE', '2': 237},
    {'1': 'KEYCODE_TV_ANTENNA_CABLE', '2': 238},
    {'1': 'KEYCODE_POWER', '2': 26},
    {'1': 'KEYCODE_SLEEP', '2': 223},
    {'1': 'KEYCODE_WAKEUP', '2': 224},
    {'1': 'KEYCODE_APP_SWITCH', '2': 187},
    {'1': 'KEYCODE_ASSIST', '2': 219},
    {'1': 'KEYCODE_VOICE_ASSIST', '2': 231},
    {'1': 'KEYCODE_TV_INPUT_HDMI_1', '2': 243},
    {'1': 'KEYCODE_TV_INPUT_HDMI_2', '2': 244},
    {'1': 'KEYCODE_TV_INPUT_HDMI_3', '2': 245},
    {'1': 'KEYCODE_TV_INPUT_HDMI_4', '2': 246},
    {'1': 'KEYCODE_TV_INPUT_COMPONENT_1', '2': 249},
    {'1': 'KEYCODE_TV_INPUT_COMPOSITE_1', '2': 247},
    {'1': 'KEYCODE_0', '2': 7},
    {'1': 'KEYCODE_1', '2': 8},
    {'1': 'KEYCODE_2', '2': 9},
    {'1': 'KEYCODE_3', '2': 10},
    {'1': 'KEYCODE_4', '2': 11},
    {'1': 'KEYCODE_5', '2': 12},
    {'1': 'KEYCODE_6', '2': 13},
    {'1': 'KEYCODE_7', '2': 14},
    {'1': 'KEYCODE_8', '2': 15},
    {'1': 'KEYCODE_9', '2': 16},
    {'1': 'KEYCODE_ENTER', '2': 66},
    {'1': 'KEYCODE_DEL', '2': 67},
    {'1': 'KEYCODE_SPACE', '2': 62},
    {'1': 'KEYCODE_PAGE_UP', '2': 92},
    {'1': 'KEYCODE_PAGE_DOWN', '2': 93},
    {'1': 'KEYCODE_PROG_RED', '2': 183},
    {'1': 'KEYCODE_PROG_GREEN', '2': 184},
    {'1': 'KEYCODE_PROG_YELLOW', '2': 185},
    {'1': 'KEYCODE_PROG_BLUE', '2': 186},
  ],
};

/// Descriptor for `RemoteKeyInject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteKeyInjectDescriptor = $convert.base64Decode(
    'Cg9SZW1vdGVLZXlJbmplY3QSQAoIa2V5X2NvZGUYASABKA4yJS5yZW1vdGUuUmVtb3RlS2V5SW'
    '5qZWN0LlJlbW90ZUtleUNvZGVSB2tleUNvZGUSNQoJZGlyZWN0aW9uGAIgASgOMhcucmVtb3Rl'
    'LlJlbW90ZURpcmVjdGlvblIJZGlyZWN0aW9uIo0MCg1SZW1vdGVLZXlDb2RlEhMKD0tFWUNPRE'
    'VfVU5LTk9XThAAEhMKD0tFWUNPREVfRFBBRF9VUBATEhUKEUtFWUNPREVfRFBBRF9ET1dOEBQS'
    'FQoRS0VZQ09ERV9EUEFEX0xFRlQQFRIWChJLRVlDT0RFX0RQQURfUklHSFQQFhIXChNLRVlDT0'
    'RFX0RQQURfQ0VOVEVSEBcSEAoMS0VZQ09ERV9CQUNLEAQSEAoMS0VZQ09ERV9IT01FEAMSEAoM'
    'S0VZQ09ERV9NRU5VEFISEgoNS0VZQ09ERV9HVUlERRCsARIRCgxLRVlDT0RFX0lORk8QpQESFQ'
    'oQS0VZQ09ERV9TRVRUSU5HUxCwARIWChJLRVlDT0RFX01FRElBX1BMQVkQfhIXChNLRVlDT0RF'
    'X01FRElBX1BBVVNFEH8SHAoYS0VZQ09ERV9NRURJQV9QTEFZX1BBVVNFEFUSFgoSS0VZQ09ERV'
    '9NRURJQV9TVE9QEFYSFgoSS0VZQ09ERV9NRURJQV9ORVhUEFcSGgoWS0VZQ09ERV9NRURJQV9Q'
    'UkVWSU9VUxBYEhgKFEtFWUNPREVfTUVESUFfUkVXSU5EEFkSHgoaS0VZQ09ERV9NRURJQV9GQV'
    'NUX0ZPUldBUkQQWhIZChRLRVlDT0RFX01FRElBX1JFQ09SRBCCARISCg5LRVlDT0RFX1NFQVJD'
    'SBBUEhUKEUtFWUNPREVfVk9MVU1FX1VQEBgSFwoTS0VZQ09ERV9WT0xVTUVfRE9XThAZEhAKDE'
    'tFWUNPREVfTVVURRBbEg8KCktFWUNPREVfVFYQqgESFQoQS0VZQ09ERV9UVl9QT1dFUhCxARIV'
    'ChBLRVlDT0RFX1RWX0lOUFVUELIBEhcKEktFWUNPREVfQ0hBTk5FTF9VUBCmARIZChRLRVlDT0'
    'RFX0NIQU5ORUxfRE9XThCnARIdChhLRVlDT0RFX1RWX1JBRElPX1NFUlZJQ0UQ6AESHAoXS0VZ'
    'Q09ERV9UVl9EQVRBX1NFUlZJQ0UQ5gESGAoTS0VZQ09ERV9UVl9URUxFVEVYVBDpARIXChJLRV'
    'lDT0RFX1RWX05FVFdPUksQ8QESGQoUS0VZQ09ERV9UVl9TQVRFTExJVEUQ7QESHQoYS0VZQ09E'
    'RV9UVl9BTlRFTk5BX0NBQkxFEO4BEhEKDUtFWUNPREVfUE9XRVIQGhISCg1LRVlDT0RFX1NMRU'
    'VQEN8BEhMKDktFWUNPREVfV0FLRVVQEOABEhcKEktFWUNPREVfQVBQX1NXSVRDSBC7ARITCg5L'
    'RVlDT0RFX0FTU0lTVBDbARIZChRLRVlDT0RFX1ZPSUNFX0FTU0lTVBDnARIcChdLRVlDT0RFX1'
    'RWX0lOUFVUX0hETUlfMRDzARIcChdLRVlDT0RFX1RWX0lOUFVUX0hETUlfMhD0ARIcChdLRVlD'
    'T0RFX1RWX0lOUFVUX0hETUlfMxD1ARIcChdLRVlDT0RFX1RWX0lOUFVUX0hETUlfNBD2ARIhCh'
    'xLRVlDT0RFX1RWX0lOUFVUX0NPTVBPTkVOVF8xEPkBEiEKHEtFWUNPREVfVFZfSU5QVVRfQ09N'
    'UE9TSVRFXzEQ9wESDQoJS0VZQ09ERV8wEAcSDQoJS0VZQ09ERV8xEAgSDQoJS0VZQ09ERV8yEA'
    'kSDQoJS0VZQ09ERV8zEAoSDQoJS0VZQ09ERV80EAsSDQoJS0VZQ09ERV81EAwSDQoJS0VZQ09E'
    'RV82EA0SDQoJS0VZQ09ERV83EA4SDQoJS0VZQ09ERV84EA8SDQoJS0VZQ09ERV85EBASEQoNS0'
    'VZQ09ERV9FTlRFUhBCEg8KC0tFWUNPREVfREVMEEMSEQoNS0VZQ09ERV9TUEFDRRA+EhMKD0tF'
    'WUNPREVfUEFHRV9VUBBcEhUKEUtFWUNPREVfUEFHRV9ET1dOEF0SFQoQS0VZQ09ERV9QUk9HX1'
    'JFRBC3ARIXChJLRVlDT0RFX1BST0dfR1JFRU4QuAESGAoTS0VZQ09ERV9QUk9HX1lFTExPVxC5'
    'ARIWChFLRVlDT0RFX1BST0dfQkxVRRC6AQ==');

@$core.Deprecated('Use remoteAppLinkLaunchRequestDescriptor instead')
const RemoteAppLinkLaunchRequest$json = {
  '1': 'RemoteAppLinkLaunchRequest',
  '2': [
    {'1': 'app_link', '3': 1, '4': 1, '5': 9, '10': 'appLink'},
  ],
};

/// Descriptor for `RemoteAppLinkLaunchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteAppLinkLaunchRequestDescriptor =
    $convert.base64Decode(
        'ChpSZW1vdGVBcHBMaW5rTGF1bmNoUmVxdWVzdBIZCghhcHBfbGluaxgBIAEoCVIHYXBwTGluaw'
        '==');

@$core.Deprecated('Use remoteVoicePayloadDescriptor instead')
const RemoteVoicePayload$json = {
  '1': 'RemoteVoicePayload',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 5, '10': 'sessionId'},
    {'1': 'samples', '3': 2, '4': 1, '5': 12, '10': 'samples'},
  ],
};

/// Descriptor for `RemoteVoicePayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteVoicePayloadDescriptor = $convert.base64Decode(
    'ChJSZW1vdGVWb2ljZVBheWxvYWQSHQoKc2Vzc2lvbl9pZBgBIAEoBVIJc2Vzc2lvbklkEhgKB3'
    'NhbXBsZXMYAiABKAxSB3NhbXBsZXM=');

@$core.Deprecated('Use remoteVoiceBeginDescriptor instead')
const RemoteVoiceBegin$json = {
  '1': 'RemoteVoiceBegin',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 5, '10': 'sessionId'},
    {'1': 'package_name', '3': 2, '4': 1, '5': 9, '10': 'packageName'},
  ],
};

/// Descriptor for `RemoteVoiceBegin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteVoiceBeginDescriptor = $convert.base64Decode(
    'ChBSZW1vdGVWb2ljZUJlZ2luEh0KCnNlc3Npb25faWQYASABKAVSCXNlc3Npb25JZBIhCgxwYW'
    'NrYWdlX25hbWUYAiABKAlSC3BhY2thZ2VOYW1l');

@$core.Deprecated('Use remoteVoiceEndDescriptor instead')
const RemoteVoiceEnd$json = {
  '1': 'RemoteVoiceEnd',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 5, '10': 'sessionId'},
  ],
};

/// Descriptor for `RemoteVoiceEnd`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteVoiceEndDescriptor = $convert.base64Decode(
    'Cg5SZW1vdGVWb2ljZUVuZBIdCgpzZXNzaW9uX2lkGAEgASgFUglzZXNzaW9uSWQ=');

@$core.Deprecated('Use remoteConfigureDescriptor instead')
const RemoteConfigure$json = {
  '1': 'RemoteConfigure',
  '2': [
    {'1': 'code1', '3': 1, '4': 1, '5': 13, '10': 'code1'},
    {
      '1': 'device_info',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteDeviceInfo',
      '10': 'deviceInfo'
    },
  ],
};

/// Descriptor for `RemoteConfigure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteConfigureDescriptor = $convert.base64Decode(
    'Cg9SZW1vdGVDb25maWd1cmUSFAoFY29kZTEYASABKA1SBWNvZGUxEjkKC2RldmljZV9pbmZvGA'
    'IgASgLMhgucmVtb3RlLlJlbW90ZURldmljZUluZm9SCmRldmljZUluZm8=');

@$core.Deprecated('Use remoteStartDescriptor instead')
const RemoteStart$json = {
  '1': 'RemoteStart',
  '2': [
    {'1': 'started', '3': 1, '4': 1, '5': 8, '10': 'started'},
  ],
};

/// Descriptor for `RemoteStart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteStartDescriptor = $convert
    .base64Decode('CgtSZW1vdGVTdGFydBIYCgdzdGFydGVkGAEgASgIUgdzdGFydGVk');

@$core.Deprecated('Use remoteDeviceInfoDescriptor instead')
const RemoteDeviceInfo$json = {
  '1': 'RemoteDeviceInfo',
  '2': [
    {'1': 'model', '3': 1, '4': 1, '5': 9, '10': 'model'},
    {'1': 'vendor', '3': 2, '4': 1, '5': 9, '10': 'vendor'},
    {'1': 'unknown1', '3': 3, '4': 1, '5': 5, '10': 'unknown1'},
    {'1': 'unknown2', '3': 4, '4': 1, '5': 9, '10': 'unknown2'},
    {'1': 'package_name', '3': 5, '4': 1, '5': 9, '10': 'packageName'},
    {'1': 'app_version', '3': 6, '4': 1, '5': 9, '10': 'appVersion'},
  ],
};

/// Descriptor for `RemoteDeviceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteDeviceInfoDescriptor = $convert.base64Decode(
    'ChBSZW1vdGVEZXZpY2VJbmZvEhQKBW1vZGVsGAEgASgJUgVtb2RlbBIWCgZ2ZW5kb3IYAiABKA'
    'lSBnZlbmRvchIaCgh1bmtub3duMRgDIAEoBVIIdW5rbm93bjESGgoIdW5rbm93bjIYBCABKAlS'
    'CHVua25vd24yEiEKDHBhY2thZ2VfbmFtZRgFIAEoCVILcGFja2FnZU5hbWUSHwoLYXBwX3Zlcn'
    'Npb24YBiABKAlSCmFwcFZlcnNpb24=');

@$core.Deprecated('Use remoteVolumeInfoDescriptor instead')
const RemoteVolumeInfo$json = {
  '1': 'RemoteVolumeInfo',
  '2': [
    {'1': 'audio_device_id', '3': 1, '4': 1, '5': 5, '10': 'audioDeviceId'},
    {'1': 'max_volume', '3': 2, '4': 1, '5': 5, '10': 'maxVolume'},
    {'1': 'device_name', '3': 3, '4': 1, '5': 9, '10': 'deviceName'},
    {'1': 'current_volume', '3': 4, '4': 1, '5': 5, '10': 'currentVolume'},
    {'1': 'is_muted', '3': 5, '4': 1, '5': 8, '10': 'isMuted'},
    {'1': 'volume_step', '3': 6, '4': 1, '5': 5, '10': 'volumeStep'},
    {'1': 'unknown1', '3': 7, '4': 1, '5': 5, '10': 'unknown1'},
    {'1': 'unknown2', '3': 8, '4': 1, '5': 8, '10': 'unknown2'},
  ],
};

/// Descriptor for `RemoteVolumeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteVolumeInfoDescriptor = $convert.base64Decode(
    'ChBSZW1vdGVWb2x1bWVJbmZvEiYKD2F1ZGlvX2RldmljZV9pZBgBIAEoBVINYXVkaW9EZXZpY2'
    'VJZBIdCgptYXhfdm9sdW1lGAIgASgFUgltYXhWb2x1bWUSHwoLZGV2aWNlX25hbWUYAyABKAlS'
    'CmRldmljZU5hbWUSJQoOY3VycmVudF92b2x1bWUYBCABKAVSDWN1cnJlbnRWb2x1bWUSGQoIaX'
    'NfbXV0ZWQYBSABKAhSB2lzTXV0ZWQSHwoLdm9sdW1lX3N0ZXAYBiABKAVSCnZvbHVtZVN0ZXAS'
    'GgoIdW5rbm93bjEYByABKAVSCHVua25vd24xEhoKCHVua25vd24yGAggASgIUgh1bmtub3duMg'
    '==');

@$core.Deprecated('Use remoteImeShowRequestDescriptor instead')
const RemoteImeShowRequest$json = {
  '1': 'RemoteImeShowRequest',
  '2': [
    {
      '1': 'remote_text_field_status',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteTextFieldStatus',
      '10': 'remoteTextFieldStatus'
    },
  ],
};

/// Descriptor for `RemoteImeShowRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteImeShowRequestDescriptor = $convert.base64Decode(
    'ChRSZW1vdGVJbWVTaG93UmVxdWVzdBJWChhyZW1vdGVfdGV4dF9maWVsZF9zdGF0dXMYAiABKA'
    'syHS5yZW1vdGUuUmVtb3RlVGV4dEZpZWxkU3RhdHVzUhVyZW1vdGVUZXh0RmllbGRTdGF0dXM=');

@$core.Deprecated('Use remotePowerInfoDescriptor instead')
const RemotePowerInfo$json = {
  '1': 'RemotePowerInfo',
  '2': [
    {'1': 'is_on', '3': 1, '4': 1, '5': 8, '10': 'isOn'},
  ],
};

/// Descriptor for `RemotePowerInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remotePowerInfoDescriptor = $convert
    .base64Decode('Cg9SZW1vdGVQb3dlckluZm8SEwoFaXNfb24YASABKAhSBGlzT24=');

@$core.Deprecated('Use remoteSetActiveDescriptor instead')
const RemoteSetActive$json = {
  '1': 'RemoteSetActive',
  '2': [
    {'1': 'active', '3': 1, '4': 1, '5': 13, '10': 'active'},
  ],
};

/// Descriptor for `RemoteSetActive`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteSetActiveDescriptor = $convert
    .base64Decode('Cg9SZW1vdGVTZXRBY3RpdmUSFgoGYWN0aXZlGAEgASgNUgZhY3RpdmU=');

@$core.Deprecated('Use remoteTextFieldStatusDescriptor instead')
const RemoteTextFieldStatus$json = {
  '1': 'RemoteTextFieldStatus',
  '2': [
    {'1': 'counter_field', '3': 1, '4': 1, '5': 5, '10': 'counterField'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    {'1': 'start', '3': 3, '4': 1, '5': 5, '10': 'start'},
    {'1': 'end', '3': 4, '4': 1, '5': 5, '10': 'end'},
    {'1': 'int5', '3': 5, '4': 1, '5': 5, '10': 'int5'},
    {'1': 'label', '3': 6, '4': 1, '5': 9, '10': 'label'},
  ],
};

/// Descriptor for `RemoteTextFieldStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteTextFieldStatusDescriptor = $convert.base64Decode(
    'ChVSZW1vdGVUZXh0RmllbGRTdGF0dXMSIwoNY291bnRlcl9maWVsZBgBIAEoBVIMY291bnRlck'
    'ZpZWxkEhQKBXZhbHVlGAIgASgJUgV2YWx1ZRIUCgVzdGFydBgDIAEoBVIFc3RhcnQSEAoDZW5k'
    'GAQgASgFUgNlbmQSEgoEaW50NRgFIAEoBVIEaW50NRIUCgVsYWJlbBgGIAEoCVIFbGFiZWw=');

@$core.Deprecated('Use remoteImeKeyInjectDescriptor instead')
const RemoteImeKeyInject$json = {
  '1': 'RemoteImeKeyInject',
  '2': [
    {'1': 'text_field', '3': 1, '4': 1, '5': 9, '10': 'textField'},
    {'1': 'key_code', '3': 2, '4': 1, '5': 13, '10': 'keyCode'},
    {
      '1': 'direction',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.remote.RemoteDirection',
      '10': 'direction'
    },
  ],
};

/// Descriptor for `RemoteImeKeyInject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteImeKeyInjectDescriptor = $convert.base64Decode(
    'ChJSZW1vdGVJbWVLZXlJbmplY3QSHQoKdGV4dF9maWVsZBgBIAEoCVIJdGV4dEZpZWxkEhkKCG'
    'tleV9jb2RlGAIgASgNUgdrZXlDb2RlEjUKCWRpcmVjdGlvbhgDIAEoDjIXLnJlbW90ZS5SZW1v'
    'dGVEaXJlY3Rpb25SCWRpcmVjdGlvbg==');

@$core.Deprecated('Use remoteImeBatchEditDescriptor instead')
const RemoteImeBatchEdit$json = {
  '1': 'RemoteImeBatchEdit',
  '2': [
    {'1': 'ime_counter', '3': 1, '4': 1, '5': 5, '10': 'imeCounter'},
    {'1': 'field_counter', '3': 2, '4': 1, '5': 5, '10': 'fieldCounter'},
    {
      '1': 'edit_info',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.remote.RemoteEditInfo',
      '10': 'editInfo'
    },
  ],
};

/// Descriptor for `RemoteImeBatchEdit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteImeBatchEditDescriptor = $convert.base64Decode(
    'ChJSZW1vdGVJbWVCYXRjaEVkaXQSHwoLaW1lX2NvdW50ZXIYASABKAVSCmltZUNvdW50ZXISIw'
    'oNZmllbGRfY291bnRlchgCIAEoBVIMZmllbGRDb3VudGVyEjMKCWVkaXRfaW5mbxgDIAMoCzIW'
    'LnJlbW90ZS5SZW1vdGVFZGl0SW5mb1IIZWRpdEluZm8=');

@$core.Deprecated('Use remoteEditInfoDescriptor instead')
const RemoteEditInfo$json = {
  '1': 'RemoteEditInfo',
  '2': [
    {'1': 'insert', '3': 1, '4': 1, '5': 13, '10': 'insert'},
    {
      '1': 'text_field_status',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteImeObject',
      '10': 'textFieldStatus'
    },
  ],
};

/// Descriptor for `RemoteEditInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteEditInfoDescriptor = $convert.base64Decode(
    'Cg5SZW1vdGVFZGl0SW5mbxIWCgZpbnNlcnQYASABKA1SBmluc2VydBJDChF0ZXh0X2ZpZWxkX3'
    'N0YXR1cxgCIAEoCzIXLnJlbW90ZS5SZW1vdGVJbWVPYmplY3RSD3RleHRGaWVsZFN0YXR1cw==');

@$core.Deprecated('Use remoteImeObjectDescriptor instead')
const RemoteImeObject$json = {
  '1': 'RemoteImeObject',
  '2': [
    {'1': 'start', '3': 1, '4': 1, '5': 5, '10': 'start'},
    {'1': 'end', '3': 2, '4': 1, '5': 5, '10': 'end'},
    {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `RemoteImeObject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteImeObjectDescriptor = $convert.base64Decode(
    'Cg9SZW1vdGVJbWVPYmplY3QSFAoFc3RhcnQYASABKAVSBXN0YXJ0EhAKA2VuZBgCIAEoBVIDZW'
    '5kEhQKBXZhbHVlGAMgASgJUgV2YWx1ZQ==');

@$core.Deprecated('Use remoteAppInfoDescriptor instead')
const RemoteAppInfo$json = {
  '1': 'RemoteAppInfo',
  '2': [
    {'1': 'counter', '3': 1, '4': 1, '5': 5, '10': 'counter'},
    {'1': 'int2', '3': 2, '4': 1, '5': 5, '10': 'int2'},
    {'1': 'int3', '3': 3, '4': 1, '5': 5, '10': 'int3'},
    {'1': 'int4', '3': 4, '4': 1, '5': 9, '10': 'int4'},
    {'1': 'int7', '3': 7, '4': 1, '5': 5, '10': 'int7'},
    {'1': 'int8', '3': 8, '4': 1, '5': 5, '10': 'int8'},
    {'1': 'label', '3': 10, '4': 1, '5': 9, '10': 'label'},
    {'1': 'app_package', '3': 12, '4': 1, '5': 9, '10': 'appPackage'},
    {'1': 'int13', '3': 13, '4': 1, '5': 5, '10': 'int13'},
  ],
};

/// Descriptor for `RemoteAppInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteAppInfoDescriptor = $convert.base64Decode(
    'Cg1SZW1vdGVBcHBJbmZvEhgKB2NvdW50ZXIYASABKAVSB2NvdW50ZXISEgoEaW50MhgCIAEoBV'
    'IEaW50MhISCgRpbnQzGAMgASgFUgRpbnQzEhIKBGludDQYBCABKAlSBGludDQSEgoEaW50NxgH'
    'IAEoBVIEaW50NxISCgRpbnQ4GAggASgFUgRpbnQ4EhQKBWxhYmVsGAogASgJUgVsYWJlbBIfCg'
    'thcHBfcGFja2FnZRgMIAEoCVIKYXBwUGFja2FnZRIUCgVpbnQxMxgNIAEoBVIFaW50MTM=');

@$core.Deprecated('Use remotePingRequestDescriptor instead')
const RemotePingRequest$json = {
  '1': 'RemotePingRequest',
  '2': [
    {'1': 'val1', '3': 1, '4': 1, '5': 5, '10': 'val1'},
    {'1': 'val2', '3': 2, '4': 1, '5': 5, '10': 'val2'},
  ],
};

/// Descriptor for `RemotePingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remotePingRequestDescriptor = $convert.base64Decode(
    'ChFSZW1vdGVQaW5nUmVxdWVzdBISCgR2YWwxGAEgASgFUgR2YWwxEhIKBHZhbDIYAiABKAVSBH'
    'ZhbDI=');

@$core.Deprecated('Use remotePingResponseDescriptor instead')
const RemotePingResponse$json = {
  '1': 'RemotePingResponse',
  '2': [
    {'1': 'val1', '3': 1, '4': 1, '5': 5, '10': 'val1'},
    {'1': 'val2', '3': 2, '4': 1, '5': 5, '10': 'val2'},
  ],
};

/// Descriptor for `RemotePingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remotePingResponseDescriptor = $convert.base64Decode(
    'ChJSZW1vdGVQaW5nUmVzcG9uc2USEgoEdmFsMRgBIAEoBVIEdmFsMRISCgR2YWwyGAIgASgFUg'
    'R2YWwy');

@$core.Deprecated('Use remoteGetPowerStatusDescriptor instead')
const RemoteGetPowerStatus$json = {
  '1': 'RemoteGetPowerStatus',
};

/// Descriptor for `RemoteGetPowerStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteGetPowerStatusDescriptor =
    $convert.base64Decode('ChRSZW1vdGVHZXRQb3dlclN0YXR1cw==');

@$core.Deprecated('Use remotePowerStatusDescriptor instead')
const RemotePowerStatus$json = {
  '1': 'RemotePowerStatus',
  '2': [
    {'1': 'is_powered_on', '3': 1, '4': 1, '5': 8, '10': 'isPoweredOn'},
  ],
};

/// Descriptor for `RemotePowerStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remotePowerStatusDescriptor = $convert.base64Decode(
    'ChFSZW1vdGVQb3dlclN0YXR1cxIiCg1pc19wb3dlcmVkX29uGAEgASgIUgtpc1Bvd2VyZWRPbg'
    '==');

@$core.Deprecated('Use remoteSetVolumeLevelDescriptor instead')
const RemoteSetVolumeLevel$json = {
  '1': 'RemoteSetVolumeLevel',
  '2': [
    {'1': 'unknown1', '3': 1, '4': 1, '5': 13, '10': 'unknown1'},
    {'1': 'unknown2', '3': 2, '4': 1, '5': 13, '10': 'unknown2'},
    {'1': 'player_model', '3': 3, '4': 1, '5': 9, '10': 'playerModel'},
    {'1': 'unknown4', '3': 4, '4': 1, '5': 13, '10': 'unknown4'},
    {'1': 'unknown5', '3': 5, '4': 1, '5': 13, '10': 'unknown5'},
    {'1': 'volume_max', '3': 6, '4': 1, '5': 13, '10': 'volumeMax'},
    {'1': 'volume_level', '3': 7, '4': 1, '5': 13, '10': 'volumeLevel'},
    {'1': 'volume_muted', '3': 8, '4': 1, '5': 8, '10': 'volumeMuted'},
  ],
};

/// Descriptor for `RemoteSetVolumeLevel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteSetVolumeLevelDescriptor = $convert.base64Decode(
    'ChRSZW1vdGVTZXRWb2x1bWVMZXZlbBIaCgh1bmtub3duMRgBIAEoDVIIdW5rbm93bjESGgoIdW'
    '5rbm93bjIYAiABKA1SCHVua25vd24yEiEKDHBsYXllcl9tb2RlbBgDIAEoCVILcGxheWVyTW9k'
    'ZWwSGgoIdW5rbm93bjQYBCABKA1SCHVua25vd240EhoKCHVua25vd241GAUgASgNUgh1bmtub3'
    'duNRIdCgp2b2x1bWVfbWF4GAYgASgNUgl2b2x1bWVNYXgSIQoMdm9sdW1lX2xldmVsGAcgASgN'
    'Ugt2b2x1bWVMZXZlbBIhCgx2b2x1bWVfbXV0ZWQYCCABKAhSC3ZvbHVtZU11dGVk');

@$core.Deprecated('Use remoteAdjustVolumeLevelDescriptor instead')
const RemoteAdjustVolumeLevel$json = {
  '1': 'RemoteAdjustVolumeLevel',
  '2': [
    {
      '1': 'direction',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.remote.RemoteVolumeDirection',
      '10': 'direction'
    },
  ],
};

/// Descriptor for `RemoteAdjustVolumeLevel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteAdjustVolumeLevelDescriptor =
    $convert.base64Decode(
        'ChdSZW1vdGVBZGp1c3RWb2x1bWVMZXZlbBI7CglkaXJlY3Rpb24YASABKA4yHS5yZW1vdGUuUm'
        'Vtb3RlVm9sdW1lRGlyZWN0aW9uUglkaXJlY3Rpb24=');

@$core.Deprecated('Use remoteSetPreferredAudioDeviceDescriptor instead')
const RemoteSetPreferredAudioDevice$json = {
  '1': 'RemoteSetPreferredAudioDevice',
  '2': [
    {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `RemoteSetPreferredAudioDevice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteSetPreferredAudioDeviceDescriptor =
    $convert.base64Decode(
        'Ch1SZW1vdGVTZXRQcmVmZXJyZWRBdWRpb0RldmljZRIbCglkZXZpY2VfaWQYASABKAlSCGRldm'
        'ljZUlk');

@$core.Deprecated('Use remoteResetPreferredAudioDeviceDescriptor instead')
const RemoteResetPreferredAudioDevice$json = {
  '1': 'RemoteResetPreferredAudioDevice',
};

/// Descriptor for `RemoteResetPreferredAudioDevice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteResetPreferredAudioDeviceDescriptor =
    $convert.base64Decode('Ch9SZW1vdGVSZXNldFByZWZlcnJlZEF1ZGlvRGV2aWNl');

@$core.Deprecated('Use remoteErrorDescriptor instead')
const RemoteError$json = {
  '1': 'RemoteError',
  '2': [
    {'1': 'error_code', '3': 1, '4': 1, '5': 13, '10': 'errorCode'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `RemoteError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteErrorDescriptor = $convert.base64Decode(
    'CgtSZW1vdGVFcnJvchIdCgplcnJvcl9jb2RlGAEgASgNUgllcnJvckNvZGUSIwoNZXJyb3JfbW'
    'Vzc2FnZRgCIAEoCVIMZXJyb3JNZXNzYWdl');
