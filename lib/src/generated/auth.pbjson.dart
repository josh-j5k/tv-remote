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

@$core.Deprecated('Use authRequestDescriptor instead')
const AuthRequest$json = {
  '1': 'AuthRequest',
  '2': [
    {
      '1': 'encrypted_session_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'encryptedSessionKey'
    },
    {'1': 'client_nonce', '3': 2, '4': 1, '5': 12, '10': 'clientNonce'},
    {'1': 'client_id', '3': 3, '4': 1, '5': 9, '10': 'clientId'},
    {'1': 'ts', '3': 4, '4': 1, '5': 3, '10': 'ts'},
  ],
};

/// Descriptor for `AuthRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authRequestDescriptor = $convert.base64Decode(
    'CgtBdXRoUmVxdWVzdBIyChVlbmNyeXB0ZWRfc2Vzc2lvbl9rZXkYASABKAxSE2VuY3J5cHRlZF'
    'Nlc3Npb25LZXkSIQoMY2xpZW50X25vbmNlGAIgASgMUgtjbGllbnROb25jZRIbCgljbGllbnRf'
    'aWQYAyABKAlSCGNsaWVudElkEg4KAnRzGAQgASgDUgJ0cw==');

@$core.Deprecated('Use authResponseDescriptor instead')
const AuthResponse$json = {
  '1': 'AuthResponse',
  '2': [
    {'1': 'aes_ciphertext', '3': 1, '4': 1, '5': 12, '10': 'aesCiphertext'},
    {'1': 'aes_tag', '3': 2, '4': 1, '5': 12, '10': 'aesTag'},
    {'1': 'ts', '3': 3, '4': 1, '5': 3, '10': 'ts'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode(
    'CgxBdXRoUmVzcG9uc2USJQoOYWVzX2NpcGhlcnRleHQYASABKAxSDWFlc0NpcGhlcnRleHQSFw'
    'oHYWVzX3RhZxgCIAEoDFIGYWVzVGFnEg4KAnRzGAMgASgDUgJ0cw==');

@$core.Deprecated('Use remoteMessageDescriptor instead')
const RemoteMessage$json = {
  '1': 'RemoteMessage',
  '2': [
    {
      '1': 'pairing_request',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.remote.PairingRequest',
      '9': 0,
      '10': 'pairingRequest'
    },
    {
      '1': 'pairing_response',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.remote.PairingResponse',
      '9': 0,
      '10': 'pairingResponse'
    },
    {
      '1': 'pairing_secret',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.remote.PairingSecret',
      '9': 0,
      '10': 'pairingSecret'
    },
    {
      '1': 'remote_command',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteCommand',
      '9': 0,
      '10': 'remoteCommand'
    },
    {
      '1': 'remote_set_active',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteSetActive',
      '9': 0,
      '10': 'remoteSetActive'
    },
    {
      '1': 'remote_ping_request',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.remote.RemotePingRequest',
      '9': 0,
      '10': 'remotePingRequest'
    },
    {
      '1': 'remote_ping_response',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.remote.RemotePingResponse',
      '9': 0,
      '10': 'remotePingResponse'
    },
    {
      '1': 'remote_error',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.remote.RemoteError',
      '9': 0,
      '10': 'remoteError'
    },
  ],
  '8': [
    {'1': 'message_type'},
  ],
};

/// Descriptor for `RemoteMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteMessageDescriptor = $convert.base64Decode(
    'Cg1SZW1vdGVNZXNzYWdlEkEKD3BhaXJpbmdfcmVxdWVzdBgCIAEoCzIWLnJlbW90ZS5QYWlyaW'
    '5nUmVxdWVzdEgAUg5wYWlyaW5nUmVxdWVzdBJEChBwYWlyaW5nX3Jlc3BvbnNlGAMgASgLMhcu'
    'cmVtb3RlLlBhaXJpbmdSZXNwb25zZUgAUg9wYWlyaW5nUmVzcG9uc2USPgoOcGFpcmluZ19zZW'
    'NyZXQYBCABKAsyFS5yZW1vdGUuUGFpcmluZ1NlY3JldEgAUg1wYWlyaW5nU2VjcmV0Ej4KDnJl'
    'bW90ZV9jb21tYW5kGAUgASgLMhUucmVtb3RlLlJlbW90ZUNvbW1hbmRIAFINcmVtb3RlQ29tbW'
    'FuZBJFChFyZW1vdGVfc2V0X2FjdGl2ZRgIIAEoCzIXLnJlbW90ZS5SZW1vdGVTZXRBY3RpdmVI'
    'AFIPcmVtb3RlU2V0QWN0aXZlEksKE3JlbW90ZV9waW5nX3JlcXVlc3QYCSABKAsyGS5yZW1vdG'
    'UuUmVtb3RlUGluZ1JlcXVlc3RIAFIRcmVtb3RlUGluZ1JlcXVlc3QSTgoUcmVtb3RlX3Bpbmdf'
    'cmVzcG9uc2UYCiABKAsyGi5yZW1vdGUuUmVtb3RlUGluZ1Jlc3BvbnNlSABSEnJlbW90ZVBpbm'
    'dSZXNwb25zZRI4CgxyZW1vdGVfZXJyb3IYCyABKAsyEy5yZW1vdGUuUmVtb3RlRXJyb3JIAFIL'
    'cmVtb3RlRXJyb3JCDgoMbWVzc2FnZV90eXBl');

@$core.Deprecated('Use pairingRequestDescriptor instead')
const PairingRequest$json = {
  '1': 'PairingRequest',
  '2': [
    {'1': 'client_id', '3': 1, '4': 1, '5': 9, '10': 'clientId'},
    {'1': 'client_name', '3': 2, '4': 1, '5': 9, '10': 'clientName'},
  ],
};

/// Descriptor for `PairingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingRequestDescriptor = $convert.base64Decode(
    'Cg5QYWlyaW5nUmVxdWVzdBIbCgljbGllbnRfaWQYASABKAlSCGNsaWVudElkEh8KC2NsaWVudF'
    '9uYW1lGAIgASgJUgpjbGllbnROYW1l');

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

@$core.Deprecated('Use remoteCommandDescriptor instead')
const RemoteCommand$json = {
  '1': 'RemoteCommand',
  '2': [
    {'1': 'key_code', '3': 1, '4': 1, '5': 5, '10': 'keyCode'},
    {'1': 'direction', '3': 2, '4': 1, '5': 5, '10': 'direction'},
  ],
};

/// Descriptor for `RemoteCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteCommandDescriptor = $convert.base64Decode(
    'Cg1SZW1vdGVDb21tYW5kEhkKCGtleV9jb2RlGAEgASgFUgdrZXlDb2RlEhwKCWRpcmVjdGlvbh'
    'gCIAEoBVIJZGlyZWN0aW9u');

