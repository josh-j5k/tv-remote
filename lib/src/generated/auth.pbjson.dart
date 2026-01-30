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

@$core.Deprecated('Use keyExchangeDescriptor instead')
const KeyExchange$json = {
  '1': 'KeyExchange',
  '2': [
    {'1': 'KEY_EXCHANGE_UNKNOWN', '2': 0},
    {'1': 'ECDH_P256', '2': 1},
    {'1': 'X25519', '2': 2},
  ],
};

/// Descriptor for `KeyExchange`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List keyExchangeDescriptor = $convert.base64Decode(
    'CgtLZXlFeGNoYW5nZRIYChRLRVlfRVhDSEFOR0VfVU5LTk9XThAAEg0KCUVDREhfUDI1NhABEg'
    'oKBlgyNTUxORAC');

@$core.Deprecated('Use secretExchangeDescriptor instead')
const SecretExchange$json = {
  '1': 'SecretExchange',
  '2': [
    {'1': 'SECRET_EXCHANGE_UNKNOWN', '2': 0},
    {'1': 'HMAC_SHA256', '2': 1},
  ],
};

/// Descriptor for `SecretExchange`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List secretExchangeDescriptor = $convert.base64Decode(
    'Cg5TZWNyZXRFeGNoYW5nZRIbChdTRUNSRVRfRVhDSEFOR0VfVU5LTk9XThAAEg8KC0hNQUNfU0'
    'hBMjU2EAE=');

@$core.Deprecated('Use roleTypeDescriptor instead')
const RoleType$json = {
  '1': 'RoleType',
  '2': [
    {'1': 'ROLE_TYPE_UNKNOWN', '2': 0},
    {'1': 'ROLE_TYPE_INPUT', '2': 1},
    {'1': 'ROLE_TYPE_OUTPUT', '2': 2},
  ],
};

/// Descriptor for `RoleType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roleTypeDescriptor = $convert.base64Decode(
    'CghSb2xlVHlwZRIVChFST0xFX1RZUEVfVU5LTk9XThAAEhMKD1JPTEVfVFlQRV9JTlBVVBABEh'
    'QKEFJPTEVfVFlQRV9PVVRQVVQQAg==');

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
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingOptions',
      '9': 0,
      '10': 'pairingOption'
    },
    {
      '1': 'pairing_option_ack',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingOptionsAck',
      '9': 0,
      '10': 'pairingOptionAck'
    },
    {
      '1': 'pairing_configuration',
      '3': 30,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingConfiguration',
      '9': 0,
      '10': 'pairingConfiguration'
    },
    {
      '1': 'pairing_configuration_ack',
      '3': 31,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingConfigurationAck',
      '9': 0,
      '10': 'pairingConfigurationAck'
    },
    {
      '1': 'pairing_secret',
      '3': 40,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingSecret',
      '9': 0,
      '10': 'pairingSecret'
    },
    {
      '1': 'pairing_secret_ack',
      '3': 41,
      '4': 1,
      '5': 11,
      '6': '.pairing.PairingSecretAck',
      '9': 0,
      '10': 'pairingSecretAck'
    },
    {
      '1': 'error',
      '3': 200,
      '4': 1,
      '5': 11,
      '6': '.pairing.ErrorMessage',
      '9': 0,
      '10': 'error'
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
    '5zZRgLIAEoCzIYLnBhaXJpbmcuUGFpcmluZ1Jlc3BvbnNlSABSD3BhaXJpbmdSZXNwb25zZRJM'
    'ChNwYWlyaW5nX3JlcXVlc3RfYWNrGA0gASgLMhoucGFpcmluZy5QYWlyaW5nUmVxdWVzdEFja0'
    'gAUhFwYWlyaW5nUmVxdWVzdEFjaxJACg5wYWlyaW5nX29wdGlvbhgUIAEoCzIXLnBhaXJpbmcu'
    'UGFpcmluZ09wdGlvbnNIAFINcGFpcmluZ09wdGlvbhJKChJwYWlyaW5nX29wdGlvbl9hY2sYFS'
    'ABKAsyGi5wYWlyaW5nLlBhaXJpbmdPcHRpb25zQWNrSABSEHBhaXJpbmdPcHRpb25BY2sSVAoV'
    'cGFpcmluZ19jb25maWd1cmF0aW9uGB4gASgLMh0ucGFpcmluZy5QYWlyaW5nQ29uZmlndXJhdG'
    'lvbkgAUhRwYWlyaW5nQ29uZmlndXJhdGlvbhJeChlwYWlyaW5nX2NvbmZpZ3VyYXRpb25fYWNr'
    'GB8gASgLMiAucGFpcmluZy5QYWlyaW5nQ29uZmlndXJhdGlvbkFja0gAUhdwYWlyaW5nQ29uZm'
    'lndXJhdGlvbkFjaxI/Cg5wYWlyaW5nX3NlY3JldBgoIAEoCzIWLnBhaXJpbmcuUGFpcmluZ1Nl'
    'Y3JldEgAUg1wYWlyaW5nU2VjcmV0EkkKEnBhaXJpbmdfc2VjcmV0X2FjaxgpIAEoCzIZLnBhaX'
    'JpbmcuUGFpcmluZ1NlY3JldEFja0gAUhBwYWlyaW5nU2VjcmV0QWNrEi4KBWVycm9yGMgBIAEo'
    'CzIVLnBhaXJpbmcuRXJyb3JNZXNzYWdlSABSBWVycm9yQgkKB21lc3NhZ2U=');

