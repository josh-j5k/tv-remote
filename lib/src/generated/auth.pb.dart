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

import 'auth.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'auth.pbenum.dart';

enum OuterMessage_Message {
  pairingRequest,
  pairingResponse,
  pairingRequestAck,
  pairingOption,
  pairingOptionAck,
  pairingConfiguration,
  pairingConfigurationAck,
  pairingSecret,
  secretResponse,
  error,
  notSet
}

class OuterMessage extends $pb.GeneratedMessage {
  factory OuterMessage({
    $core.int? protocolVersion,
    $core.int? status,
    PairingRequest? pairingRequest,
    PairingResponse? pairingResponse,
    PairingRequestAck? pairingRequestAck,
    PairingOptions? pairingOption,
    PairingOptionsAck? pairingOptionAck,
    PairingConfiguration? pairingConfiguration,
    PairingConfigurationAck? pairingConfigurationAck,
    PairingSecret? pairingSecret,
    SecretResponse? secretResponse,
    ErrorMessage? error,
  }) {
    final result = create();
    if (protocolVersion != null) result.protocolVersion = protocolVersion;
    if (status != null) result.status = status;
    if (pairingRequest != null) result.pairingRequest = pairingRequest;
    if (pairingResponse != null) result.pairingResponse = pairingResponse;
    if (pairingRequestAck != null) result.pairingRequestAck = pairingRequestAck;
    if (pairingOption != null) result.pairingOption = pairingOption;
    if (pairingOptionAck != null) result.pairingOptionAck = pairingOptionAck;
    if (pairingConfiguration != null)
      result.pairingConfiguration = pairingConfiguration;
    if (pairingConfigurationAck != null)
      result.pairingConfigurationAck = pairingConfigurationAck;
    if (pairingSecret != null) result.pairingSecret = pairingSecret;
    if (secretResponse != null) result.secretResponse = secretResponse;
    if (error != null) result.error = error;
    return result;
  }

  OuterMessage._();

