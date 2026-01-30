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
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteImeKeyInject',
      '9': 0,
      '10': 'remoteImeKeyInject'
    },
    {
      '1': 'remote_error',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteError',
      '9': 0,
      '10': 'remoteError'
    },
    {
      '1': 'remote_app_info',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteAppInfo',
      '9': 0,
      '10': 'remoteAppInfo'
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
      '1': 'remote_adjust_volume_level',
      '3': 25,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteAdjustVolumeLevel',
      '9': 0,
      '10': 'remoteAdjustVolumeLevel'
    },
    {
      '1': 'remote_set_preferred_audio_device',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteSetPreferredAudioDevice',
      '9': 0,
      '10': 'remoteSetPreferredAudioDevice'
    },
    {
      '1': 'remote_reset_preferred_audio_device',
      '3': 32,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteResetPreferredAudioDevice',
      '9': 0,
      '10': 'remoteResetPreferredAudioDevice'
    },
    {
      '1': 'remote_power_status',
      '3': 35,
      '4': 1,
      '5': 11,
      '6': '.remote.RemotePowerStatus',
      '9': 0,
      '10': 'remotePowerStatus'
    },
    {
      '1': 'remote_get_power_status',
      '3': 36,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteGetPowerStatus',
      '9': 0,
      '10': 'remoteGetPowerStatus'
    },
    {
      '1': 'remote_power_info',
      '3': 40,
      '4': 1,
      '5': 11,
      '6': '.remote.RemotePowerInfo',
      '9': 0,
      '10': 'remotePowerInfo'
    },
    {
      '1': 'remote_volume_info',
      '3': 50,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteVolumeInfo',
      '9': 0,
      '10': 'remoteVolumeInfo'
    },
    {
      '1': 'remote_start_app',
      '3': 330,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteStartApp',
      '9': 0,
      '10': 'remoteStartApp'
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
    'CzIXLnJlbW90ZS5SZW1vdGVTZXRBY3RpdmVIAFIPcmVtb3RlU2V0QWN0aXZlEksKE3JlbW90ZV'
    '9waW5nX3JlcXVlc3QYCCABKAsyGS5yZW1vdGUuUmVtb3RlUGluZ1JlcXVlc3RIAFIRcmVtb3Rl'
    'UGluZ1JlcXVlc3QSTgoUcmVtb3RlX3BpbmdfcmVzcG9uc2UYCSABKAsyGi5yZW1vdGUuUmVtb3'
    'RlUGluZ1Jlc3BvbnNlSABSEnJlbW90ZVBpbmdSZXNwb25zZRJFChFyZW1vdGVfa2V5X2luamVj'
    'dBgKIAEoCzIXLnJlbW90ZS5SZW1vdGVLZXlJbmplY3RIAFIPcmVtb3RlS2V5SW5qZWN0Ek8KFX'
    'JlbW90ZV9pbWVfa2V5X2luamVjdBgLIAEoCzIaLnJlbW90ZS5SZW1vdGVJbWVLZXlJbmplY3RI'
    'AFIScmVtb3RlSW1lS2V5SW5qZWN0EjgKDHJlbW90ZV9lcnJvchgPIAEoCzITLnJlbW90ZS5SZW'
    '1vdGVFcnJvckgAUgtyZW1vdGVFcnJvchI/Cg9yZW1vdGVfYXBwX2luZm8YFCABKAsyFS5yZW1v'
    'dGUuUmVtb3RlQXBwSW5mb0gAUg1yZW1vdGVBcHBJbmZvEk8KFXJlbW90ZV9pbWVfYmF0Y2hfZW'
    'RpdBgVIAEoCzIaLnJlbW90ZS5SZW1vdGVJbWVCYXRjaEVkaXRIAFIScmVtb3RlSW1lQmF0Y2hF'
    'ZGl0El4KGnJlbW90ZV9hZGp1c3Rfdm9sdW1lX2xldmVsGBkgASgLMh8ucmVtb3RlLlJlbW90ZU'
    'FkanVzdFZvbHVtZUxldmVsSABSF3JlbW90ZUFkanVzdFZvbHVtZUxldmVsEnEKIXJlbW90ZV9z'
    'ZXRfcHJlZmVycmVkX2F1ZGlvX2RldmljZRgfIAEoCzIlLnJlbW90ZS5SZW1vdGVTZXRQcmVmZX'
    'JyZWRBdWRpb0RldmljZUgAUh1yZW1vdGVTZXRQcmVmZXJyZWRBdWRpb0RldmljZRJ3CiNyZW1v'
    'dGVfcmVzZXRfcHJlZmVycmVkX2F1ZGlvX2RldmljZRggIAEoCzInLnJlbW90ZS5SZW1vdGVSZX'
    'NldFByZWZlcnJlZEF1ZGlvRGV2aWNlSABSH3JlbW90ZVJlc2V0UHJlZmVycmVkQXVkaW9EZXZp'
    'Y2USSwoTcmVtb3RlX3Bvd2VyX3N0YXR1cxgjIAEoCzIZLnJlbW90ZS5SZW1vdGVQb3dlclN0YX'
    'R1c0gAUhFyZW1vdGVQb3dlclN0YXR1cxJVChdyZW1vdGVfZ2V0X3Bvd2VyX3N0YXR1cxgkIAEo'
    'CzIcLnJlbW90ZS5SZW1vdGVHZXRQb3dlclN0YXR1c0gAUhRyZW1vdGVHZXRQb3dlclN0YXR1cx'
    'JFChFyZW1vdGVfcG93ZXJfaW5mbxgoIAEoCzIXLnJlbW90ZS5SZW1vdGVQb3dlckluZm9IAFIP'
    'cmVtb3RlUG93ZXJJbmZvEkgKEnJlbW90ZV92b2x1bWVfaW5mbxgyIAEoCzIYLnJlbW90ZS5SZW'
    '1vdGVWb2x1bWVJbmZvSABSEHJlbW90ZVZvbHVtZUluZm8SQwoQcmVtb3RlX3N0YXJ0X2FwcBjK'
    'AiABKAsyFi5yZW1vdGUuUmVtb3RlU3RhcnRBcHBIAFIOcmVtb3RlU3RhcnRBcHBCCQoHbWVzc2'
    'FnZQ==');

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
    'LlJlbW90ZURpcmVjdGlvblIJZGlyZWN0aW9uIrsKCg1SZW1vdGVLZXlDb2RlEhMKD0tFWUNPRE'
    'VfVU5LTk9XThAAEhMKD0tFWUNPREVfRFBBRF9VUBATEhUKEUtFWUNPREVfRFBBRF9ET1dOEBQS'
    'FQoRS0VZQ09ERV9EUEFEX0xFRlQQFRIWChJLRVlDT0RFX0RQQURfUklHSFQQFhIXChNLRVlDT0'
    'RFX0RQQURfQ0VOVEVSEBcSEAoMS0VZQ09ERV9CQUNLEAQSEAoMS0VZQ09ERV9IT01FEAMSEAoM'
    'S0VZQ09ERV9NRU5VEFISEgoNS0VZQ09ERV9HVUlERRCsARIRCgxLRVlDT0RFX0lORk8QpQESFQ'
    'oQS0VZQ09ERV9TRVRUSU5HUxCwARIWChJLRVlDT0RFX01FRElBX1BMQVkQfhIXChNLRVlDT0RF'
    'X01FRElBX1BBVVNFEH8SHAoYS0VZQ09ERV9NRURJQV9QTEFZX1BBVVNFEFUSFgoSS0VZQ09ERV'
    '9NRURJQV9TVE9QEFYSFgoSS0VZQ09ERV9NRURJQV9ORVhUEFcSGgoWS0VZQ09ERV9NRURJQV9Q'
    'UkVWSU9VUxBYEhgKFEtFWUNPREVfTUVESUFfUkVXSU5EEFkSHgoaS0VZQ09ERV9NRURJQV9GQV'
    'NUX0ZPUldBUkQQWhIZChRLRVlDT0RFX01FRElBX1JFQ09SRBCCARIVChFLRVlDT0RFX1ZPTFVN'
    'RV9VUBAYEhcKE0tFWUNPREVfVk9MVU1FX0RPV04QGRIQCgxLRVlDT0RFX01VVEUQWxIPCgpLRV'
    'lDT0RFX1RWEKoBEhUKEEtFWUNPREVfVFZfUE9XRVIQsQESFQoQS0VZQ09ERV9UVl9JTlBVVBCy'
    'ARIXChJLRVlDT0RFX0NIQU5ORUxfVVAQpgESGQoUS0VZQ09ERV9DSEFOTkVMX0RPV04QpwESHQ'
    'oYS0VZQ09ERV9UVl9SQURJT19TRVJWSUNFEOgBEhwKF0tFWUNPREVfVFZfREFUQV9TRVJWSUNF'
    'EOYBEhgKE0tFWUNPREVfVFZfVEVMRVRFWFQQ6QESFwoSS0VZQ09ERV9UVl9ORVRXT1JLEPEBEh'
    'kKFEtFWUNPREVfVFZfU0FURUxMSVRFEO0BEh0KGEtFWUNPREVfVFZfQU5URU5OQV9DQUJMRRDu'
    'ARIRCg1LRVlDT0RFX1BPV0VSEBoSEgoNS0VZQ09ERV9TTEVFUBDfARITCg5LRVlDT0RFX1dBS0'
    'VVUBDgARIXChJLRVlDT0RFX0FQUF9TV0lUQ0gQuwESEwoOS0VZQ09ERV9BU1NJU1QQ2wESGQoU'
    'S0VZQ09ERV9WT0lDRV9BU1NJU1QQ5wESDQoJS0VZQ09ERV8wEAcSDQoJS0VZQ09ERV8xEAgSDQ'
    'oJS0VZQ09ERV8yEAkSDQoJS0VZQ09ERV8zEAoSDQoJS0VZQ09ERV80EAsSDQoJS0VZQ09ERV81'
    'EAwSDQoJS0VZQ09ERV82EA0SDQoJS0VZQ09ERV83EA4SDQoJS0VZQ09ERV84EA8SDQoJS0VZQ0'
    '9ERV85EBASEQoNS0VZQ09ERV9FTlRFUhBCEg8KC0tFWUNPREVfREVMEEMSEQoNS0VZQ09ERV9T'
    'UEFDRRA+EhMKD0tFWUNPREVfUEFHRV9VUBBcEhUKEUtFWUNPREVfUEFHRV9ET1dOEF0SFQoQS0'
    'VZQ09ERV9QUk9HX1JFRBC3ARIXChJLRVlDT0RFX1BST0dfR1JFRU4QuAESGAoTS0VZQ09ERV9Q'
    'Uk9HX1lFTExPVxC5ARIWChFLRVlDT0RFX1BST0dfQkxVRRC6AQ==');

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
    {'1': 'ime_counter', '3': 1, '4': 1, '5': 13, '10': 'imeCounter'},
    {'1': 'field_counter', '3': 2, '4': 1, '5': 13, '10': 'fieldCounter'},
    {
      '1': 'edit_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteImeEditInfo',
      '10': 'editInfo'
    },
  ],
};

