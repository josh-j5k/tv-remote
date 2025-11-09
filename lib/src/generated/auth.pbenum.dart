// This is a generated file - do not edit.
//
// Generated from auth.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class KeyExchange extends $pb.ProtobufEnum {
  static const KeyExchange KEY_EXCHANGE_UNKNOWN =
      KeyExchange._(0, _omitEnumNames ? '' : 'KEY_EXCHANGE_UNKNOWN');
  static const KeyExchange ECDH_P256 =
      KeyExchange._(1, _omitEnumNames ? '' : 'ECDH_P256');
  static const KeyExchange X25519 =
      KeyExchange._(2, _omitEnumNames ? '' : 'X25519');

  static const $core.List<KeyExchange> values = <KeyExchange>[
    KEY_EXCHANGE_UNKNOWN,
    ECDH_P256,
    X25519,
  ];

  static final $core.List<KeyExchange?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static KeyExchange? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const KeyExchange._(super.value, super.name);
}

class SecretExchange extends $pb.ProtobufEnum {
  static const SecretExchange SECRET_EXCHANGE_UNKNOWN =
      SecretExchange._(0, _omitEnumNames ? '' : 'SECRET_EXCHANGE_UNKNOWN');
  static const SecretExchange HMAC_SHA256 =
      SecretExchange._(1, _omitEnumNames ? '' : 'HMAC_SHA256');

  static const $core.List<SecretExchange> values = <SecretExchange>[
    SECRET_EXCHANGE_UNKNOWN,
    HMAC_SHA256,
  ];

  static final $core.List<SecretExchange?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static SecretExchange? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SecretExchange._(super.value, super.name);
}

class RoleType extends $pb.ProtobufEnum {
  static const RoleType ROLE_TYPE_UNKNOWN =
      RoleType._(0, _omitEnumNames ? '' : 'ROLE_TYPE_UNKNOWN');
  static const RoleType ROLE_TYPE_INPUT =
      RoleType._(1, _omitEnumNames ? '' : 'ROLE_TYPE_INPUT');
  static const RoleType ROLE_TYPE_OUTPUT =
      RoleType._(2, _omitEnumNames ? '' : 'ROLE_TYPE_OUTPUT');

  static const $core.List<RoleType> values = <RoleType>[
    ROLE_TYPE_UNKNOWN,
    ROLE_TYPE_INPUT,
    ROLE_TYPE_OUTPUT,
  ];

  static final $core.List<RoleType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static RoleType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RoleType._(super.value, super.name);
}

class Encoding_EncodingType extends $pb.ProtobufEnum {
  static const Encoding_EncodingType ENCODING_TYPE_UNKNOWN =
      Encoding_EncodingType._(0, _omitEnumNames ? '' : 'ENCODING_TYPE_UNKNOWN');
  static const Encoding_EncodingType ENCODING_TYPE_ALPHANUMERIC =
      Encoding_EncodingType._(
          1, _omitEnumNames ? '' : 'ENCODING_TYPE_ALPHANUMERIC');
  static const Encoding_EncodingType ENCODING_TYPE_NUMERIC =
      Encoding_EncodingType._(2, _omitEnumNames ? '' : 'ENCODING_TYPE_NUMERIC');
  static const Encoding_EncodingType ENCODING_TYPE_HEXADECIMAL =
      Encoding_EncodingType._(
          3, _omitEnumNames ? '' : 'ENCODING_TYPE_HEXADECIMAL');
  static const Encoding_EncodingType ENCODING_TYPE_QRCODE =
      Encoding_EncodingType._(4, _omitEnumNames ? '' : 'ENCODING_TYPE_QRCODE');

  static const $core.List<Encoding_EncodingType> values =
      <Encoding_EncodingType>[
    ENCODING_TYPE_UNKNOWN,
    ENCODING_TYPE_ALPHANUMERIC,
    ENCODING_TYPE_NUMERIC,
    ENCODING_TYPE_HEXADECIMAL,
    ENCODING_TYPE_QRCODE,
  ];

  static final $core.List<Encoding_EncodingType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static Encoding_EncodingType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Encoding_EncodingType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