  factory OuterMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OuterMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, OuterMessage_Message>
      _OuterMessage_MessageByTag = {
    10: OuterMessage_Message.pairingRequest,
    11: OuterMessage_Message.pairingResponse,
    13: OuterMessage_Message.pairingRequestAck,
    20: OuterMessage_Message.pairingOption,
    21: OuterMessage_Message.pairingOptionAck,
    30: OuterMessage_Message.pairingConfiguration,
    31: OuterMessage_Message.pairingConfigurationAck,
    130: OuterMessage_Message.pairingSecret,
    131: OuterMessage_Message.secretResponse,
    200: OuterMessage_Message.error,
    0: OuterMessage_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OuterMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..oo(0, [10, 11, 13, 20, 21, 30, 31, 130, 131, 200])
    ..aI(1, _omitFieldNames ? '' : 'protocolVersion',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'status', fieldType: $pb.PbFieldType.OU3)
    ..aOM<PairingRequest>(10, _omitFieldNames ? '' : 'pairingRequest',
        subBuilder: PairingRequest.create)
    ..aOM<PairingResponse>(11, _omitFieldNames ? '' : 'pairingResponse',
        subBuilder: PairingResponse.create)
    ..aOM<PairingRequestAck>(13, _omitFieldNames ? '' : 'pairingRequestAck',
        subBuilder: PairingRequestAck.create)
    ..aOM<PairingOptions>(20, _omitFieldNames ? '' : 'pairingOption',
        subBuilder: PairingOptions.create)
    ..aOM<PairingOptionsAck>(21, _omitFieldNames ? '' : 'pairingOptionAck',
        subBuilder: PairingOptionsAck.create)
    ..aOM<PairingConfiguration>(
        30, _omitFieldNames ? '' : 'pairingConfiguration',
        subBuilder: PairingConfiguration.create)
    ..aOM<PairingConfigurationAck>(
        31, _omitFieldNames ? '' : 'pairingConfigurationAck',
        subBuilder: PairingConfigurationAck.create)
    ..aOM<PairingSecret>(130, _omitFieldNames ? '' : 'pairingSecret',
        subBuilder: PairingSecret.create)
    ..aOM<SecretResponse>(131, _omitFieldNames ? '' : 'secretResponse',
        subBuilder: SecretResponse.create)
    ..aOM<ErrorMessage>(200, _omitFieldNames ? '' : 'error',
        subBuilder: ErrorMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OuterMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OuterMessage copyWith(void Function(OuterMessage) updates) =>
      super.copyWith((message) => updates(message as OuterMessage))
          as OuterMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OuterMessage create() => OuterMessage._();
  @$core.override
  OuterMessage createEmptyInstance() => create();
  static $pb.PbList<OuterMessage> createRepeated() =>
      $pb.PbList<OuterMessage>();
  @$core.pragma('dart2js:noInline')
  static OuterMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OuterMessage>(create);
  static OuterMessage? _defaultInstance;

  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(13)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  @$pb.TagNumber(130)
  @$pb.TagNumber(131)
  @$pb.TagNumber(200)
  OuterMessage_Message whichMessage() =>
      _OuterMessage_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(13)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(30)
  @$pb.TagNumber(31)
  @$pb.TagNumber(130)
  @$pb.TagNumber(131)
  @$pb.TagNumber(200)
  void clearMessage() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get protocolVersion => $_getIZ(0);
  @$pb.TagNumber(1)
  set protocolVersion($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProtocolVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearProtocolVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(10)
  PairingRequest get pairingRequest => $_getN(2);
  @$pb.TagNumber(10)
  set pairingRequest(PairingRequest value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasPairingRequest() => $_has(2);
  @$pb.TagNumber(10)
  void clearPairingRequest() => $_clearField(10);
  @$pb.TagNumber(10)
  PairingRequest ensurePairingRequest() => $_ensure(2);

  @$pb.TagNumber(11)
  PairingResponse get pairingResponse => $_getN(3);
  @$pb.TagNumber(11)
  set pairingResponse(PairingResponse value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasPairingResponse() => $_has(3);
  @$pb.TagNumber(11)
  void clearPairingResponse() => $_clearField(11);
  @$pb.TagNumber(11)
  PairingResponse ensurePairingResponse() => $_ensure(3);

  @$pb.TagNumber(13)
  PairingRequestAck get pairingRequestAck => $_getN(4);
  @$pb.TagNumber(13)
  set pairingRequestAck(PairingRequestAck value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasPairingRequestAck() => $_has(4);
  @$pb.TagNumber(13)
  void clearPairingRequestAck() => $_clearField(13);
  @$pb.TagNumber(13)
  PairingRequestAck ensurePairingRequestAck() => $_ensure(4);

  @$pb.TagNumber(20)
  PairingOptions get pairingOption => $_getN(5);
  @$pb.TagNumber(20)
  set pairingOption(PairingOptions value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasPairingOption() => $_has(5);
  @$pb.TagNumber(20)
  void clearPairingOption() => $_clearField(20);
  @$pb.TagNumber(20)
  PairingOptions ensurePairingOption() => $_ensure(5);

  @$pb.TagNumber(21)
  PairingOptionsAck get pairingOptionAck => $_getN(6);
  @$pb.TagNumber(21)
  set pairingOptionAck(PairingOptionsAck value) => $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasPairingOptionAck() => $_has(6);
  @$pb.TagNumber(21)
  void clearPairingOptionAck() => $_clearField(21);
  @$pb.TagNumber(21)
  PairingOptionsAck ensurePairingOptionAck() => $_ensure(6);

  @$pb.TagNumber(30)
  PairingConfiguration get pairingConfiguration => $_getN(7);
  @$pb.TagNumber(30)
  set pairingConfiguration(PairingConfiguration value) => $_setField(30, value);
  @$pb.TagNumber(30)
  $core.bool hasPairingConfiguration() => $_has(7);
  @$pb.TagNumber(30)
  void clearPairingConfiguration() => $_clearField(30);
  @$pb.TagNumber(30)
  PairingConfiguration ensurePairingConfiguration() => $_ensure(7);

  @$pb.TagNumber(31)
  PairingConfigurationAck get pairingConfigurationAck => $_getN(8);
  @$pb.TagNumber(31)
  set pairingConfigurationAck(PairingConfigurationAck value) =>
      $_setField(31, value);
  @$pb.TagNumber(31)
  $core.bool hasPairingConfigurationAck() => $_has(8);
  @$pb.TagNumber(31)
  void clearPairingConfigurationAck() => $_clearField(31);
  @$pb.TagNumber(31)
  PairingConfigurationAck ensurePairingConfigurationAck() => $_ensure(8);

  @$pb.TagNumber(130)
  PairingSecret get pairingSecret => $_getN(9);
  @$pb.TagNumber(130)
  set pairingSecret(PairingSecret value) => $_setField(130, value);
  @$pb.TagNumber(130)
  $core.bool hasPairingSecret() => $_has(9);
  @$pb.TagNumber(130)
  void clearPairingSecret() => $_clearField(130);
  @$pb.TagNumber(130)
  PairingSecret ensurePairingSecret() => $_ensure(9);

  @$pb.TagNumber(131)
  SecretResponse get secretResponse => $_getN(10);
  @$pb.TagNumber(131)
  set secretResponse(SecretResponse value) => $_setField(131, value);
  @$pb.TagNumber(131)
  $core.bool hasSecretResponse() => $_has(10);
  @$pb.TagNumber(131)
  void clearSecretResponse() => $_clearField(131);
  @$pb.TagNumber(131)
  SecretResponse ensureSecretResponse() => $_ensure(10);

  @$pb.TagNumber(200)
  ErrorMessage get error => $_getN(11);
  @$pb.TagNumber(200)
  set error(ErrorMessage value) => $_setField(200, value);
  @$pb.TagNumber(200)
  $core.bool hasError() => $_has(11);
  @$pb.TagNumber(200)
  void clearError() => $_clearField(200);
  @$pb.TagNumber(200)
  ErrorMessage ensureError() => $_ensure(11);
}

class PairingRequest extends $pb.GeneratedMessage {
  factory PairingRequest({
    $core.String? serviceName,
    $core.String? clientName,
    $core.String? clientId,
    $core.String? serviceUuid,
  }) {
    final result = create();
    if (serviceName != null) result.serviceName = serviceName;
    if (clientName != null) result.clientName = clientName;
    if (clientId != null) result.clientId = clientId;
    if (serviceUuid != null) result.serviceUuid = serviceUuid;
    return result;
  }

  PairingRequest._();

  factory PairingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serviceName')
    ..aOS(2, _omitFieldNames ? '' : 'clientName')
    ..aOS(3, _omitFieldNames ? '' : 'clientId')
    ..aOS(4, _omitFieldNames ? '' : 'serviceUuid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingRequest copyWith(void Function(PairingRequest) updates) =>
      super.copyWith((message) => updates(message as PairingRequest))
          as PairingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingRequest create() => PairingRequest._();
  @$core.override
  PairingRequest createEmptyInstance() => create();
  static $pb.PbList<PairingRequest> createRepeated() =>
      $pb.PbList<PairingRequest>();
  @$core.pragma('dart2js:noInline')
  static PairingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingRequest>(create);
  static PairingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serviceName => $_getSZ(0);
  @$pb.TagNumber(1)
  set serviceName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServiceName() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientName => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClientName() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get clientId => $_getSZ(2);
  @$pb.TagNumber(3)
  set clientId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasClientId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get serviceUuid => $_getSZ(3);
  @$pb.TagNumber(4)
  set serviceUuid($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasServiceUuid() => $_has(3);
  @$pb.TagNumber(4)
  void clearServiceUuid() => $_clearField(4);
}

class PairingRequestAck extends $pb.GeneratedMessage {
  factory PairingRequestAck() => create();

  PairingRequestAck._();

  factory PairingRequestAck.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingRequestAck.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingRequestAck',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingRequestAck clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingRequestAck copyWith(void Function(PairingRequestAck) updates) =>
      super.copyWith((message) => updates(message as PairingRequestAck))
          as PairingRequestAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingRequestAck create() => PairingRequestAck._();
  @$core.override
  PairingRequestAck createEmptyInstance() => create();
  static $pb.PbList<PairingRequestAck> createRepeated() =>
      $pb.PbList<PairingRequestAck>();
  @$core.pragma('dart2js:noInline')
  static PairingRequestAck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingRequestAck>(create);
  static PairingRequestAck? _defaultInstance;
}

class PairingResponse extends $pb.GeneratedMessage {
  factory PairingResponse({
    $core.int? status,
    $core.List<$core.int>? serverCertificate,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (serverCertificate != null) result.serverCertificate = serverCertificate;
    return result;
  }

  PairingResponse._();

  factory PairingResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'status')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'serverCertificate', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingResponse copyWith(void Function(PairingResponse) updates) =>
      super.copyWith((message) => updates(message as PairingResponse))
          as PairingResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingResponse create() => PairingResponse._();
  @$core.override
  PairingResponse createEmptyInstance() => create();
  static $pb.PbList<PairingResponse> createRepeated() =>
      $pb.PbList<PairingResponse>();
  @$core.pragma('dart2js:noInline')
  static PairingResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingResponse>(create);
  static PairingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get serverCertificate => $_getN(1);
  @$pb.TagNumber(2)
  set serverCertificate($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasServerCertificate() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerCertificate() => $_clearField(2);
}

class PairingSecret extends $pb.GeneratedMessage {
  factory PairingSecret({
    $core.List<$core.int>? secret,
  }) {
    final result = create();
    if (secret != null) result.secret = secret;
    return result;
  }

  PairingSecret._();

  factory PairingSecret.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingSecret.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingSecret',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'secret', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingSecret clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingSecret copyWith(void Function(PairingSecret) updates) =>
      super.copyWith((message) => updates(message as PairingSecret))
          as PairingSecret;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingSecret create() => PairingSecret._();
  @$core.override
  PairingSecret createEmptyInstance() => create();
  static $pb.PbList<PairingSecret> createRepeated() =>
      $pb.PbList<PairingSecret>();
  @$core.pragma('dart2js:noInline')
  static PairingSecret getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingSecret>(create);
  static PairingSecret? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get secret => $_getN(0);
  @$pb.TagNumber(1)
  set secret($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSecret() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecret() => $_clearField(1);
}

class SecretResponse extends $pb.GeneratedMessage {
  factory SecretResponse({
    $core.int? status,
  }) {
    final result = create();
    if (status != null) result.status = status;
    return result;
  }

  SecretResponse._();

  factory SecretResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SecretResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SecretResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'status', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecretResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecretResponse copyWith(void Function(SecretResponse) updates) =>
      super.copyWith((message) => updates(message as SecretResponse))
          as SecretResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecretResponse create() => SecretResponse._();
  @$core.override
  SecretResponse createEmptyInstance() => create();
  static $pb.PbList<SecretResponse> createRepeated() =>
      $pb.PbList<SecretResponse>();
  @$core.pragma('dart2js:noInline')
  static SecretResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SecretResponse>(create);
  static SecretResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
}

class ErrorMessage extends $pb.GeneratedMessage {
  factory ErrorMessage({
    $core.int? errorCode,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (errorCode != null) result.errorCode = errorCode;
    if (errorMessage != null) result.errorMessage = errorMessage;
    return result;
  }

  ErrorMessage._();

  factory ErrorMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ErrorMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ErrorMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'errorCode', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ErrorMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ErrorMessage copyWith(void Function(ErrorMessage) updates) =>
      super.copyWith((message) => updates(message as ErrorMessage))
          as ErrorMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ErrorMessage create() => ErrorMessage._();
  @$core.override
  ErrorMessage createEmptyInstance() => create();
  static $pb.PbList<ErrorMessage> createRepeated() =>
      $pb.PbList<ErrorMessage>();
  @$core.pragma('dart2js:noInline')
  static ErrorMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ErrorMessage>(create);
  static ErrorMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get errorCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set errorCode($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasErrorCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => $_clearField(2);
}

class PairingConfiguration extends $pb.GeneratedMessage {
  factory PairingConfiguration({
    $core.Iterable<KeyExchange>? preferredKeyExchanges,
    $core.Iterable<SecretExchange>? preferredSecretExchanges,
    RoleType? clientRole,
  }) {
    final result = create();
    if (preferredKeyExchanges != null)
      result.preferredKeyExchanges.addAll(preferredKeyExchanges);
    if (preferredSecretExchanges != null)
      result.preferredSecretExchanges.addAll(preferredSecretExchanges);
    if (clientRole != null) result.clientRole = clientRole;
    return result;
  }

  PairingConfiguration._();

  factory PairingConfiguration.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingConfiguration.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingConfiguration',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..pc<KeyExchange>(
        1, _omitFieldNames ? '' : 'preferredKeyExchanges', $pb.PbFieldType.KE,
        valueOf: KeyExchange.valueOf,
        enumValues: KeyExchange.values,
        defaultEnumValue: KeyExchange.KEY_EXCHANGE_UNKNOWN)
    ..pc<SecretExchange>(2, _omitFieldNames ? '' : 'preferredSecretExchanges',
        $pb.PbFieldType.KE,
        valueOf: SecretExchange.valueOf,
        enumValues: SecretExchange.values,
        defaultEnumValue: SecretExchange.SECRET_EXCHANGE_UNKNOWN)
    ..aE<RoleType>(3, _omitFieldNames ? '' : 'clientRole',
        enumValues: RoleType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingConfiguration clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingConfiguration copyWith(void Function(PairingConfiguration) updates) =>
      super.copyWith((message) => updates(message as PairingConfiguration))
          as PairingConfiguration;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingConfiguration create() => PairingConfiguration._();
  @$core.override
  PairingConfiguration createEmptyInstance() => create();
  static $pb.PbList<PairingConfiguration> createRepeated() =>
      $pb.PbList<PairingConfiguration>();
  @$core.pragma('dart2js:noInline')
  static PairingConfiguration getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingConfiguration>(create);
  static PairingConfiguration? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<KeyExchange> get preferredKeyExchanges => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<SecretExchange> get preferredSecretExchanges => $_getList(1);

  @$pb.TagNumber(3)
  RoleType get clientRole => $_getN(2);
  @$pb.TagNumber(3)
  set clientRole(RoleType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasClientRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientRole() => $_clearField(3);
}

class PairingConfigurationAck extends $pb.GeneratedMessage {
  factory PairingConfigurationAck({
    KeyExchange? selectedKeyExchange,
    SecretExchange? selectedSecretExchange,
  }) {
    final result = create();
    if (selectedKeyExchange != null)
      result.selectedKeyExchange = selectedKeyExchange;
    if (selectedSecretExchange != null)
      result.selectedSecretExchange = selectedSecretExchange;
    return result;
  }

  PairingConfigurationAck._();

  factory PairingConfigurationAck.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingConfigurationAck.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingConfigurationAck',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..aE<KeyExchange>(1, _omitFieldNames ? '' : 'selectedKeyExchange',
        enumValues: KeyExchange.values)
    ..aE<SecretExchange>(2, _omitFieldNames ? '' : 'selectedSecretExchange',
        enumValues: SecretExchange.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingConfigurationAck clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingConfigurationAck copyWith(
          void Function(PairingConfigurationAck) updates) =>
      super.copyWith((message) => updates(message as PairingConfigurationAck))
          as PairingConfigurationAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingConfigurationAck create() => PairingConfigurationAck._();
  @$core.override
  PairingConfigurationAck createEmptyInstance() => create();
  static $pb.PbList<PairingConfigurationAck> createRepeated() =>
      $pb.PbList<PairingConfigurationAck>();
  @$core.pragma('dart2js:noInline')
  static PairingConfigurationAck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingConfigurationAck>(create);
  static PairingConfigurationAck? _defaultInstance;

  @$pb.TagNumber(1)
  KeyExchange get selectedKeyExchange => $_getN(0);
  @$pb.TagNumber(1)
  set selectedKeyExchange(KeyExchange value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSelectedKeyExchange() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelectedKeyExchange() => $_clearField(1);

  @$pb.TagNumber(2)
  SecretExchange get selectedSecretExchange => $_getN(1);
  @$pb.TagNumber(2)
  set selectedSecretExchange(SecretExchange value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSelectedSecretExchange() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelectedSecretExchange() => $_clearField(2);
}

class Encoding extends $pb.GeneratedMessage {
  factory Encoding({
    Encoding_EncodingType? type,
    $core.int? symbolLength,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (symbolLength != null) result.symbolLength = symbolLength;
    return result;
  }

  Encoding._();

  factory Encoding.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Encoding.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Encoding',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..aE<Encoding_EncodingType>(1, _omitFieldNames ? '' : 'type',
        enumValues: Encoding_EncodingType.values)
    ..aI(2, _omitFieldNames ? '' : 'symbolLength',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Encoding clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Encoding copyWith(void Function(Encoding) updates) =>
      super.copyWith((message) => updates(message as Encoding)) as Encoding;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Encoding create() => Encoding._();
  @$core.override
  Encoding createEmptyInstance() => create();
  static $pb.PbList<Encoding> createRepeated() => $pb.PbList<Encoding>();
  @$core.pragma('dart2js:noInline')
  static Encoding getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Encoding>(create);
  static Encoding? _defaultInstance;

  @$pb.TagNumber(1)
  Encoding_EncodingType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Encoding_EncodingType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get symbolLength => $_getIZ(1);
  @$pb.TagNumber(2)
  set symbolLength($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbolLength() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbolLength() => $_clearField(2);
}

class PairingOptions extends $pb.GeneratedMessage {
  factory PairingOptions({
    $core.Iterable<Encoding>? inputEncodings,
    $core.Iterable<Encoding>? outputEncodings,
    RoleType? preferredRole,
  }) {
    final result = create();
    if (inputEncodings != null) result.inputEncodings.addAll(inputEncodings);
    if (outputEncodings != null) result.outputEncodings.addAll(outputEncodings);
    if (preferredRole != null) result.preferredRole = preferredRole;
    return result;
  }

  PairingOptions._();

  factory PairingOptions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingOptions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingOptions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..pPM<Encoding>(1, _omitFieldNames ? '' : 'inputEncodings',
        subBuilder: Encoding.create)
    ..pPM<Encoding>(2, _omitFieldNames ? '' : 'outputEncodings',
        subBuilder: Encoding.create)
    ..aE<RoleType>(3, _omitFieldNames ? '' : 'preferredRole',
        enumValues: RoleType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingOptions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingOptions copyWith(void Function(PairingOptions) updates) =>
      super.copyWith((message) => updates(message as PairingOptions))
          as PairingOptions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingOptions create() => PairingOptions._();
  @$core.override
  PairingOptions createEmptyInstance() => create();
  static $pb.PbList<PairingOptions> createRepeated() =>
      $pb.PbList<PairingOptions>();
  @$core.pragma('dart2js:noInline')
  static PairingOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingOptions>(create);
  static PairingOptions? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Encoding> get inputEncodings => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<Encoding> get outputEncodings => $_getList(1);

  @$pb.TagNumber(3)
  RoleType get preferredRole => $_getN(2);
  @$pb.TagNumber(3)
  set preferredRole(RoleType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPreferredRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreferredRole() => $_clearField(3);
}

class PairingOptionsAck extends $pb.GeneratedMessage {
  factory PairingOptionsAck({
    Encoding? selectedInputEncoding,
    Encoding? selectedOutputEncoding,
    RoleType? selectedRole,
  }) {
    final result = create();
    if (selectedInputEncoding != null)
      result.selectedInputEncoding = selectedInputEncoding;
    if (selectedOutputEncoding != null)
      result.selectedOutputEncoding = selectedOutputEncoding;
    if (selectedRole != null) result.selectedRole = selectedRole;
    return result;
  }

  PairingOptionsAck._();

  factory PairingOptionsAck.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairingOptionsAck.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairingOptionsAck',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pairing'),
      createEmptyInstance: create)
    ..aOM<Encoding>(1, _omitFieldNames ? '' : 'selectedInputEncoding',
        subBuilder: Encoding.create)
    ..aOM<Encoding>(2, _omitFieldNames ? '' : 'selectedOutputEncoding',
        subBuilder: Encoding.create)
    ..aE<RoleType>(3, _omitFieldNames ? '' : 'selectedRole',
        enumValues: RoleType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingOptionsAck clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairingOptionsAck copyWith(void Function(PairingOptionsAck) updates) =>
      super.copyWith((message) => updates(message as PairingOptionsAck))
          as PairingOptionsAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairingOptionsAck create() => PairingOptionsAck._();
  @$core.override
  PairingOptionsAck createEmptyInstance() => create();
  static $pb.PbList<PairingOptionsAck> createRepeated() =>
      $pb.PbList<PairingOptionsAck>();
  @$core.pragma('dart2js:noInline')
  static PairingOptionsAck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairingOptionsAck>(create);
  static PairingOptionsAck? _defaultInstance;

  @$pb.TagNumber(1)
  Encoding get selectedInputEncoding => $_getN(0);
  @$pb.TagNumber(1)
  set selectedInputEncoding(Encoding value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSelectedInputEncoding() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelectedInputEncoding() => $_clearField(1);
  @$pb.TagNumber(1)
  Encoding ensureSelectedInputEncoding() => $_ensure(0);

  @$pb.TagNumber(2)
  Encoding get selectedOutputEncoding => $_getN(1);
  @$pb.TagNumber(2)
  set selectedOutputEncoding(Encoding value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSelectedOutputEncoding() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelectedOutputEncoding() => $_clearField(2);
  @$pb.TagNumber(2)
  Encoding ensureSelectedOutputEncoding() => $_ensure(1);

  @$pb.TagNumber(3)
  RoleType get selectedRole => $_getN(2);
  @$pb.TagNumber(3)
  set selectedRole(RoleType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSelectedRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearSelectedRole() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
