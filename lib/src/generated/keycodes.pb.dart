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

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'keycodes.pbenum.dart';

enum RemoteMessage_MessageType {
  remoteCommand,
  remoteSetActive,
  remotePingRequest,
  remotePingResponse,
  remoteError,
  remoteSetVolumeLevel,
  remoteAdjustVolumeLevel,
  remoteImeKeyInject,
  remoteImeBatchEdit,
  remoteDeviceInfo,
  remoteAppLinkLaunchRequest,
  notSet
}

class RemoteMessage extends $pb.GeneratedMessage {
  factory RemoteMessage({
    RemoteCommand? remoteCommand,
    RemoteSetActive? remoteSetActive,
    RemotePingRequest? remotePingRequest,
    RemotePingResponse? remotePingResponse,
    RemoteError? remoteError,
    RemoteSetVolumeLevel? remoteSetVolumeLevel,
    RemoteAdjustVolumeLevel? remoteAdjustVolumeLevel,
    RemoteImeKeyInject? remoteImeKeyInject,
    RemoteImeBatchEdit? remoteImeBatchEdit,
    RemoteDeviceInfo? remoteDeviceInfo,
    RemoteAppLinkLaunchRequest? remoteAppLinkLaunchRequest,
  }) {
    final result = create();
    if (remoteCommand != null) result.remoteCommand = remoteCommand;
    if (remoteSetActive != null) result.remoteSetActive = remoteSetActive;
    if (remotePingRequest != null) result.remotePingRequest = remotePingRequest;
    if (remotePingResponse != null)
      result.remotePingResponse = remotePingResponse;
    if (remoteError != null) result.remoteError = remoteError;
    if (remoteSetVolumeLevel != null)
      result.remoteSetVolumeLevel = remoteSetVolumeLevel;
    if (remoteAdjustVolumeLevel != null)
      result.remoteAdjustVolumeLevel = remoteAdjustVolumeLevel;
    if (remoteImeKeyInject != null)
      result.remoteImeKeyInject = remoteImeKeyInject;
    if (remoteImeBatchEdit != null)
      result.remoteImeBatchEdit = remoteImeBatchEdit;
    if (remoteDeviceInfo != null) result.remoteDeviceInfo = remoteDeviceInfo;
    if (remoteAppLinkLaunchRequest != null)
      result.remoteAppLinkLaunchRequest = remoteAppLinkLaunchRequest;
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
    5: RemoteMessage_MessageType.remoteCommand,
    8: RemoteMessage_MessageType.remoteSetActive,
    9: RemoteMessage_MessageType.remotePingRequest,
    10: RemoteMessage_MessageType.remotePingResponse,
    11: RemoteMessage_MessageType.remoteError,
    12: RemoteMessage_MessageType.remoteSetVolumeLevel,
    13: RemoteMessage_MessageType.remoteAdjustVolumeLevel,
    14: RemoteMessage_MessageType.remoteImeKeyInject,
    15: RemoteMessage_MessageType.remoteImeBatchEdit,
    17: RemoteMessage_MessageType.remoteDeviceInfo,
    18: RemoteMessage_MessageType.remoteAppLinkLaunchRequest,
    0: RemoteMessage_MessageType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..oo(0, [5, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18])
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
    ..aOM<RemoteSetVolumeLevel>(
        12, _omitFieldNames ? '' : 'remoteSetVolumeLevel',
        subBuilder: RemoteSetVolumeLevel.create)
    ..aOM<RemoteAdjustVolumeLevel>(
        13, _omitFieldNames ? '' : 'remoteAdjustVolumeLevel',
        subBuilder: RemoteAdjustVolumeLevel.create)
    ..aOM<RemoteImeKeyInject>(14, _omitFieldNames ? '' : 'remoteImeKeyInject',
        subBuilder: RemoteImeKeyInject.create)
    ..aOM<RemoteImeBatchEdit>(15, _omitFieldNames ? '' : 'remoteImeBatchEdit',
        subBuilder: RemoteImeBatchEdit.create)
    ..aOM<RemoteDeviceInfo>(17, _omitFieldNames ? '' : 'remoteDeviceInfo',
        subBuilder: RemoteDeviceInfo.create)
    ..aOM<RemoteAppLinkLaunchRequest>(
        18, _omitFieldNames ? '' : 'remoteAppLinkLaunchRequest',
        subBuilder: RemoteAppLinkLaunchRequest.create)
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

  @$pb.TagNumber(5)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  RemoteMessage_MessageType whichMessageType() =>
      _RemoteMessage_MessageTypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(5)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  void clearMessageType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(5)
  RemoteCommand get remoteCommand => $_getN(0);
  @$pb.TagNumber(5)
  set remoteCommand(RemoteCommand value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRemoteCommand() => $_has(0);
  @$pb.TagNumber(5)
  void clearRemoteCommand() => $_clearField(5);
  @$pb.TagNumber(5)
  RemoteCommand ensureRemoteCommand() => $_ensure(0);

  @$pb.TagNumber(8)
  RemoteSetActive get remoteSetActive => $_getN(1);
  @$pb.TagNumber(8)
  set remoteSetActive(RemoteSetActive value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasRemoteSetActive() => $_has(1);
  @$pb.TagNumber(8)
  void clearRemoteSetActive() => $_clearField(8);
  @$pb.TagNumber(8)
  RemoteSetActive ensureRemoteSetActive() => $_ensure(1);

  @$pb.TagNumber(9)
  RemotePingRequest get remotePingRequest => $_getN(2);
  @$pb.TagNumber(9)
  set remotePingRequest(RemotePingRequest value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasRemotePingRequest() => $_has(2);
  @$pb.TagNumber(9)
  void clearRemotePingRequest() => $_clearField(9);
  @$pb.TagNumber(9)
  RemotePingRequest ensureRemotePingRequest() => $_ensure(2);

  @$pb.TagNumber(10)
  RemotePingResponse get remotePingResponse => $_getN(3);
  @$pb.TagNumber(10)
  set remotePingResponse(RemotePingResponse value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasRemotePingResponse() => $_has(3);
  @$pb.TagNumber(10)
  void clearRemotePingResponse() => $_clearField(10);
  @$pb.TagNumber(10)
  RemotePingResponse ensureRemotePingResponse() => $_ensure(3);

  @$pb.TagNumber(11)
  RemoteError get remoteError => $_getN(4);
  @$pb.TagNumber(11)
  set remoteError(RemoteError value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasRemoteError() => $_has(4);
  @$pb.TagNumber(11)
  void clearRemoteError() => $_clearField(11);
  @$pb.TagNumber(11)
  RemoteError ensureRemoteError() => $_ensure(4);

  @$pb.TagNumber(12)
  RemoteSetVolumeLevel get remoteSetVolumeLevel => $_getN(5);
  @$pb.TagNumber(12)
  set remoteSetVolumeLevel(RemoteSetVolumeLevel value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasRemoteSetVolumeLevel() => $_has(5);
  @$pb.TagNumber(12)
  void clearRemoteSetVolumeLevel() => $_clearField(12);
  @$pb.TagNumber(12)
  RemoteSetVolumeLevel ensureRemoteSetVolumeLevel() => $_ensure(5);

  @$pb.TagNumber(13)
  RemoteAdjustVolumeLevel get remoteAdjustVolumeLevel => $_getN(6);
  @$pb.TagNumber(13)
  set remoteAdjustVolumeLevel(RemoteAdjustVolumeLevel value) =>
      $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasRemoteAdjustVolumeLevel() => $_has(6);
  @$pb.TagNumber(13)
  void clearRemoteAdjustVolumeLevel() => $_clearField(13);
  @$pb.TagNumber(13)
  RemoteAdjustVolumeLevel ensureRemoteAdjustVolumeLevel() => $_ensure(6);

  @$pb.TagNumber(14)
  RemoteImeKeyInject get remoteImeKeyInject => $_getN(7);
  @$pb.TagNumber(14)
  set remoteImeKeyInject(RemoteImeKeyInject value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasRemoteImeKeyInject() => $_has(7);
  @$pb.TagNumber(14)
  void clearRemoteImeKeyInject() => $_clearField(14);
  @$pb.TagNumber(14)
  RemoteImeKeyInject ensureRemoteImeKeyInject() => $_ensure(7);

  @$pb.TagNumber(15)
  RemoteImeBatchEdit get remoteImeBatchEdit => $_getN(8);
  @$pb.TagNumber(15)
  set remoteImeBatchEdit(RemoteImeBatchEdit value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasRemoteImeBatchEdit() => $_has(8);
  @$pb.TagNumber(15)
  void clearRemoteImeBatchEdit() => $_clearField(15);
  @$pb.TagNumber(15)
  RemoteImeBatchEdit ensureRemoteImeBatchEdit() => $_ensure(8);

  @$pb.TagNumber(17)
  RemoteDeviceInfo get remoteDeviceInfo => $_getN(9);
  @$pb.TagNumber(17)
  set remoteDeviceInfo(RemoteDeviceInfo value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasRemoteDeviceInfo() => $_has(9);
  @$pb.TagNumber(17)
  void clearRemoteDeviceInfo() => $_clearField(17);
  @$pb.TagNumber(17)
  RemoteDeviceInfo ensureRemoteDeviceInfo() => $_ensure(9);

  @$pb.TagNumber(18)
  RemoteAppLinkLaunchRequest get remoteAppLinkLaunchRequest => $_getN(10);
  @$pb.TagNumber(18)
  set remoteAppLinkLaunchRequest(RemoteAppLinkLaunchRequest value) =>
      $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasRemoteAppLinkLaunchRequest() => $_has(10);
  @$pb.TagNumber(18)
  void clearRemoteAppLinkLaunchRequest() => $_clearField(18);
  @$pb.TagNumber(18)
  RemoteAppLinkLaunchRequest ensureRemoteAppLinkLaunchRequest() => $_ensure(10);
}

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
    ..aI(1, _omitFieldNames ? '' : 'keyCode')
    ..aI(2, _omitFieldNames ? '' : 'direction')
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
  void clearKeyCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get direction => $_getIZ(1);
  @$pb.TagNumber(2)
  set direction($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirection() => $_clearField(2);
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
  void clearActive() => $_clearField(1);
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
    ..aI(1, _omitFieldNames ? '' : 'errorCode')
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
  void clearErrorCode() => $_clearField(1);
}

class RemoteSetVolumeLevel extends $pb.GeneratedMessage {
  factory RemoteSetVolumeLevel({
    $core.int? volumeLevel,
    $core.int? volumeMax,
    $core.int? volumeMin,
    $core.bool? volumeMuted,
  }) {
    final result = create();
    if (volumeLevel != null) result.volumeLevel = volumeLevel;
    if (volumeMax != null) result.volumeMax = volumeMax;
    if (volumeMin != null) result.volumeMin = volumeMin;
    if (volumeMuted != null) result.volumeMuted = volumeMuted;
    return result;
  }

  RemoteSetVolumeLevel._();

  factory RemoteSetVolumeLevel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteSetVolumeLevel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteSetVolumeLevel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'volumeLevel')
    ..aI(2, _omitFieldNames ? '' : 'volumeMax')
    ..aI(3, _omitFieldNames ? '' : 'volumeMin')
    ..aOB(4, _omitFieldNames ? '' : 'volumeMuted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteSetVolumeLevel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteSetVolumeLevel copyWith(void Function(RemoteSetVolumeLevel) updates) =>
      super.copyWith((message) => updates(message as RemoteSetVolumeLevel))
          as RemoteSetVolumeLevel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteSetVolumeLevel create() => RemoteSetVolumeLevel._();
  @$core.override
  RemoteSetVolumeLevel createEmptyInstance() => create();
  static $pb.PbList<RemoteSetVolumeLevel> createRepeated() =>
      $pb.PbList<RemoteSetVolumeLevel>();
  @$core.pragma('dart2js:noInline')
  static RemoteSetVolumeLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteSetVolumeLevel>(create);
  static RemoteSetVolumeLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get volumeLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set volumeLevel($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVolumeLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearVolumeLevel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get volumeMax => $_getIZ(1);
  @$pb.TagNumber(2)
  set volumeMax($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVolumeMax() => $_has(1);
  @$pb.TagNumber(2)
  void clearVolumeMax() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get volumeMin => $_getIZ(2);
  @$pb.TagNumber(3)
  set volumeMin($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVolumeMin() => $_has(2);
  @$pb.TagNumber(3)
  void clearVolumeMin() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get volumeMuted => $_getBF(3);
  @$pb.TagNumber(4)
  set volumeMuted($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVolumeMuted() => $_has(3);
  @$pb.TagNumber(4)
  void clearVolumeMuted() => $_clearField(4);
}

class RemoteAdjustVolumeLevel extends $pb.GeneratedMessage {
  factory RemoteAdjustVolumeLevel({
    $core.int? delta,
  }) {
    final result = create();
    if (delta != null) result.delta = delta;
    return result;
  }

  RemoteAdjustVolumeLevel._();

  factory RemoteAdjustVolumeLevel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteAdjustVolumeLevel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteAdjustVolumeLevel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'delta')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteAdjustVolumeLevel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteAdjustVolumeLevel copyWith(
          void Function(RemoteAdjustVolumeLevel) updates) =>
      super.copyWith((message) => updates(message as RemoteAdjustVolumeLevel))
          as RemoteAdjustVolumeLevel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteAdjustVolumeLevel create() => RemoteAdjustVolumeLevel._();
  @$core.override
  RemoteAdjustVolumeLevel createEmptyInstance() => create();
  static $pb.PbList<RemoteAdjustVolumeLevel> createRepeated() =>
      $pb.PbList<RemoteAdjustVolumeLevel>();
  @$core.pragma('dart2js:noInline')
  static RemoteAdjustVolumeLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteAdjustVolumeLevel>(create);
  static RemoteAdjustVolumeLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get delta => $_getIZ(0);
  @$pb.TagNumber(1)
  set delta($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDelta() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelta() => $_clearField(1);
}

class RemoteImeKeyInject extends $pb.GeneratedMessage {
  factory RemoteImeKeyInject({
    $core.String? textField,
    $core.int? appPackageName,
  }) {
    final result = create();
    if (textField != null) result.textField = textField;
    if (appPackageName != null) result.appPackageName = appPackageName;
    return result;
  }

  RemoteImeKeyInject._();

  factory RemoteImeKeyInject.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteImeKeyInject.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteImeKeyInject',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'textField')
    ..aI(2, _omitFieldNames ? '' : 'appPackageName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteImeKeyInject clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteImeKeyInject copyWith(void Function(RemoteImeKeyInject) updates) =>
      super.copyWith((message) => updates(message as RemoteImeKeyInject))
          as RemoteImeKeyInject;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteImeKeyInject create() => RemoteImeKeyInject._();
  @$core.override
  RemoteImeKeyInject createEmptyInstance() => create();
  static $pb.PbList<RemoteImeKeyInject> createRepeated() =>
      $pb.PbList<RemoteImeKeyInject>();
  @$core.pragma('dart2js:noInline')
  static RemoteImeKeyInject getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteImeKeyInject>(create);
  static RemoteImeKeyInject? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get textField => $_getSZ(0);
  @$pb.TagNumber(1)
  set textField($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTextField() => $_has(0);
  @$pb.TagNumber(1)
  void clearTextField() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get appPackageName => $_getIZ(1);
  @$pb.TagNumber(2)
  set appPackageName($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAppPackageName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppPackageName() => $_clearField(2);
}

class RemoteImeBatchEdit extends $pb.GeneratedMessage {
  factory RemoteImeBatchEdit({
    $core.int? deleteBeforeLength,
    $core.int? deleteAfterLength,
    $core.String? newCursorPosition,
    $core.String? newText,
    $core.bool? newCompositionText,
  }) {
    final result = create();
    if (deleteBeforeLength != null)
      result.deleteBeforeLength = deleteBeforeLength;
    if (deleteAfterLength != null) result.deleteAfterLength = deleteAfterLength;
    if (newCursorPosition != null) result.newCursorPosition = newCursorPosition;
    if (newText != null) result.newText = newText;
    if (newCompositionText != null)
      result.newCompositionText = newCompositionText;
    return result;
  }

  RemoteImeBatchEdit._();

  factory RemoteImeBatchEdit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteImeBatchEdit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteImeBatchEdit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'deleteBeforeLength')
    ..aI(2, _omitFieldNames ? '' : 'deleteAfterLength')
    ..aOS(3, _omitFieldNames ? '' : 'newCursorPosition')
    ..aOS(4, _omitFieldNames ? '' : 'newText')
    ..aOB(5, _omitFieldNames ? '' : 'newCompositionText')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteImeBatchEdit clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteImeBatchEdit copyWith(void Function(RemoteImeBatchEdit) updates) =>
      super.copyWith((message) => updates(message as RemoteImeBatchEdit))
          as RemoteImeBatchEdit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteImeBatchEdit create() => RemoteImeBatchEdit._();
  @$core.override
  RemoteImeBatchEdit createEmptyInstance() => create();
  static $pb.PbList<RemoteImeBatchEdit> createRepeated() =>
      $pb.PbList<RemoteImeBatchEdit>();
  @$core.pragma('dart2js:noInline')
  static RemoteImeBatchEdit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteImeBatchEdit>(create);
  static RemoteImeBatchEdit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get deleteBeforeLength => $_getIZ(0);
  @$pb.TagNumber(1)
  set deleteBeforeLength($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeleteBeforeLength() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeleteBeforeLength() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get deleteAfterLength => $_getIZ(1);
  @$pb.TagNumber(2)
  set deleteAfterLength($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeleteAfterLength() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeleteAfterLength() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get newCursorPosition => $_getSZ(2);
  @$pb.TagNumber(3)
  set newCursorPosition($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNewCursorPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewCursorPosition() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get newText => $_getSZ(3);
  @$pb.TagNumber(4)
  set newText($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNewText() => $_has(3);
  @$pb.TagNumber(4)
  void clearNewText() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get newCompositionText => $_getBF(4);
  @$pb.TagNumber(5)
  set newCompositionText($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNewCompositionText() => $_has(4);
  @$pb.TagNumber(5)
  void clearNewCompositionText() => $_clearField(5);
}

class RemoteDeviceInfo extends $pb.GeneratedMessage {
  factory RemoteDeviceInfo({
    $core.String? model,
    $core.String? vendor,
    $core.int? unknown1,
    $core.String? unknown2,
    $core.String? appPackage,
    $core.String? appVersion,
  }) {
    final result = create();
    if (model != null) result.model = model;
    if (vendor != null) result.vendor = vendor;
    if (unknown1 != null) result.unknown1 = unknown1;
    if (unknown2 != null) result.unknown2 = unknown2;
    if (appPackage != null) result.appPackage = appPackage;
    if (appVersion != null) result.appVersion = appVersion;
    return result;
  }

  RemoteDeviceInfo._();

  factory RemoteDeviceInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteDeviceInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteDeviceInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'model')
    ..aOS(2, _omitFieldNames ? '' : 'vendor')
    ..aI(3, _omitFieldNames ? '' : 'unknown1')
    ..aOS(4, _omitFieldNames ? '' : 'unknown2')
    ..aOS(5, _omitFieldNames ? '' : 'appPackage')
    ..aOS(6, _omitFieldNames ? '' : 'appVersion')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteDeviceInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteDeviceInfo copyWith(void Function(RemoteDeviceInfo) updates) =>
      super.copyWith((message) => updates(message as RemoteDeviceInfo))
          as RemoteDeviceInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteDeviceInfo create() => RemoteDeviceInfo._();
  @$core.override
  RemoteDeviceInfo createEmptyInstance() => create();
  static $pb.PbList<RemoteDeviceInfo> createRepeated() =>
      $pb.PbList<RemoteDeviceInfo>();
  @$core.pragma('dart2js:noInline')
  static RemoteDeviceInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteDeviceInfo>(create);
  static RemoteDeviceInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get model => $_getSZ(0);
  @$pb.TagNumber(1)
  set model($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasModel() => $_has(0);
  @$pb.TagNumber(1)
  void clearModel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get vendor => $_getSZ(1);
  @$pb.TagNumber(2)
  set vendor($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVendor() => $_has(1);
  @$pb.TagNumber(2)
  void clearVendor() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get unknown1 => $_getIZ(2);
  @$pb.TagNumber(3)
  set unknown1($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUnknown1() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnknown1() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get unknown2 => $_getSZ(3);
  @$pb.TagNumber(4)
  set unknown2($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUnknown2() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnknown2() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get appPackage => $_getSZ(4);
  @$pb.TagNumber(5)
  set appPackage($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAppPackage() => $_has(4);
  @$pb.TagNumber(5)
  void clearAppPackage() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get appVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set appVersion($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAppVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearAppVersion() => $_clearField(6);
}

class RemoteAppLinkLaunchRequest extends $pb.GeneratedMessage {
  factory RemoteAppLinkLaunchRequest({
    $core.String? appLink,
  }) {
    final result = create();
    if (appLink != null) result.appLink = appLink;
    return result;
  }

  RemoteAppLinkLaunchRequest._();

  factory RemoteAppLinkLaunchRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteAppLinkLaunchRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteAppLinkLaunchRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'appLink')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteAppLinkLaunchRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteAppLinkLaunchRequest copyWith(
          void Function(RemoteAppLinkLaunchRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RemoteAppLinkLaunchRequest))
          as RemoteAppLinkLaunchRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteAppLinkLaunchRequest create() => RemoteAppLinkLaunchRequest._();
  @$core.override
  RemoteAppLinkLaunchRequest createEmptyInstance() => create();
  static $pb.PbList<RemoteAppLinkLaunchRequest> createRepeated() =>
      $pb.PbList<RemoteAppLinkLaunchRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoteAppLinkLaunchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteAppLinkLaunchRequest>(create);
  static RemoteAppLinkLaunchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get appLink => $_getSZ(0);
  @$pb.TagNumber(1)
  set appLink($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAppLink() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppLink() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
