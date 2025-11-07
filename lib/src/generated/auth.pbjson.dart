// This is a generated file - do not edit.
//
// Generated from auth.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use outerMessageDescriptor instead')
const OuterMessage$json = {
  '1': 'OuterMessage',
  '2': [
    {'1': 'protocol_version', '3': 1, '4': 1, '5': 13, '10': 'protocolVersion'},
    {'1': 'status', '3': 2, '4': 1, '5': 13, '10': 'status'},
    {
      '1': 'pairing_request',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingRequest',
      '9': 0,
      '10': 'pairingRequest'
    },
    {
      '1': 'pairing_response',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingResponse',
      '9': 0,
      '10': 'pairingResponse'
    },
    {
      '1': 'pairing_secret',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingSecret',
      '9': 0,
      '10': 'pairingSecret'
    },
    {
      '1': 'pairing_request_ack',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingRequestAck',
      '9': 0,
      '10': 'pairingRequestAck'
    },
    {
      '1': 'pairing_option',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.pairing.Options',
      '9': 0,
      '10': 'pairingOption'
    },
    {
      '1': 'pairing_option_ack',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.pairing.OptionsAck',
      '9': 0,
      '10': 'pairingOptionAck'
    },
    {
      '1': 'pairing_configuration',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.pairing.Configuration',
      '9': 0,
      '10': 'pairingConfiguration'
    },
    {
      '1': 'pairing_configuration_ack',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.pairing.ConfigurationAck',
      '9': 0,
      '10': 'pairingConfigurationAck'
    },
  ],
  '8': [
    {'1': 'message'},
  ],
};

/// Descriptor for `OuterMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outerMessageDescriptor = $convert.base64Decode(
    'CgxPdXRlck1lc3NhZ2USKQoQcHJvdG9jb2xfdmVyc2lvbhgBIAEoDVIPcHJvdG9jb2xWZXJzaW'
    '9uEhYKBnN0YXR1cxgCIAEoDVIGc3RhdHVzEkIKD3BhaXJpbmdfcmVxdWVzdBgKIAEoCzIXLnBh'
    'aXJpbmcuUGFpcmluZ1JlcXVlc3RIAFIOcGFpcmluZ1JlcXVlc3QSRQoQcGFpcmluZ19yZXNwb2'
    '5zZRgLIAEoCzIYLnBhaXJpbmcuUGFpcmluZ1Jlc3BvbnNlSABSD3BhaXJpbmdSZXNwb25zZRI/'
    'Cg5wYWlyaW5nX3NlY3JldBgMIAEoCzIWLnBhaXJpbmcuUGFpcmluZ1NlY3JldEgAUg1wYWlyaW'
    '5nU2VjcmV0EkwKE3BhaXJpbmdfcmVxdWVzdF9hY2sYDSABKAsyGi5wYWlyaW5nLlBhaXJpbmdS'
    'ZXF1ZXN0QWNrSABSEXBhaXJpbmdSZXF1ZXN0QWNrEjkKDnBhaXJpbmdfb3B0aW9uGA4gASgLMh'
    'AucGFpcmluZy5PcHRpb25zSABSDXBhaXJpbmdPcHRpb24SQwoScGFpcmluZ19vcHRpb25fYWNr'
    'GA8gASgLMhMucGFpcmluZy5PcHRpb25zQWNrSABSEHBhaXJpbmdPcHRpb25BY2sSTQoVcGFpcm'
    'luZ19jb25maWd1cmF0aW9uGBAgASgLMhYucGFpcmluZy5Db25maWd1cmF0aW9uSABSFHBhaXJp'
    'bmdDb25maWd1cmF0aW9uElcKGXBhaXJpbmdfY29uZmlndXJhdGlvbl9hY2sYESABKAsyGS5wYW'
    'lyaW5nLkNvbmZpZ3VyYXRpb25BY2tIAFIXcGFpcmluZ0NvbmZpZ3VyYXRpb25BY2tCCQoHbWVz'
    'c2FnZQ==');