/// Descriptor for `RemoteImeBatchEdit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteImeBatchEditDescriptor = $convert.base64Decode(
    'ChJSZW1vdGVJbWVCYXRjaEVkaXQSHwoLaW1lX2NvdW50ZXIYASABKA1SCmltZUNvdW50ZXISIw'
    'oNZmllbGRfY291bnRlchgCIAEoDVIMZmllbGRDb3VudGVyEjYKCWVkaXRfaW5mbxgDIAEoCzIZ'
    'LnJlbW90ZS5SZW1vdGVJbWVFZGl0SW5mb1IIZWRpdEluZm8=');

@$core.Deprecated('Use remoteImeEditInfoDescriptor instead')
const RemoteImeEditInfo$json = {
  '1': 'RemoteImeEditInfo',
  '2': [
    {'1': 'insert', '3': 1, '4': 1, '5': 13, '10': 'insert'},
    {
      '1': 'text_field_status',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteTextFieldStatus',
      '10': 'textFieldStatus'
    },
  ],
};

/// Descriptor for `RemoteImeEditInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteImeEditInfoDescriptor = $convert.base64Decode(
    'ChFSZW1vdGVJbWVFZGl0SW5mbxIWCgZpbnNlcnQYASABKA1SBmluc2VydBJJChF0ZXh0X2ZpZW'
    'xkX3N0YXR1cxgCIAEoCzIdLnJlbW90ZS5SZW1vdGVUZXh0RmllbGRTdGF0dXNSD3RleHRGaWVs'
    'ZFN0YXR1cw==');

