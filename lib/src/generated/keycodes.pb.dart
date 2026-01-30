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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'keycodes.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'keycodes.pbenum.dart';

enum RemoteMessage_Message {
  remoteConfigure,
  remoteSetActive,
  remotePingRequest,
  remotePingResponse,
  remoteKeyInject,
  remoteImeKeyInject,
  remoteError,
  remoteAppInfo,
  remoteImeBatchEdit,
  remoteAdjustVolumeLevel,
  remoteSetPreferredAudioDevice,
  remoteResetPreferredAudioDevice,
  remotePowerStatus,
  remoteGetPowerStatus,
  remotePowerInfo,
  remoteVolumeInfo,
  remoteStartApp,
  notSet
}

class RemoteMessage extends $pb.GeneratedMessage {
  factory RemoteMessage({
    RemoteConfigure? remoteConfigure,
    RemoteSetActive? remoteSetActive,
    RemotePingRequest? remotePingRequest,
    RemotePingResponse? remotePingResponse,
    RemoteKeyInject? remoteKeyInject,
    RemoteImeKeyInject? remoteImeKeyInject,
    RemoteError? remoteError,
    RemoteAppInfo? remoteAppInfo,
    RemoteImeBatchEdit? remoteImeBatchEdit,
    RemoteAdjustVolumeLevel? remoteAdjustVolumeLevel,
    RemoteSetPreferredAudioDevice? remoteSetPreferredAudioDevice,
    RemoteResetPreferredAudioDevice? remoteResetPreferredAudioDevice,
    RemotePowerStatus? remotePowerStatus,
    RemoteGetPowerStatus? remoteGetPowerStatus,
    RemotePowerInfo? remotePowerInfo,
    RemoteVolumeInfo? remoteVolumeInfo,
    RemoteStartApp? remoteStartApp,
  }) {
    final result = create();
    if (remoteConfigure != null) result.remoteConfigure = remoteConfigure;
    if (remoteSetActive != null) result.remoteSetActive = remoteSetActive;
    if (remotePingRequest != null) result.remotePingRequest = remotePingRequest;
    if (remotePingResponse != null)
      result.remotePingResponse = remotePingResponse;
    if (remoteKeyInject != null) result.remoteKeyInject = remoteKeyInject;
    if (remoteImeKeyInject != null)
      result.remoteImeKeyInject = remoteImeKeyInject;
    if (remoteError != null) result.remoteError = remoteError;
    if (remoteAppInfo != null) result.remoteAppInfo = remoteAppInfo;
    if (remoteImeBatchEdit != null)
      result.remoteImeBatchEdit = remoteImeBatchEdit;
    if (remoteAdjustVolumeLevel != null)
      result.remoteAdjustVolumeLevel = remoteAdjustVolumeLevel;
    if (remoteSetPreferredAudioDevice != null)
      result.remoteSetPreferredAudioDevice = remoteSetPreferredAudioDevice;
    if (remoteResetPreferredAudioDevice != null)
      result.remoteResetPreferredAudioDevice = remoteResetPreferredAudioDevice;
    if (remotePowerStatus != null) result.remotePowerStatus = remotePowerStatus;
    if (remoteGetPowerStatus != null)
      result.remoteGetPowerStatus = remoteGetPowerStatus;
    if (remotePowerInfo != null) result.remotePowerInfo = remotePowerInfo;
    if (remoteVolumeInfo != null) result.remoteVolumeInfo = remoteVolumeInfo;
    if (remoteStartApp != null) result.remoteStartApp = remoteStartApp;
    return result;
  }

  RemoteMessage._();