@$core.Deprecated('Use pairingRequestDescriptor instead')
const PairingRequest$json = {
  '1': 'PairingRequest',
  '2': [
    {'1': 'client_name', '3': 1, '4': 1, '5': 9, '10': 'clientName'},
    {'1': 'service_name', '3': 2, '4': 1, '5': 9, '10': 'serviceName'},
    {'1': 'client_id', '3': 3, '4': 1, '5': 9, '10': 'clientId'},
    {'1': 'service_uuid', '3': 4, '4': 1, '5': 9, '10': 'serviceUuid'},
  ],
};

/// Descriptor for `PairingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingRequestDescriptor = $convert.base64Decode(
    'Cg5QYWlyaW5nUmVxdWVzdBIfCgtjbGllbnRfbmFtZRgBIAEoCVIKY2xpZW50TmFtZRIhCgxzZX'
    'J2aWNlX25hbWUYAiABKAlSC3NlcnZpY2VOYW1lEhsKCWNsaWVudF9pZBgDIAEoCVIIY2xpZW50'
    'SWQSIQoMc2VydmljZV91dWlkGAQgASgJUgtzZXJ2aWNlVXVpZA==');

@$core.Deprecated('Use pairingRequestAckDescriptor instead')
const PairingRequestAck$json = {
  '1': 'PairingRequestAck',
};

/// Descriptor for `PairingRequestAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingRequestAckDescriptor =
    $convert.base64Decode('ChFQYWlyaW5nUmVxdWVzdEFjaw==');

@$core.Deprecated('Use pairingResponseDescriptor instead')
const PairingResponse$json = {
  '1': 'PairingResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'server_public_key', '3': 2, '4': 1, '5': 9, '10': 'serverPublicKey'},
  ],
};

/// Descriptor for `PairingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingResponseDescriptor = $convert.base64Decode(
    'Cg9QYWlyaW5nUmVzcG9uc2USFgoGc3RhdHVzGAEgASgFUgZzdGF0dXMSKgoRc2VydmVyX3B1Ym'
    'xpY19rZXkYAiABKAlSD3NlcnZlclB1YmxpY0tleQ==');

@$core.Deprecated('Use pairingSecretDescriptor instead')
const PairingSecret$json = {
  '1': 'PairingSecret',
  '2': [
    {'1': 'encrypted_secret', '3': 1, '4': 1, '5': 12, '10': 'encryptedSecret'},
  ],
};

/// Descriptor for `PairingSecret`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingSecretDescriptor = $convert.base64Decode(
    'Cg1QYWlyaW5nU2VjcmV0EikKEGVuY3J5cHRlZF9zZWNyZXQYASABKAxSD2VuY3J5cHRlZFNlY3'
    'JldA==');

@$core.Deprecated('Use pairingSecretAckDescriptor instead')
const PairingSecretAck$json = {
  '1': 'PairingSecretAck',
};

/// Descriptor for `PairingSecretAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingSecretAckDescriptor =
    $convert.base64Decode('ChBQYWlyaW5nU2VjcmV0QWNr');

@$core.Deprecated('Use encodingDescriptor instead')
const Encoding$json = {
  '1': 'Encoding',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.pairing.Encoding.EncodingType',
      '10': 'type'
    },
    {'1': 'symbol_length', '3': 2, '4': 1, '5': 13, '10': 'symbolLength'},
  ],
  '4': [Encoding_EncodingType$json],
};

@$core.Deprecated('Use encodingDescriptor instead')
const Encoding_EncodingType$json = {
  '1': 'EncodingType',
  '2': [
    {'1': 'ENCODING_TYPE_UNKNOWN', '2': 0},
    {'1': 'ENCODING_TYPE_ALPHANUMERIC', '2': 1},
    {'1': 'ENCODING_TYPE_NUMERIC', '2': 2},
    {'1': 'ENCODING_TYPE_HEXADECIMAL', '2': 3},
    {'1': 'ENCODING_TYPE_QRCODE', '2': 4},
  ],
};