@$core.Deprecated('Use pairingRequestDescriptor instead')
const PairingRequest$json = {
  '1': 'PairingRequest',
  '2': [
    {'1': 'service_name', '3': 1, '4': 1, '5': 9, '10': 'serviceName'},
    {'1': 'client_name', '3': 2, '4': 1, '5': 9, '10': 'clientName'},
    {'1': 'client_id', '3': 3, '4': 1, '5': 9, '10': 'clientId'},
    {'1': 'service_uuid', '3': 4, '4': 1, '5': 9, '10': 'serviceUuid'},
  ],
};

/// Descriptor for `PairingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingRequestDescriptor = $convert.base64Decode(
    'Cg5QYWlyaW5nUmVxdWVzdBIhCgxzZXJ2aWNlX25hbWUYASABKAlSC3NlcnZpY2VOYW1lEh8KC2'
    'NsaWVudF9uYW1lGAIgASgJUgpjbGllbnROYW1lEhsKCWNsaWVudF9pZBgDIAEoCVIIY2xpZW50'
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
    {
      '1': 'server_certificate',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'serverCertificate'
    },
  ],
};

/// Descriptor for `PairingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingResponseDescriptor = $convert.base64Decode(
    'Cg9QYWlyaW5nUmVzcG9uc2USFgoGc3RhdHVzGAEgASgFUgZzdGF0dXMSLQoSc2VydmVyX2Nlcn'
    'RpZmljYXRlGAIgASgMUhFzZXJ2ZXJDZXJ0aWZpY2F0ZQ==');

@$core.Deprecated('Use pairingSecretDescriptor instead')
const PairingSecret$json = {
  '1': 'PairingSecret',
  '2': [
    {'1': 'secret', '3': 1, '4': 1, '5': 12, '10': 'secret'},
  ],
};

/// Descriptor for `PairingSecret`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingSecretDescriptor = $convert
    .base64Decode('Cg1QYWlyaW5nU2VjcmV0EhYKBnNlY3JldBgBIAEoDFIGc2VjcmV0');

@$core.Deprecated('Use secretResponseDescriptor instead')
const SecretResponse$json = {
  '1': 'SecretResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 13, '10': 'status'},
  ],
};

/// Descriptor for `SecretResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secretResponseDescriptor = $convert
    .base64Decode('Cg5TZWNyZXRSZXNwb25zZRIWCgZzdGF0dXMYASABKA1SBnN0YXR1cw==');