@$core.Deprecated('Use remoteSetActiveDescriptor instead')
const RemoteSetActive$json = {
  '1': 'RemoteSetActive',
  '2': [
    {'1': 'active', '3': 1, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `RemoteSetActive`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteSetActiveDescriptor = $convert
    .base64Decode('Cg9SZW1vdGVTZXRBY3RpdmUSFgoGYWN0aXZlGAEgASgIUgZhY3RpdmU=');

@$core.Deprecated('Use remotePingRequestDescriptor instead')
const RemotePingRequest$json = {
  '1': 'RemotePingRequest',
};

/// Descriptor for `RemotePingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remotePingRequestDescriptor =
    $convert.base64Decode('ChFSZW1vdGVQaW5nUmVxdWVzdA==');

@$core.Deprecated('Use remotePingResponseDescriptor instead')
const RemotePingResponse$json = {
  '1': 'RemotePingResponse',
};

/// Descriptor for `RemotePingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remotePingResponseDescriptor =
    $convert.base64Decode('ChJSZW1vdGVQaW5nUmVzcG9uc2U=');

@$core.Deprecated('Use remoteErrorDescriptor instead')
const RemoteError$json = {
  '1': 'RemoteError',
  '2': [
    {'1': 'error_code', '3': 1, '4': 1, '5': 5, '10': 'errorCode'},
  ],
};

/// Descriptor for `RemoteError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteErrorDescriptor = $convert.base64Decode(
    'CgtSZW1vdGVFcnJvchIdCgplcnJvcl9jb2RlGAEgASgFUgllcnJvckNvZGU=');
