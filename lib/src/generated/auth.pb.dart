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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class AuthRequest extends $pb.GeneratedMessage {
  factory AuthRequest({
    $core.List<$core.int>? encryptedSessionKey,
    $core.List<$core.int>? clientNonce,
    $core.String? clientId,
    $fixnum.Int64? ts,
  }) {
    final result = create();
    if (encryptedSessionKey != null)
      result.encryptedSessionKey = encryptedSessionKey;
    if (clientNonce != null) result.clientNonce = clientNonce;
    if (clientId != null) result.clientId = clientId;
    if (ts != null) result.ts = ts;
    return result;
  }

  AuthRequest._();

  factory AuthRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuthRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encryptedSessionKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'clientNonce', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'clientId')
    ..aInt64(4, _omitFieldNames ? '' : 'ts')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthRequest copyWith(void Function(AuthRequest) updates) =>
      super.copyWith((message) => updates(message as AuthRequest))
          as AuthRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthRequest create() => AuthRequest._();
  @$core.override
  AuthRequest createEmptyInstance() => create();
  static $pb.PbList<AuthRequest> createRepeated() => $pb.PbList<AuthRequest>();
  @$core.pragma('dart2js:noInline')
  static AuthRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthRequest>(create);
  static AuthRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get encryptedSessionKey => $_getN(0);
  @$pb.TagNumber(1)
  set encryptedSessionKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncryptedSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncryptedSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get clientNonce => $_getN(1);
  @$pb.TagNumber(2)
  set clientNonce($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClientNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientNonce() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clientId => $_getSZ(2);
  @$pb.TagNumber(3)
  set clientId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasClientId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get ts => $_getI64(3);
  @$pb.TagNumber(4)
  set ts($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTs() => $_has(3);
  @$pb.TagNumber(4)
  void clearTs() => clearField(4);
}

class AuthResponse extends $pb.GeneratedMessage {
  factory AuthResponse({
    $core.List<$core.int>? aesCiphertext,
    $core.List<$core.int>? aesTag,
    $fixnum.Int64? ts,
  }) {
    final result = create();
    if (aesCiphertext != null) result.aesCiphertext = aesCiphertext;
    if (aesTag != null) result.aesTag = aesTag;
    if (ts != null) result.ts = ts;
    return result;
  }

  AuthResponse._();

  factory AuthResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuthResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'aesCiphertext', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'aesTag', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'ts')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthResponse copyWith(void Function(AuthResponse) updates) =>
      super.copyWith((message) => updates(message as AuthResponse))
          as AuthResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthResponse create() => AuthResponse._();
  @$core.override
  AuthResponse createEmptyInstance() => create();
  static $pb.PbList<AuthResponse> createRepeated() =>
      $pb.PbList<AuthResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthResponse>(create);
  static AuthResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get aesCiphertext => $_getN(0);
  @$pb.TagNumber(1)
  set aesCiphertext($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAesCiphertext() => $_has(0);
  @$pb.TagNumber(1)
  void clearAesCiphertext() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get aesTag => $_getN(1);
  @$pb.TagNumber(2)
  set aesTag($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAesTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearAesTag() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get ts => $_getI64(2);
  @$pb.TagNumber(3)
  set ts($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTs() => $_has(2);
  @$pb.TagNumber(3)
  void clearTs() => clearField(3);
}

enum RemoteMessage_MessageType {
  pairingRequest,
  pairingResponse,
  pairingSecret,
  remoteCommand,
  remoteSetActive,
  remotePingRequest,
  remotePingResponse,
  remoteError,
  notSet
}

class RemoteMessage extends $pb.GeneratedMessage {
  factory RemoteMessage({
    PairingRequest? pairingRequest,
    PairingResponse? pairingResponse,
    PairingSecret? pairingSecret,
    RemoteCommand? remoteCommand,
    RemoteSetActive? remoteSetActive,
    RemotePingRequest? remotePingRequest,
    RemotePingResponse? remotePingResponse,
    RemoteError? remoteError,
  }) {
    final result = create();
    if (pairingRequest != null) result.pairingRequest = pairingRequest;
    if (pairingResponse != null) result.pairingResponse = pairingResponse;
    if (pairingSecret != null) result.pairingSecret = pairingSecret;
    if (remoteCommand != null) result.remoteCommand = remoteCommand;
    if (remoteSetActive != null) result.remoteSetActive = remoteSetActive;
    if (remotePingRequest != null) result.remotePingRequest = remotePingRequest;
    if (remotePingResponse != null)
      result.remotePingResponse = remotePingResponse;
    if (remoteError != null) result.remoteError = remoteError;
    return result;
  }

  RemoteMessage._();

  factory RemoteMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, RemoteMessage_MessageType>
      _RemoteMessage_MessageTypeByTag = {
    2: RemoteMessage_MessageType.pairingRequest,
    3: RemoteMessage_MessageType.pairingResponse,
    4: RemoteMessage_MessageType.pairingSecret,
    5: RemoteMessage_MessageType.remoteCommand,
    8: RemoteMessage_MessageType.remoteSetActive,
    9: RemoteMessage_MessageType.remotePingRequest,
    10: RemoteMessage_MessageType.remotePingResponse,
    11: RemoteMessage_MessageType.remoteError,
    0: RemoteMessage_MessageType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 8, 9, 10, 11])
    ..aOM<PairingRequest>(2, _omitFieldNames ? '' : 'pairingRequest',
        subBuilder: PairingRequest.create)
    ..aOM<PairingResponse>(3, _omitFieldNames ? '' : 'pairingResponse',
        subBuilder: PairingResponse.create)
    ..aOM<PairingSecret>(4, _omitFieldNames ? '' : 'pairingSecret',
        subBuilder: PairingSecret.create)
    ..aOM<RemoteCommand>(5, _omitFieldNames ? '' : 'remoteCommand',
        subBuilder: RemoteCommand.create)
    ..aOM<RemoteSetActive>(8, _omitFieldNames ? '' : 'remoteSetActive',
        subBuilder: RemoteSetActive.create)
    ..aOM<RemotePingRequest>(9, _omitFieldNames ? '' : 'remotePingRequest',
        subBuilder: RemotePingRequest.create)
    ..aOM<RemotePingResponse>(10, _omitFieldNames ? '' : 'remotePingResponse',
        subBuilder: RemotePingResponse.create)
    ..aOM<RemoteError>(11, _omitFieldNames ? '' : 'remoteError',
        subBuilder: RemoteError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteMessage copyWith(void Function(RemoteMessage) updates) =>
      super.copyWith((message) => updates(message as RemoteMessage))
          as RemoteMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteMessage create() => RemoteMessage._();
  @$core.override
  RemoteMessage createEmptyInstance() => create();
  static $pb.PbList<RemoteMessage> createRepeated() =>
      $pb.PbList<RemoteMessage>();
  @$core.pragma('dart2js:noInline')
  static RemoteMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteMessage>(create);
  static RemoteMessage? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  RemoteMessage_MessageType whichMessageType() =>
      _RemoteMessage_MessageTypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  void clearMessageType() => clearField($_whichOneof(0));

  @$pb.TagNumber(2)
  PairingRequest get pairingRequest => $_getN(0);
  @$pb.TagNumber(2)
  set pairingRequest(PairingRequest value) => setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPairingRequest() => $_has(0);
  @$pb.TagNumber(2)
  void clearPairingRequest() => clearField(2);
  @$pb.TagNumber(2)
  PairingRequest ensurePairingRequest() => $_ensure(0);

  @$pb.TagNumber(3)
  PairingResponse get pairingResponse => $_getN(1);
  @$pb.TagNumber(3)
  set pairingResponse(PairingResponse value) => setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPairingResponse() => $_has(1);
  @$pb.TagNumber(3)
  void clearPairingResponse() => clearField(3);
  @$pb.TagNumber(3)
  PairingResponse ensurePairingResponse() => $_ensure(1);

  @$pb.TagNumber(4)
  PairingSecret get pairingSecret => $_getN(2);
  @$pb.TagNumber(4)
  set pairingSecret(PairingSecret value) => setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPairingSecret() => $_has(2);
  @$pb.TagNumber(4)
  void clearPairingSecret() => clearField(4);
  @$pb.TagNumber(4)
  PairingSecret ensurePairingSecret() => $_ensure(2);

  @$pb.TagNumber(5)
  RemoteCommand get remoteCommand => $_getN(3);
  @$pb.TagNumber(5)
  set remoteCommand(RemoteCommand value) => setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRemoteCommand() => $_has(3);
  @$pb.TagNumber(5)
  void clearRemoteCommand() => clearField(5);
  @$pb.TagNumber(5)
  RemoteCommand ensureRemoteCommand() => $_ensure(3);

  @$pb.TagNumber(8)
  RemoteSetActive get remoteSetActive => $_getN(4);
  @$pb.TagNumber(8)
  set remoteSetActive(RemoteSetActive value) => setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasRemoteSetActive() => $_has(4);
  @$pb.TagNumber(8)
  void clearRemoteSetActive() => clearField(8);
  @$pb.TagNumber(8)
  RemoteSetActive ensureRemoteSetActive() => $_ensure(4);

  @$pb.TagNumber(9)
  RemotePingRequest get remotePingRequest => $_getN(5);
  @$pb.TagNumber(9)
  set remotePingRequest(RemotePingRequest value) => setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasRemotePingRequest() => $_has(5);
  @$pb.TagNumber(9)
  void clearRemotePingRequest() => clearField(9);
  @$pb.TagNumber(9)
  RemotePingRequest ensureRemotePingRequest() => $_ensure(5);

  @$pb.TagNumber(10)
  RemotePingResponse get remotePingResponse => $_getN(6);
  @$pb.TagNumber(10)
  set remotePingResponse(RemotePingResponse value) => setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasRemotePingResponse() => $_has(6);
  @$pb.TagNumber(10)
  void clearRemotePingResponse() => clearField(10);
  @$pb.TagNumber(10)
  RemotePingResponse ensureRemotePingResponse() => $_ensure(6);

  @$pb.TagNumber(11)
  RemoteError get remoteError => $_getN(7);
  @$pb.TagNumber(11)
  set remoteError(RemoteError value) => setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasRemoteError() => $_has(7);
  @$pb.TagNumber(11)
  void clearRemoteError() => clearField(11);
  @$pb.TagNumber(11)
  RemoteError ensureRemoteError() => $_ensure(7);
}

/// Pairing messages
class PairingRequest extends $pb.GeneratedMessage {
  factory PairingRequest({
    $core.String? clientId,
    $core.String? clientName,
  }) {
    final result = create();
    if (clientId != null) result.clientId = clientId;
    if (clientName != null) result.clientName = clientName;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientId')
    ..aOS(2, _omitFieldNames ? '' : 'clientName')
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
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientName => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClientName() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientName() => clearField(2);
}

class PairingResponse extends $pb.GeneratedMessage {
  factory PairingResponse({
    $core.int? status,
    $core.String? serverPublicKey,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (serverPublicKey != null) result.serverPublicKey = serverPublicKey;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'serverPublicKey')
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
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get serverPublicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set serverPublicKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasServerPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerPublicKey() => clearField(2);
}

class PairingSecret extends $pb.GeneratedMessage {
  factory PairingSecret({
    $core.List<$core.int>? encryptedSecret,
  }) {
    final result = create();
    if (encryptedSecret != null) result.encryptedSecret = encryptedSecret;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encryptedSecret', $pb.PbFieldType.OY)
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
  $core.List<$core.int> get encryptedSecret => $_getN(0);
  @$pb.TagNumber(1)
  set encryptedSecret($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncryptedSecret() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncryptedSecret() => clearField(1);
}

/// Remote command messages
class RemoteCommand extends $pb.GeneratedMessage {
  factory RemoteCommand({
    $core.int? keyCode,
    $core.int? direction,
  }) {
    final result = create();
    if (keyCode != null) result.keyCode = keyCode;
    if (direction != null) result.direction = direction;
    return result;
  }

  RemoteCommand._();

  factory RemoteCommand.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteCommand.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteCommand',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'keyCode', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'direction', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteCommand clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteCommand copyWith(void Function(RemoteCommand) updates) =>
      super.copyWith((message) => updates(message as RemoteCommand))
          as RemoteCommand;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteCommand create() => RemoteCommand._();
  @$core.override
  RemoteCommand createEmptyInstance() => create();
  static $pb.PbList<RemoteCommand> createRepeated() =>
      $pb.PbList<RemoteCommand>();
  @$core.pragma('dart2js:noInline')
  static RemoteCommand getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteCommand>(create);
  static RemoteCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get keyCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set keyCode($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKeyCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get direction => $_getIZ(1);
  @$pb.TagNumber(2)
  set direction($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirection() => clearField(2);
}

class RemoteSetActive extends $pb.GeneratedMessage {
  factory RemoteSetActive({
    $core.bool? active,
  }) {
    final result = create();
    if (active != null) result.active = active;
    return result;
  }

  RemoteSetActive._();

  factory RemoteSetActive.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteSetActive.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteSetActive',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'active')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteSetActive clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteSetActive copyWith(void Function(RemoteSetActive) updates) =>
      super.copyWith((message) => updates(message as RemoteSetActive))
          as RemoteSetActive;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteSetActive create() => RemoteSetActive._();
  @$core.override
  RemoteSetActive createEmptyInstance() => create();
  static $pb.PbList<RemoteSetActive> createRepeated() =>
      $pb.PbList<RemoteSetActive>();
  @$core.pragma('dart2js:noInline')
  static RemoteSetActive getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteSetActive>(create);
  static RemoteSetActive? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get active => $_getBF(0);
  @$pb.TagNumber(1)
  set active($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActive() => $_has(0);
  @$pb.TagNumber(1)
  void clearActive() => clearField(1);
}

class RemotePingRequest extends $pb.GeneratedMessage {
  factory RemotePingRequest() => create();

  RemotePingRequest._();

  factory RemotePingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemotePingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemotePingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemotePingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemotePingRequest copyWith(void Function(RemotePingRequest) updates) =>
      super.copyWith((message) => updates(message as RemotePingRequest))
          as RemotePingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemotePingRequest create() => RemotePingRequest._();
  @$core.override
  RemotePingRequest createEmptyInstance() => create();
  static $pb.PbList<RemotePingRequest> createRepeated() =>
      $pb.PbList<RemotePingRequest>();
  @$core.pragma('dart2js:noInline')
  static RemotePingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemotePingRequest>(create);
  static RemotePingRequest? _defaultInstance;
}

class RemotePingResponse extends $pb.GeneratedMessage {
  factory RemotePingResponse() => create();

  RemotePingResponse._();

  factory RemotePingResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemotePingResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemotePingResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemotePingResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemotePingResponse copyWith(void Function(RemotePingResponse) updates) =>
      super.copyWith((message) => updates(message as RemotePingResponse))
          as RemotePingResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemotePingResponse create() => RemotePingResponse._();
  @$core.override
  RemotePingResponse createEmptyInstance() => create();
  static $pb.PbList<RemotePingResponse> createRepeated() =>
      $pb.PbList<RemotePingResponse>();
  @$core.pragma('dart2js:noInline')
  static RemotePingResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemotePingResponse>(create);
  static RemotePingResponse? _defaultInstance;
}

class RemoteError extends $pb.GeneratedMessage {
  factory RemoteError({
    $core.int? errorCode,
  }) {
    final result = create();
    if (errorCode != null) result.errorCode = errorCode;
    return result;
  }

  RemoteError._();

  factory RemoteError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteError',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'errorCode', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteError clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteError copyWith(void Function(RemoteError) updates) =>
      super.copyWith((message) => updates(message as RemoteError))
          as RemoteError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteError create() => RemoteError._();
  @$core.override
  RemoteError createEmptyInstance() => create();
  static $pb.PbList<RemoteError> createRepeated() => $pb.PbList<RemoteError>();
  @$core.pragma('dart2js:noInline')
  static RemoteError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteError>(create);
  static RemoteError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get errorCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set errorCode($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasErrorCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorCode() => clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