/// Descriptor for `Encoding`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List encodingDescriptor = $convert.base64Decode(
    'CghFbmNvZGluZxIyCgR0eXBlGAEgASgOMh4ucGFpcmluZy5FbmNvZGluZy5FbmNvZGluZ1R5cG'
    'VSBHR5cGUSIwoNc3ltYm9sX2xlbmd0aBgCIAEoDVIMc3ltYm9sTGVuZ3RoIp0BCgxFbmNvZGlu'
    'Z1R5cGUSGQoVRU5DT0RJTkdfVFlQRV9VTktOT1dOEAASHgoaRU5DT0RJTkdfVFlQRV9BTFBIQU'
    '5VTUVSSUMQARIZChVFTkNPRElOR19UWVBFX05VTUVSSUMQAhIdChlFTkNPRElOR19UWVBFX0hF'
    'WEFERUNJTUFMEAMSGAoURU5DT0RJTkdfVFlQRV9RUkNPREUQBA==');

@$core.Deprecated('Use optionsDescriptor instead')
const Options$json = {
  '1': 'Options',
  '2': [
    {
      '1': 'input_encodings',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pairing.Encoding',
      '10': 'inputEncodings'
    },
    {
      '1': 'output_encodings',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.pairing.Encoding',
      '10': 'outputEncodings'
    },
    {
      '1': 'preferred_role',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.pairing.Options.RoleType',
      '10': 'preferredRole'
    },
  ],
  '4': [Options_RoleType$json],
};

@$core.Deprecated('Use optionsDescriptor instead')
const Options_RoleType$json = {
  '1': 'RoleType',
  '2': [
    {'1': 'ROLE_TYPE_UNKNOWN', '2': 0},
    {'1': 'ROLE_TYPE_INPUT', '2': 1},
    {'1': 'ROLE_TYPE_OUTPUT', '2': 2},
  ],
};

/// Descriptor for `Options`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List optionsDescriptor = $convert.base64Decode(
    'CgdPcHRpb25zEjoKD2lucHV0X2VuY29kaW5ncxgBIAMoCzIRLnBhaXJpbmcuRW5jb2RpbmdSDm'
    'lucHV0RW5jb2RpbmdzEjwKEG91dHB1dF9lbmNvZGluZ3MYAiADKAsyES5wYWlyaW5nLkVuY29k'
    'aW5nUg9vdXRwdXRFbmNvZGluZ3MSQAoOcHJlZmVycmVkX3JvbGUYAyABKA4yGS5wYWlyaW5nLk'
    '9wdGlvbnMuUm9sZVR5cGVSDXByZWZlcnJlZFJvbGUiTAoIUm9sZVR5cGUSFQoRUk9MRV9UWVBF'
    'X1VOS05PV04QABITCg9ST0xFX1RZUEVfSU5QVVQQARIUChBST0xFX1RZUEVfT1VUUFVUEAI=');

@$core.Deprecated('Use optionsAckDescriptor instead')
const OptionsAck$json = {
  '1': 'OptionsAck',
};

/// Descriptor for `OptionsAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List optionsAckDescriptor =
    $convert.base64Decode('CgpPcHRpb25zQWNr');

@$core.Deprecated('Use configurationDescriptor instead')
const Configuration$json = {
  '1': 'Configuration',
  '2': [
    {
      '1': 'encoding',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pairing.Encoding',
      '10': 'encoding'
    },
    {
      '1': 'client_role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.pairing.Options.RoleType',
      '10': 'clientRole'
    },
  ],
};

/// Descriptor for `Configuration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationDescriptor = $convert.base64Decode(
    'Cg1Db25maWd1cmF0aW9uEi0KCGVuY29kaW5nGAEgASgLMhEucGFpcmluZy5FbmNvZGluZ1IIZW'
    '5jb2RpbmcSOgoLY2xpZW50X3JvbGUYAiABKA4yGS5wYWlyaW5nLk9wdGlvbnMuUm9sZVR5cGVS'
    'CmNsaWVudFJvbGU=');

@$core.Deprecated('Use configurationAckDescriptor instead')
const ConfigurationAck$json = {
  '1': 'ConfigurationAck',
};

/// Descriptor for `ConfigurationAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationAckDescriptor =
    $convert.base64Decode('ChBDb25maWd1cmF0aW9uQWNr');