@$core.Deprecated('Use remoteTextFieldStatusDescriptor instead')
const RemoteTextFieldStatus$json = {
  '1': 'RemoteTextFieldStatus',
  '2': [
    {'1': 'start', '3': 1, '4': 1, '5': 13, '10': 'start'},
    {'1': 'end', '3': 2, '4': 1, '5': 13, '10': 'end'},
    {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `RemoteTextFieldStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteTextFieldStatusDescriptor = $convert.base64Decode(
    'ChVSZW1vdGVUZXh0RmllbGRTdGF0dXMSFAoFc3RhcnQYASABKA1SBXN0YXJ0EhAKA2VuZBgCIA'
    'EoDVIDZW5kEhQKBXZhbHVlGAMgASgJUgV2YWx1ZQ==');

@$core.Deprecated('Use remoteStartAppDescriptor instead')
const RemoteStartApp$json = {
  '1': 'RemoteStartApp',
  '2': [
    {'1': 'intent_uri', '3': 1, '4': 1, '5': 9, '10': 'intentUri'},
  ],
};

/// Descriptor for `RemoteStartApp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteStartAppDescriptor = $convert.base64Decode(
    'Cg5SZW1vdGVTdGFydEFwcBIdCgppbnRlbnRfdXJpGAEgASgJUglpbnRlbnRVcmk=');

@$core.Deprecated('Use remoteAppInfoDescriptor instead')
const RemoteAppInfo$json = {
  '1': 'RemoteAppInfo',
  '2': [
    {'1': 'app_name', '3': 1, '4': 1, '5': 9, '10': 'appName'},
    {'1': 'app_package', '3': 2, '4': 1, '5': 9, '10': 'appPackage'},
  ],
};

/// Descriptor for `RemoteAppInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteAppInfoDescriptor = $convert.base64Decode(
    'Cg1SZW1vdGVBcHBJbmZvEhkKCGFwcF9uYW1lGAEgASgJUgdhcHBOYW1lEh8KC2FwcF9wYWNrYW'
    'dlGAIgASgJUgphcHBQYWNrYWdl');

@$core.Deprecated('Use remotePingRequestDescriptor instead')
const RemotePingRequest$json = {
  '1': 'RemotePingRequest',
  '2': [
    {'1': 'val1', '3': 1, '4': 1, '5': 5, '10': 'val1'},
    {'1': 'val2', '3': 2, '4': 1, '5': 3, '10': 'val2'},
  ],
};

/// Descriptor for `RemotePingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remotePingRequestDescriptor = $convert.base64Decode(
    'ChFSZW1vdGVQaW5nUmVxdWVzdBISCgR2YWwxGAEgASgFUgR2YWwxEhIKBHZhbDIYAiABKANSBH'
    'ZhbDI=');

@$core.Deprecated('Use remotePingResponseDescriptor instead')
const RemotePingResponse$json = {
  '1': 'RemotePingResponse',
  '2': [
    {'1': 'val1', '3': 1, '4': 1, '5': 5, '10': 'val1'},
    {'1': 'val2', '3': 2, '4': 1, '5': 3, '10': 'val2'},
  ],
};

/// Descriptor for `RemotePingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remotePingResponseDescriptor = $convert.base64Decode(
    'ChJSZW1vdGVQaW5nUmVzcG9uc2USEgoEdmFsMRgBIAEoBVIEdmFsMRISCgR2YWwyGAIgASgDUg'
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
    {'1': 'volume_level', '3': 1, '4': 1, '5': 13, '10': 'volumeLevel'},
    {'1': 'volume_max', '3': 2, '4': 1, '5': 13, '10': 'volumeMax'},
    {'1': 'is_muted', '3': 3, '4': 1, '5': 8, '10': 'isMuted'},
    {'1': 'device_name', '3': 4, '4': 1, '5': 9, '10': 'deviceName'},
    {'1': 'unknown', '3': 5, '4': 1, '5': 13, '10': 'unknown'},
  ],
};

/// Descriptor for `RemoteSetVolumeLevel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteSetVolumeLevelDescriptor = $convert.base64Decode(
    'ChRSZW1vdGVTZXRWb2x1bWVMZXZlbBIhCgx2b2x1bWVfbGV2ZWwYASABKA1SC3ZvbHVtZUxldm'
    'VsEh0KCnZvbHVtZV9tYXgYAiABKA1SCXZvbHVtZU1heBIZCghpc19tdXRlZBgDIAEoCFIHaXNN'
    'dXRlZBIfCgtkZXZpY2VfbmFtZRgEIAEoCVIKZGV2aWNlTmFtZRIYCgd1bmtub3duGAUgASgNUg'
    'd1bmtub3du');

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
