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