@$core.Deprecated('Use errorMessageDescriptor instead')
const ErrorMessage$json = {
  '1': 'ErrorMessage',
  '2': [
    {'1': 'error_code', '3': 1, '4': 1, '5': 13, '10': 'errorCode'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `ErrorMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorMessageDescriptor = $convert.base64Decode(
    'CgxFcnJvck1lc3NhZ2USHQoKZXJyb3JfY29kZRgBIAEoDVIJZXJyb3JDb2RlEiMKDWVycm9yX2'
    '1lc3NhZ2UYAiABKAlSDGVycm9yTWVzc2FnZQ==');

@$core.Deprecated('Use pairingConfigurationDescriptor instead')
const PairingConfiguration$json = {
  '1': 'PairingConfiguration',
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
      '6': '.pairing.RoleType',
      '10': 'clientRole'
    },
  ],
};

/// Descriptor for `PairingConfiguration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingConfigurationDescriptor = $convert.base64Decode(
    'ChRQYWlyaW5nQ29uZmlndXJhdGlvbhItCghlbmNvZGluZxgBIAEoCzIRLnBhaXJpbmcuRW5jb2'
    'RpbmdSCGVuY29kaW5nEjIKC2NsaWVudF9yb2xlGAIgASgOMhEucGFpcmluZy5Sb2xlVHlwZVIK'
    'Y2xpZW50Um9sZQ==');

@$core.Deprecated('Use pairingConfigurationAckDescriptor instead')
const PairingConfigurationAck$json = {
  '1': 'PairingConfigurationAck',
};

/// Descriptor for `PairingConfigurationAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingConfigurationAckDescriptor =
    $convert.base64Decode('ChdQYWlyaW5nQ29uZmlndXJhdGlvbkFjaw==');

@$core.Deprecated('Use pairingSecretAckDescriptor instead')
const PairingSecretAck$json = {
  '1': 'PairingSecretAck',
  '2': [
    {'1': 'secret', '3': 1, '4': 1, '5': 12, '10': 'secret'},
  ],
};

/// Descriptor for `PairingSecretAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingSecretAckDescriptor = $convert
    .base64Decode('ChBQYWlyaW5nU2VjcmV0QWNrEhYKBnNlY3JldBgBIAEoDFIGc2VjcmV0');

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

@$core.Deprecated('Use pairingOptionsDescriptor instead')
const PairingOptions$json = {
  '1': 'PairingOptions',
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
      '6': '.pairing.RoleType',
      '10': 'preferredRole'
    },
  ],
};

/// Descriptor for `PairingOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingOptionsDescriptor = $convert.base64Decode(
    'Cg5QYWlyaW5nT3B0aW9ucxI6Cg9pbnB1dF9lbmNvZGluZ3MYASADKAsyES5wYWlyaW5nLkVuY2'
    '9kaW5nUg5pbnB1dEVuY29kaW5ncxI8ChBvdXRwdXRfZW5jb2RpbmdzGAIgAygLMhEucGFpcmlu'
    'Zy5FbmNvZGluZ1IPb3V0cHV0RW5jb2RpbmdzEjgKDnByZWZlcnJlZF9yb2xlGAMgASgOMhEucG'
    'FpcmluZy5Sb2xlVHlwZVINcHJlZmVycmVkUm9sZQ==');

@$core.Deprecated('Use pairingOptionsAckDescriptor instead')
const PairingOptionsAck$json = {
  '1': 'PairingOptionsAck',
  '2': [
    {
      '1': 'selected_input_encoding',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pairing.Encoding',
      '10': 'selectedInputEncoding'
    },
    {
      '1': 'selected_output_encoding',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pairing.Encoding',
      '10': 'selectedOutputEncoding'
    },
    {
      '1': 'selected_role',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.pairing.RoleType',
      '10': 'selectedRole'
    },
  ],
};

/// Descriptor for `PairingOptionsAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingOptionsAckDescriptor = $convert.base64Decode(
    'ChFQYWlyaW5nT3B0aW9uc0FjaxJJChdzZWxlY3RlZF9pbnB1dF9lbmNvZGluZxgBIAEoCzIRLn'
    'BhaXJpbmcuRW5jb2RpbmdSFXNlbGVjdGVkSW5wdXRFbmNvZGluZxJLChhzZWxlY3RlZF9vdXRw'
    'dXRfZW5jb2RpbmcYAiABKAsyES5wYWlyaW5nLkVuY29kaW5nUhZzZWxlY3RlZE91dHB1dEVuY2'
    '9kaW5nEjYKDXNlbGVjdGVkX3JvbGUYAyABKA4yES5wYWlyaW5nLlJvbGVUeXBlUgxzZWxlY3Rl'
    'ZFJvbGU=');