  factory RemoteMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, RemoteMessage_Message>
      _RemoteMessage_MessageByTag = {
    1: RemoteMessage_Message.remoteConfigure,
    2: RemoteMessage_Message.remoteSetActive,
    8: RemoteMessage_Message.remotePingRequest,
    9: RemoteMessage_Message.remotePingResponse,
    10: RemoteMessage_Message.remoteKeyInject,
    11: RemoteMessage_Message.remoteImeKeyInject,
    15: RemoteMessage_Message.remoteError,
    20: RemoteMessage_Message.remoteAppInfo,
    21: RemoteMessage_Message.remoteImeBatchEdit,
    25: RemoteMessage_Message.remoteAdjustVolumeLevel,
    31: RemoteMessage_Message.remoteSetPreferredAudioDevice,
    32: RemoteMessage_Message.remoteResetPreferredAudioDevice,
    35: RemoteMessage_Message.remotePowerStatus,
    36: RemoteMessage_Message.remoteGetPowerStatus,
    40: RemoteMessage_Message.remotePowerInfo,
    50: RemoteMessage_Message.remoteVolumeInfo,
    330: RemoteMessage_Message.remoteStartApp,
    0: RemoteMessage_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 8, 9, 10, 11, 15, 20, 21, 25, 31, 32, 35, 36, 40, 50, 330])
    ..aOM<RemoteConfigure>(1, _omitFieldNames ? '' : 'remoteConfigure',
        subBuilder: RemoteConfigure.create)
    ..aOM<RemoteSetActive>(2, _omitFieldNames ? '' : 'remoteSetActive',
        subBuilder: RemoteSetActive.create)
    ..aOM<RemotePingRequest>(8, _omitFieldNames ? '' : 'remotePingRequest',
        subBuilder: RemotePingRequest.create)
    ..aOM<RemotePingResponse>(9, _omitFieldNames ? '' : 'remotePingResponse',
        subBuilder: RemotePingResponse.create)
    ..aOM<RemoteKeyInject>(10, _omitFieldNames ? '' : 'remoteKeyInject',
        subBuilder: RemoteKeyInject.create)
    ..aOM<RemoteImeKeyInject>(11, _omitFieldNames ? '' : 'remoteImeKeyInject',
        subBuilder: RemoteImeKeyInject.create)
    ..aOM<RemoteError>(15, _omitFieldNames ? '' : 'remoteError',
        subBuilder: RemoteError.create)
    ..aOM<RemoteAppInfo>(20, _omitFieldNames ? '' : 'remoteAppInfo',
        subBuilder: RemoteAppInfo.create)
    ..aOM<RemoteImeBatchEdit>(21, _omitFieldNames ? '' : 'remoteImeBatchEdit',
        subBuilder: RemoteImeBatchEdit.create)
    ..aOM<RemoteAdjustVolumeLevel>(
        25, _omitFieldNames ? '' : 'remoteAdjustVolumeLevel',
        subBuilder: RemoteAdjustVolumeLevel.create)
    ..aOM<RemoteSetPreferredAudioDevice>(
        31, _omitFieldNames ? '' : 'remoteSetPreferredAudioDevice',
        subBuilder: RemoteSetPreferredAudioDevice.create)
    ..aOM<RemoteResetPreferredAudioDevice>(
        32, _omitFieldNames ? '' : 'remoteResetPreferredAudioDevice',
        subBuilder: RemoteResetPreferredAudioDevice.create)
    ..aOM<RemotePowerStatus>(35, _omitFieldNames ? '' : 'remotePowerStatus',
        subBuilder: RemotePowerStatus.create)
    ..aOM<RemoteGetPowerStatus>(
        36, _omitFieldNames ? '' : 'remoteGetPowerStatus',
        subBuilder: RemoteGetPowerStatus.create)
    ..aOM<RemotePowerInfo>(40, _omitFieldNames ? '' : 'remotePowerInfo',
        subBuilder: RemotePowerInfo.create)
    ..aOM<RemoteVolumeInfo>(50, _omitFieldNames ? '' : 'remoteVolumeInfo',
        subBuilder: RemoteVolumeInfo.create)
    ..aOM<RemoteStartApp>(330, _omitFieldNames ? '' : 'remoteStartApp',
        subBuilder: RemoteStartApp.create)
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

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(15)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(25)
  @$pb.TagNumber(31)
  @$pb.TagNumber(32)
  @$pb.TagNumber(35)
  @$pb.TagNumber(36)
  @$pb.TagNumber(40)
  @$pb.TagNumber(50)
  @$pb.TagNumber(330)
  RemoteMessage_Message whichMessage() =>
      _RemoteMessage_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(15)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(25)
  @$pb.TagNumber(31)
  @$pb.TagNumber(32)
  @$pb.TagNumber(35)
  @$pb.TagNumber(36)
  @$pb.TagNumber(40)
  @$pb.TagNumber(50)
  @$pb.TagNumber(330)
  void clearMessage() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  RemoteConfigure get remoteConfigure => $_getN(0);
  @$pb.TagNumber(1)
  set remoteConfigure(RemoteConfigure value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRemoteConfigure() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteConfigure() => $_clearField(1);
  @$pb.TagNumber(1)
  RemoteConfigure ensureRemoteConfigure() => $_ensure(0);

  @$pb.TagNumber(2)
  RemoteSetActive get remoteSetActive => $_getN(1);
  @$pb.TagNumber(2)
  set remoteSetActive(RemoteSetActive value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRemoteSetActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteSetActive() => $_clearField(2);
  @$pb.TagNumber(2)
  RemoteSetActive ensureRemoteSetActive() => $_ensure(1);

  @$pb.TagNumber(8)
  RemotePingRequest get remotePingRequest => $_getN(2);
  @$pb.TagNumber(8)
  set remotePingRequest(RemotePingRequest value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasRemotePingRequest() => $_has(2);
  @$pb.TagNumber(8)
  void clearRemotePingRequest() => $_clearField(8);
  @$pb.TagNumber(8)
  RemotePingRequest ensureRemotePingRequest() => $_ensure(2);

  @$pb.TagNumber(9)
  RemotePingResponse get remotePingResponse => $_getN(3);
  @$pb.TagNumber(9)
  set remotePingResponse(RemotePingResponse value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasRemotePingResponse() => $_has(3);
  @$pb.TagNumber(9)
  void clearRemotePingResponse() => $_clearField(9);
  @$pb.TagNumber(9)
  RemotePingResponse ensureRemotePingResponse() => $_ensure(3);

  @$pb.TagNumber(10)
  RemoteKeyInject get remoteKeyInject => $_getN(4);
  @$pb.TagNumber(10)
  set remoteKeyInject(RemoteKeyInject value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasRemoteKeyInject() => $_has(4);
  @$pb.TagNumber(10)
  void clearRemoteKeyInject() => $_clearField(10);
  @$pb.TagNumber(10)
  RemoteKeyInject ensureRemoteKeyInject() => $_ensure(4);

  @$pb.TagNumber(11)
  RemoteImeKeyInject get remoteImeKeyInject => $_getN(5);
  @$pb.TagNumber(11)
  set remoteImeKeyInject(RemoteImeKeyInject value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasRemoteImeKeyInject() => $_has(5);
  @$pb.TagNumber(11)
  void clearRemoteImeKeyInject() => $_clearField(11);
  @$pb.TagNumber(11)
  RemoteImeKeyInject ensureRemoteImeKeyInject() => $_ensure(5);

  @$pb.TagNumber(15)
  RemoteError get remoteError => $_getN(6);
  @$pb.TagNumber(15)
  set remoteError(RemoteError value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasRemoteError() => $_has(6);
  @$pb.TagNumber(15)
  void clearRemoteError() => $_clearField(15);
  @$pb.TagNumber(15)
  RemoteError ensureRemoteError() => $_ensure(6);

  @$pb.TagNumber(20)
  RemoteAppInfo get remoteAppInfo => $_getN(7);
  @$pb.TagNumber(20)
  set remoteAppInfo(RemoteAppInfo value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasRemoteAppInfo() => $_has(7);
  @$pb.TagNumber(20)
  void clearRemoteAppInfo() => $_clearField(20);
  @$pb.TagNumber(20)
  RemoteAppInfo ensureRemoteAppInfo() => $_ensure(7);

  @$pb.TagNumber(21)
  RemoteImeBatchEdit get remoteImeBatchEdit => $_getN(8);
  @$pb.TagNumber(21)
  set remoteImeBatchEdit(RemoteImeBatchEdit value) => $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasRemoteImeBatchEdit() => $_has(8);
  @$pb.TagNumber(21)
  void clearRemoteImeBatchEdit() => $_clearField(21);
  @$pb.TagNumber(21)
  RemoteImeBatchEdit ensureRemoteImeBatchEdit() => $_ensure(8);

  @$pb.TagNumber(25)
  RemoteAdjustVolumeLevel get remoteAdjustVolumeLevel => $_getN(9);
  @$pb.TagNumber(25)
  set remoteAdjustVolumeLevel(RemoteAdjustVolumeLevel value) =>
      $_setField(25, value);
  @$pb.TagNumber(25)
  $core.bool hasRemoteAdjustVolumeLevel() => $_has(9);
  @$pb.TagNumber(25)
  void clearRemoteAdjustVolumeLevel() => $_clearField(25);
  @$pb.TagNumber(25)
  RemoteAdjustVolumeLevel ensureRemoteAdjustVolumeLevel() => $_ensure(9);

  @$pb.TagNumber(31)
  RemoteSetPreferredAudioDevice get remoteSetPreferredAudioDevice => $_getN(10);
  @$pb.TagNumber(31)
  set remoteSetPreferredAudioDevice(RemoteSetPreferredAudioDevice value) =>
      $_setField(31, value);
  @$pb.TagNumber(31)
  $core.bool hasRemoteSetPreferredAudioDevice() => $_has(10);
  @$pb.TagNumber(31)
  void clearRemoteSetPreferredAudioDevice() => $_clearField(31);
  @$pb.TagNumber(31)
  RemoteSetPreferredAudioDevice ensureRemoteSetPreferredAudioDevice() =>
      $_ensure(10);

  @$pb.TagNumber(32)
  RemoteResetPreferredAudioDevice get remoteResetPreferredAudioDevice =>
      $_getN(11);
  @$pb.TagNumber(32)
  set remoteResetPreferredAudioDevice(RemoteResetPreferredAudioDevice value) =>
      $_setField(32, value);
  @$pb.TagNumber(32)
  $core.bool hasRemoteResetPreferredAudioDevice() => $_has(11);
  @$pb.TagNumber(32)
  void clearRemoteResetPreferredAudioDevice() => $_clearField(32);
  @$pb.TagNumber(32)
  RemoteResetPreferredAudioDevice ensureRemoteResetPreferredAudioDevice() =>
      $_ensure(11);

  @$pb.TagNumber(35)
  RemotePowerStatus get remotePowerStatus => $_getN(12);
  @$pb.TagNumber(35)
  set remotePowerStatus(RemotePowerStatus value) => $_setField(35, value);
  @$pb.TagNumber(35)
  $core.bool hasRemotePowerStatus() => $_has(12);
  @$pb.TagNumber(35)
  void clearRemotePowerStatus() => $_clearField(35);
  @$pb.TagNumber(35)
  RemotePowerStatus ensureRemotePowerStatus() => $_ensure(12);

  @$pb.TagNumber(36)
  RemoteGetPowerStatus get remoteGetPowerStatus => $_getN(13);
  @$pb.TagNumber(36)
  set remoteGetPowerStatus(RemoteGetPowerStatus value) => $_setField(36, value);
  @$pb.TagNumber(36)
  $core.bool hasRemoteGetPowerStatus() => $_has(13);
  @$pb.TagNumber(36)
  void clearRemoteGetPowerStatus() => $_clearField(36);
  @$pb.TagNumber(36)
  RemoteGetPowerStatus ensureRemoteGetPowerStatus() => $_ensure(13);

  @$pb.TagNumber(40)
  RemotePowerInfo get remotePowerInfo => $_getN(14);
  @$pb.TagNumber(40)
  set remotePowerInfo(RemotePowerInfo value) => $_setField(40, value);
  @$pb.TagNumber(40)
  $core.bool hasRemotePowerInfo() => $_has(14);
  @$pb.TagNumber(40)
  void clearRemotePowerInfo() => $_clearField(40);
  @$pb.TagNumber(40)
  RemotePowerInfo ensureRemotePowerInfo() => $_ensure(14);

  @$pb.TagNumber(50)
  RemoteVolumeInfo get remoteVolumeInfo => $_getN(15);
  @$pb.TagNumber(50)
  set remoteVolumeInfo(RemoteVolumeInfo value) => $_setField(50, value);
  @$pb.TagNumber(50)
  $core.bool hasRemoteVolumeInfo() => $_has(15);
  @$pb.TagNumber(50)
  void clearRemoteVolumeInfo() => $_clearField(50);
  @$pb.TagNumber(50)
  RemoteVolumeInfo ensureRemoteVolumeInfo() => $_ensure(15);

  @$pb.TagNumber(330)
  RemoteStartApp get remoteStartApp => $_getN(16);
  @$pb.TagNumber(330)
  set remoteStartApp(RemoteStartApp value) => $_setField(330, value);
  @$pb.TagNumber(330)
  $core.bool hasRemoteStartApp() => $_has(16);
  @$pb.TagNumber(330)
  void clearRemoteStartApp() => $_clearField(330);
  @$pb.TagNumber(330)
  RemoteStartApp ensureRemoteStartApp() => $_ensure(16);
}

class RemoteKeyInject extends $pb.GeneratedMessage {
  factory RemoteKeyInject({
    RemoteKeyInject_RemoteKeyCode? keyCode,
    RemoteDirection? direction,
  }) {
    final result = create();
    if (keyCode != null) result.keyCode = keyCode;
    if (direction != null) result.direction = direction;
    return result;
  }

  RemoteKeyInject._();

  factory RemoteKeyInject.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteKeyInject.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteKeyInject',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aE<RemoteKeyInject_RemoteKeyCode>(1, _omitFieldNames ? '' : 'keyCode',
        enumValues: RemoteKeyInject_RemoteKeyCode.values)
    ..aE<RemoteDirection>(2, _omitFieldNames ? '' : 'direction',
        enumValues: RemoteDirection.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteKeyInject clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteKeyInject copyWith(void Function(RemoteKeyInject) updates) =>
      super.copyWith((message) => updates(message as RemoteKeyInject))
          as RemoteKeyInject;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteKeyInject create() => RemoteKeyInject._();
  @$core.override
  RemoteKeyInject createEmptyInstance() => create();
  static $pb.PbList<RemoteKeyInject> createRepeated() =>
      $pb.PbList<RemoteKeyInject>();
  @$core.pragma('dart2js:noInline')
  static RemoteKeyInject getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteKeyInject>(create);
  static RemoteKeyInject? _defaultInstance;

  @$pb.TagNumber(1)
  RemoteKeyInject_RemoteKeyCode get keyCode => $_getN(0);
  @$pb.TagNumber(1)
  set keyCode(RemoteKeyInject_RemoteKeyCode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKeyCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyCode() => $_clearField(1);

  @$pb.TagNumber(2)
  RemoteDirection get direction => $_getN(1);
  @$pb.TagNumber(2)
  set direction(RemoteDirection value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirection() => $_clearField(2);
}

/// Configuration messages
class RemoteConfigure extends $pb.GeneratedMessage {
  factory RemoteConfigure({
    $core.int? code1,
    RemoteDeviceInfo? deviceInfo,
  }) {
    final result = create();
    if (code1 != null) result.code1 = code1;
    if (deviceInfo != null) result.deviceInfo = deviceInfo;
    return result;
  }

  RemoteConfigure._();

  factory RemoteConfigure.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteConfigure.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteConfigure',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'code1', fieldType: $pb.PbFieldType.OU3)
    ..aOM<RemoteDeviceInfo>(2, _omitFieldNames ? '' : 'deviceInfo',
        subBuilder: RemoteDeviceInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteConfigure clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteConfigure copyWith(void Function(RemoteConfigure) updates) =>
      super.copyWith((message) => updates(message as RemoteConfigure))
          as RemoteConfigure;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteConfigure create() => RemoteConfigure._();
  @$core.override
  RemoteConfigure createEmptyInstance() => create();
  static $pb.PbList<RemoteConfigure> createRepeated() =>
      $pb.PbList<RemoteConfigure>();
  @$core.pragma('dart2js:noInline')
  static RemoteConfigure getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteConfigure>(create);
  static RemoteConfigure? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code1 => $_getIZ(0);
  @$pb.TagNumber(1)
  set code1($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode1() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode1() => $_clearField(1);

  @$pb.TagNumber(2)
  RemoteDeviceInfo get deviceInfo => $_getN(1);
  @$pb.TagNumber(2)
  set deviceInfo(RemoteDeviceInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDeviceInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  RemoteDeviceInfo ensureDeviceInfo() => $_ensure(1);
}

class RemoteDeviceInfo extends $pb.GeneratedMessage {
  factory RemoteDeviceInfo({
    $core.String? model,
    $core.String? vendor,
    $core.int? unknown1,
    $core.String? unknown2,
    $core.String? packageName,
    $core.String? appVersion,
  }) {
    final result = create();
    if (model != null) result.model = model;
    if (vendor != null) result.vendor = vendor;
    if (unknown1 != null) result.unknown1 = unknown1;
    if (unknown2 != null) result.unknown2 = unknown2;
    if (packageName != null) result.packageName = packageName;
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
    ..aOS(5, _omitFieldNames ? '' : 'packageName')
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
  $core.String get packageName => $_getSZ(4);
  @$pb.TagNumber(5)
  set packageName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPackageName() => $_has(4);
  @$pb.TagNumber(5)
  void clearPackageName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get appVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set appVersion($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAppVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearAppVersion() => $_clearField(6);
}

class RemoteVolumeInfo extends $pb.GeneratedMessage {
  factory RemoteVolumeInfo({
    $core.int? audioDeviceId,
    $core.int? maxVolume,
    $core.String? deviceName,
    $core.int? currentVolume,
    $core.bool? isMuted,
    $core.int? volumeStep,
    $core.int? unknown1,
    $core.bool? unknown2,
  }) {
    final result = create();
    if (audioDeviceId != null) result.audioDeviceId = audioDeviceId;
    if (maxVolume != null) result.maxVolume = maxVolume;
    if (deviceName != null) result.deviceName = deviceName;
    if (currentVolume != null) result.currentVolume = currentVolume;
    if (isMuted != null) result.isMuted = isMuted;
    if (volumeStep != null) result.volumeStep = volumeStep;
    if (unknown1 != null) result.unknown1 = unknown1;
    if (unknown2 != null) result.unknown2 = unknown2;
    return result;
  }

  RemoteVolumeInfo._();

  factory RemoteVolumeInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteVolumeInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteVolumeInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'audioDeviceId')
    ..aI(2, _omitFieldNames ? '' : 'maxVolume')
    ..aOS(3, _omitFieldNames ? '' : 'deviceName')
    ..aI(4, _omitFieldNames ? '' : 'currentVolume')
    ..aOB(5, _omitFieldNames ? '' : 'isMuted')
    ..aI(6, _omitFieldNames ? '' : 'volumeStep')
    ..aI(7, _omitFieldNames ? '' : 'unknown1')
    ..aOB(8, _omitFieldNames ? '' : 'unknown2')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteVolumeInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteVolumeInfo copyWith(void Function(RemoteVolumeInfo) updates) =>
      super.copyWith((message) => updates(message as RemoteVolumeInfo))
          as RemoteVolumeInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteVolumeInfo create() => RemoteVolumeInfo._();
  @$core.override
  RemoteVolumeInfo createEmptyInstance() => create();
  static $pb.PbList<RemoteVolumeInfo> createRepeated() =>
      $pb.PbList<RemoteVolumeInfo>();
  @$core.pragma('dart2js:noInline')
  static RemoteVolumeInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteVolumeInfo>(create);
  static RemoteVolumeInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get audioDeviceId => $_getIZ(0);
  @$pb.TagNumber(1)
  set audioDeviceId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAudioDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAudioDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get maxVolume => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxVolume($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMaxVolume() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxVolume() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceName => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDeviceName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get currentVolume => $_getIZ(3);
  @$pb.TagNumber(4)
  set currentVolume($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCurrentVolume() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentVolume() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isMuted => $_getBF(4);
  @$pb.TagNumber(5)
  set isMuted($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsMuted() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsMuted() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get volumeStep => $_getIZ(5);
  @$pb.TagNumber(6)
  set volumeStep($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasVolumeStep() => $_has(5);
  @$pb.TagNumber(6)
  void clearVolumeStep() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get unknown1 => $_getIZ(6);
  @$pb.TagNumber(7)
  set unknown1($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUnknown1() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnknown1() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get unknown2 => $_getBF(7);
  @$pb.TagNumber(8)
  set unknown2($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasUnknown2() => $_has(7);
  @$pb.TagNumber(8)
  void clearUnknown2() => $_clearField(8);
}

class RemotePowerInfo extends $pb.GeneratedMessage {
  factory RemotePowerInfo({
    $core.bool? isOn,
  }) {
    final result = create();
    if (isOn != null) result.isOn = isOn;
    return result;
  }

  RemotePowerInfo._();

  factory RemotePowerInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemotePowerInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemotePowerInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isOn')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemotePowerInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemotePowerInfo copyWith(void Function(RemotePowerInfo) updates) =>
      super.copyWith((message) => updates(message as RemotePowerInfo))
          as RemotePowerInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemotePowerInfo create() => RemotePowerInfo._();
  @$core.override
  RemotePowerInfo createEmptyInstance() => create();
  static $pb.PbList<RemotePowerInfo> createRepeated() =>
      $pb.PbList<RemotePowerInfo>();
  @$core.pragma('dart2js:noInline')
  static RemotePowerInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemotePowerInfo>(create);
  static RemotePowerInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isOn => $_getBF(0);
  @$pb.TagNumber(1)
  set isOn($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsOn() => $_clearField(1);
}

class RemoteSetActive extends $pb.GeneratedMessage {
  factory RemoteSetActive({
    $core.int? active,
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
    ..aI(1, _omitFieldNames ? '' : 'active', fieldType: $pb.PbFieldType.OU3)
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
  $core.int get active => $_getIZ(0);
  @$pb.TagNumber(1)
  set active($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActive() => $_has(0);
  @$pb.TagNumber(1)
  void clearActive() => $_clearField(1);
}

class RemoteImeKeyInject extends $pb.GeneratedMessage {
  factory RemoteImeKeyInject({
    $core.String? textField,
    $core.int? keyCode,
    RemoteDirection? direction,
  }) {
    final result = create();
    if (textField != null) result.textField = textField;
    if (keyCode != null) result.keyCode = keyCode;
    if (direction != null) result.direction = direction;
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
    ..aI(2, _omitFieldNames ? '' : 'keyCode', fieldType: $pb.PbFieldType.OU3)
    ..aE<RemoteDirection>(3, _omitFieldNames ? '' : 'direction',
        enumValues: RemoteDirection.values)
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
  $core.int get keyCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set keyCode($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKeyCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeyCode() => $_clearField(2);

  @$pb.TagNumber(3)
  RemoteDirection get direction => $_getN(2);
  @$pb.TagNumber(3)
  set direction(RemoteDirection value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDirection() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirection() => $_clearField(3);
}

/// IME (text input)
class RemoteImeBatchEdit extends $pb.GeneratedMessage {
  factory RemoteImeBatchEdit({
    $core.int? imeCounter,
    $core.int? fieldCounter,
    RemoteImeEditInfo? editInfo,
  }) {
    final result = create();
    if (imeCounter != null) result.imeCounter = imeCounter;
    if (fieldCounter != null) result.fieldCounter = fieldCounter;
    if (editInfo != null) result.editInfo = editInfo;
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
    ..aI(1, _omitFieldNames ? '' : 'imeCounter', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'fieldCounter',
        fieldType: $pb.PbFieldType.OU3)
    ..aOM<RemoteImeEditInfo>(3, _omitFieldNames ? '' : 'editInfo',
        subBuilder: RemoteImeEditInfo.create)
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
  $core.int get imeCounter => $_getIZ(0);
  @$pb.TagNumber(1)
  set imeCounter($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasImeCounter() => $_has(0);
  @$pb.TagNumber(1)
  void clearImeCounter() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get fieldCounter => $_getIZ(1);
  @$pb.TagNumber(2)
  set fieldCounter($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFieldCounter() => $_has(1);
  @$pb.TagNumber(2)
  void clearFieldCounter() => $_clearField(2);

  @$pb.TagNumber(3)
  RemoteImeEditInfo get editInfo => $_getN(2);
  @$pb.TagNumber(3)
  set editInfo(RemoteImeEditInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEditInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearEditInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  RemoteImeEditInfo ensureEditInfo() => $_ensure(2);
}

class RemoteImeEditInfo extends $pb.GeneratedMessage {
  factory RemoteImeEditInfo({
    $core.int? insert,
    RemoteTextFieldStatus? textFieldStatus,
  }) {
    final result = create();
    if (insert != null) result.insert = insert;
    if (textFieldStatus != null) result.textFieldStatus = textFieldStatus;
    return result;
  }

  RemoteImeEditInfo._();

  factory RemoteImeEditInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteImeEditInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteImeEditInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'insert', fieldType: $pb.PbFieldType.OU3)
    ..aOM<RemoteTextFieldStatus>(2, _omitFieldNames ? '' : 'textFieldStatus',
        subBuilder: RemoteTextFieldStatus.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteImeEditInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteImeEditInfo copyWith(void Function(RemoteImeEditInfo) updates) =>
      super.copyWith((message) => updates(message as RemoteImeEditInfo))
          as RemoteImeEditInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteImeEditInfo create() => RemoteImeEditInfo._();
  @$core.override
  RemoteImeEditInfo createEmptyInstance() => create();
  static $pb.PbList<RemoteImeEditInfo> createRepeated() =>
      $pb.PbList<RemoteImeEditInfo>();
  @$core.pragma('dart2js:noInline')
  static RemoteImeEditInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteImeEditInfo>(create);
  static RemoteImeEditInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get insert => $_getIZ(0);
  @$pb.TagNumber(1)
  set insert($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInsert() => $_has(0);
  @$pb.TagNumber(1)
  void clearInsert() => $_clearField(1);

  @$pb.TagNumber(2)
  RemoteTextFieldStatus get textFieldStatus => $_getN(1);
  @$pb.TagNumber(2)
  set textFieldStatus(RemoteTextFieldStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTextFieldStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearTextFieldStatus() => $_clearField(2);
  @$pb.TagNumber(2)
  RemoteTextFieldStatus ensureTextFieldStatus() => $_ensure(1);
}

class RemoteTextFieldStatus extends $pb.GeneratedMessage {
  factory RemoteTextFieldStatus({
    $core.int? start,
    $core.int? end,
    $core.String? value,
  }) {
    final result = create();
    if (start != null) result.start = start;
    if (end != null) result.end = end;
    if (value != null) result.value = value;
    return result;
  }

  RemoteTextFieldStatus._();

  factory RemoteTextFieldStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteTextFieldStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteTextFieldStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'start', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'end', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteTextFieldStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteTextFieldStatus copyWith(
          void Function(RemoteTextFieldStatus) updates) =>
      super.copyWith((message) => updates(message as RemoteTextFieldStatus))
          as RemoteTextFieldStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteTextFieldStatus create() => RemoteTextFieldStatus._();
  @$core.override
  RemoteTextFieldStatus createEmptyInstance() => create();
  static $pb.PbList<RemoteTextFieldStatus> createRepeated() =>
      $pb.PbList<RemoteTextFieldStatus>();
  @$core.pragma('dart2js:noInline')
  static RemoteTextFieldStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteTextFieldStatus>(create);
  static RemoteTextFieldStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get start => $_getIZ(0);
  @$pb.TagNumber(1)
  set start($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearStart() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get end => $_getIZ(1);
  @$pb.TagNumber(2)
  set end($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnd() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(2);
  @$pb.TagNumber(3)
  set value($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => $_clearField(3);
}

/// App launching
class RemoteStartApp extends $pb.GeneratedMessage {
  factory RemoteStartApp({
    $core.String? intentUri,
  }) {
    final result = create();
    if (intentUri != null) result.intentUri = intentUri;
    return result;
  }

  RemoteStartApp._();

  factory RemoteStartApp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteStartApp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteStartApp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'intentUri')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteStartApp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteStartApp copyWith(void Function(RemoteStartApp) updates) =>
      super.copyWith((message) => updates(message as RemoteStartApp))
          as RemoteStartApp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteStartApp create() => RemoteStartApp._();
  @$core.override
  RemoteStartApp createEmptyInstance() => create();
  static $pb.PbList<RemoteStartApp> createRepeated() =>
      $pb.PbList<RemoteStartApp>();
  @$core.pragma('dart2js:noInline')
  static RemoteStartApp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteStartApp>(create);
  static RemoteStartApp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get intentUri => $_getSZ(0);
  @$pb.TagNumber(1)
  set intentUri($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIntentUri() => $_has(0);
  @$pb.TagNumber(1)
  void clearIntentUri() => $_clearField(1);
}

class RemoteAppInfo extends $pb.GeneratedMessage {
  factory RemoteAppInfo({
    $core.String? appName,
    $core.String? appPackage,
  }) {
    final result = create();
    if (appName != null) result.appName = appName;
    if (appPackage != null) result.appPackage = appPackage;
    return result;
  }

  RemoteAppInfo._();

  factory RemoteAppInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteAppInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteAppInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'appName')
    ..aOS(2, _omitFieldNames ? '' : 'appPackage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteAppInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteAppInfo copyWith(void Function(RemoteAppInfo) updates) =>
      super.copyWith((message) => updates(message as RemoteAppInfo))
          as RemoteAppInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteAppInfo create() => RemoteAppInfo._();
  @$core.override
  RemoteAppInfo createEmptyInstance() => create();
  static $pb.PbList<RemoteAppInfo> createRepeated() =>
      $pb.PbList<RemoteAppInfo>();
  @$core.pragma('dart2js:noInline')
  static RemoteAppInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteAppInfo>(create);
  static RemoteAppInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get appName => $_getSZ(0);
  @$pb.TagNumber(1)
  set appName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAppName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get appPackage => $_getSZ(1);
  @$pb.TagNumber(2)
  set appPackage($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAppPackage() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppPackage() => $_clearField(2);
}

class RemotePingRequest extends $pb.GeneratedMessage {
  factory RemotePingRequest({
    $core.int? val1,
    $fixnum.Int64? val2,
  }) {
    final result = create();
    if (val1 != null) result.val1 = val1;
    if (val2 != null) result.val2 = val2;
    return result;
  }

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
    ..aI(1, _omitFieldNames ? '' : 'val1')
    ..aInt64(2, _omitFieldNames ? '' : 'val2')
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

  @$pb.TagNumber(1)
  $core.int get val1 => $_getIZ(0);
  @$pb.TagNumber(1)
  set val1($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVal1() => $_has(0);
  @$pb.TagNumber(1)
  void clearVal1() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get val2 => $_getI64(1);
  @$pb.TagNumber(2)
  set val2($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVal2() => $_has(1);
  @$pb.TagNumber(2)
  void clearVal2() => $_clearField(2);
}

class RemotePingResponse extends $pb.GeneratedMessage {
  factory RemotePingResponse({
    $core.int? val1,
    $fixnum.Int64? val2,
  }) {
    final result = create();
    if (val1 != null) result.val1 = val1;
    if (val2 != null) result.val2 = val2;
    return result;
  }

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
    ..aI(1, _omitFieldNames ? '' : 'val1')
    ..aInt64(2, _omitFieldNames ? '' : 'val2')
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

  @$pb.TagNumber(1)
  $core.int get val1 => $_getIZ(0);
  @$pb.TagNumber(1)
  set val1($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVal1() => $_has(0);
  @$pb.TagNumber(1)
  void clearVal1() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get val2 => $_getI64(1);
  @$pb.TagNumber(2)
  set val2($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVal2() => $_has(1);
  @$pb.TagNumber(2)
  void clearVal2() => $_clearField(2);
}

/// Power status
class RemoteGetPowerStatus extends $pb.GeneratedMessage {
  factory RemoteGetPowerStatus() => create();

  RemoteGetPowerStatus._();

  factory RemoteGetPowerStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteGetPowerStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteGetPowerStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteGetPowerStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteGetPowerStatus copyWith(void Function(RemoteGetPowerStatus) updates) =>
      super.copyWith((message) => updates(message as RemoteGetPowerStatus))
          as RemoteGetPowerStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteGetPowerStatus create() => RemoteGetPowerStatus._();
  @$core.override
  RemoteGetPowerStatus createEmptyInstance() => create();
  static $pb.PbList<RemoteGetPowerStatus> createRepeated() =>
      $pb.PbList<RemoteGetPowerStatus>();
  @$core.pragma('dart2js:noInline')
  static RemoteGetPowerStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteGetPowerStatus>(create);
  static RemoteGetPowerStatus? _defaultInstance;
}

class RemotePowerStatus extends $pb.GeneratedMessage {
  factory RemotePowerStatus({
    $core.bool? isPoweredOn,
  }) {
    final result = create();
    if (isPoweredOn != null) result.isPoweredOn = isPoweredOn;
    return result;
  }

  RemotePowerStatus._();

  factory RemotePowerStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemotePowerStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemotePowerStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isPoweredOn')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemotePowerStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemotePowerStatus copyWith(void Function(RemotePowerStatus) updates) =>
      super.copyWith((message) => updates(message as RemotePowerStatus))
          as RemotePowerStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemotePowerStatus create() => RemotePowerStatus._();
  @$core.override
  RemotePowerStatus createEmptyInstance() => create();
  static $pb.PbList<RemotePowerStatus> createRepeated() =>
      $pb.PbList<RemotePowerStatus>();
  @$core.pragma('dart2js:noInline')
  static RemotePowerStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemotePowerStatus>(create);
  static RemotePowerStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isPoweredOn => $_getBF(0);
  @$pb.TagNumber(1)
  set isPoweredOn($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsPoweredOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsPoweredOn() => $_clearField(1);
}

/// Volume control
class RemoteSetVolumeLevel extends $pb.GeneratedMessage {
  factory RemoteSetVolumeLevel({
    $core.int? volumeLevel,
    $core.int? volumeMax,
    $core.bool? isMuted,
    $core.String? deviceName,
    $core.int? unknown,
  }) {
    final result = create();
    if (volumeLevel != null) result.volumeLevel = volumeLevel;
    if (volumeMax != null) result.volumeMax = volumeMax;
    if (isMuted != null) result.isMuted = isMuted;
    if (deviceName != null) result.deviceName = deviceName;
    if (unknown != null) result.unknown = unknown;
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
    ..aI(1, _omitFieldNames ? '' : 'volumeLevel',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'volumeMax', fieldType: $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'isMuted')
    ..aOS(4, _omitFieldNames ? '' : 'deviceName')
    ..aI(5, _omitFieldNames ? '' : 'unknown', fieldType: $pb.PbFieldType.OU3)
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
  set volumeLevel($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVolumeLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearVolumeLevel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get volumeMax => $_getIZ(1);
  @$pb.TagNumber(2)
  set volumeMax($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVolumeMax() => $_has(1);
  @$pb.TagNumber(2)
  void clearVolumeMax() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isMuted => $_getBF(2);
  @$pb.TagNumber(3)
  set isMuted($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsMuted() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsMuted() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceName => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDeviceName() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get unknown => $_getIZ(4);
  @$pb.TagNumber(5)
  set unknown($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUnknown() => $_has(4);
  @$pb.TagNumber(5)
  void clearUnknown() => $_clearField(5);
}

class RemoteAdjustVolumeLevel extends $pb.GeneratedMessage {
  factory RemoteAdjustVolumeLevel({
    RemoteVolumeDirection? direction,
  }) {
    final result = create();
    if (direction != null) result.direction = direction;
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
    ..aE<RemoteVolumeDirection>(1, _omitFieldNames ? '' : 'direction',
        enumValues: RemoteVolumeDirection.values)
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
  RemoteVolumeDirection get direction => $_getN(0);
  @$pb.TagNumber(1)
  set direction(RemoteVolumeDirection value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDirection() => $_has(0);
  @$pb.TagNumber(1)
  void clearDirection() => $_clearField(1);
}

class RemoteSetPreferredAudioDevice extends $pb.GeneratedMessage {
  factory RemoteSetPreferredAudioDevice({
    $core.String? deviceId,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  RemoteSetPreferredAudioDevice._();

  factory RemoteSetPreferredAudioDevice.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteSetPreferredAudioDevice.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteSetPreferredAudioDevice',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteSetPreferredAudioDevice clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteSetPreferredAudioDevice copyWith(
          void Function(RemoteSetPreferredAudioDevice) updates) =>
      super.copyWith(
              (message) => updates(message as RemoteSetPreferredAudioDevice))
          as RemoteSetPreferredAudioDevice;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteSetPreferredAudioDevice create() =>
      RemoteSetPreferredAudioDevice._();
  @$core.override
  RemoteSetPreferredAudioDevice createEmptyInstance() => create();
  static $pb.PbList<RemoteSetPreferredAudioDevice> createRepeated() =>
      $pb.PbList<RemoteSetPreferredAudioDevice>();
  @$core.pragma('dart2js:noInline')
  static RemoteSetPreferredAudioDevice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteSetPreferredAudioDevice>(create);
  static RemoteSetPreferredAudioDevice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);
}

class RemoteResetPreferredAudioDevice extends $pb.GeneratedMessage {
  factory RemoteResetPreferredAudioDevice() => create();

  RemoteResetPreferredAudioDevice._();

  factory RemoteResetPreferredAudioDevice.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteResetPreferredAudioDevice.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteResetPreferredAudioDevice',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'remote'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteResetPreferredAudioDevice clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteResetPreferredAudioDevice copyWith(
          void Function(RemoteResetPreferredAudioDevice) updates) =>
      super.copyWith(
              (message) => updates(message as RemoteResetPreferredAudioDevice))
          as RemoteResetPreferredAudioDevice;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteResetPreferredAudioDevice create() =>
      RemoteResetPreferredAudioDevice._();
  @$core.override
  RemoteResetPreferredAudioDevice createEmptyInstance() => create();
  static $pb.PbList<RemoteResetPreferredAudioDevice> createRepeated() =>
      $pb.PbList<RemoteResetPreferredAudioDevice>();
  @$core.pragma('dart2js:noInline')
  static RemoteResetPreferredAudioDevice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteResetPreferredAudioDevice>(
          create);
  static RemoteResetPreferredAudioDevice? _defaultInstance;
}

/// Error handling
class RemoteError extends $pb.GeneratedMessage {
  factory RemoteError({
    $core.int? errorCode,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (errorCode != null) result.errorCode = errorCode;
    if (errorMessage != null) result.errorMessage = errorMessage;
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
    ..aI(1, _omitFieldNames ? '' : 'errorCode', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
