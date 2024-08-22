// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_permission_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppPermissionStatus {
  Permission get permission => throw _privateConstructorUsedError;
  ({
    PermissionStatus? permissionStatus,
    ServiceStatus? serviceStatus,
    bool? shouldShowRequestRationale
  })? get combinedStatus => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  StateStatus get stateStatus => throw _privateConstructorUsedError;

  /// Create a copy of AppPermissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppPermissionStatusCopyWith<AppPermissionStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPermissionStatusCopyWith<$Res> {
  factory $AppPermissionStatusCopyWith(
          AppPermissionStatus value, $Res Function(AppPermissionStatus) then) =
      _$AppPermissionStatusCopyWithImpl<$Res, AppPermissionStatus>;
  @useResult
  $Res call(
      {Permission permission,
      ({
        PermissionStatus? permissionStatus,
        ServiceStatus? serviceStatus,
        bool? shouldShowRequestRationale
      })? combinedStatus,
      Object? error,
      StateStatus stateStatus});
}

/// @nodoc
class _$AppPermissionStatusCopyWithImpl<$Res, $Val extends AppPermissionStatus>
    implements $AppPermissionStatusCopyWith<$Res> {
  _$AppPermissionStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppPermissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
    Object? combinedStatus = freezed,
    Object? error = freezed,
    Object? stateStatus = null,
  }) {
    return _then(_value.copyWith(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as Permission,
      combinedStatus: freezed == combinedStatus
          ? _value.combinedStatus
          : combinedStatus // ignore: cast_nullable_to_non_nullable
              as ({
              PermissionStatus? permissionStatus,
              ServiceStatus? serviceStatus,
              bool? shouldShowRequestRationale
            })?,
      error: freezed == error ? _value.error : error,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppPermissionStatusImplCopyWith<$Res>
    implements $AppPermissionStatusCopyWith<$Res> {
  factory _$$AppPermissionStatusImplCopyWith(_$AppPermissionStatusImpl value,
          $Res Function(_$AppPermissionStatusImpl) then) =
      __$$AppPermissionStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Permission permission,
      ({
        PermissionStatus? permissionStatus,
        ServiceStatus? serviceStatus,
        bool? shouldShowRequestRationale
      })? combinedStatus,
      Object? error,
      StateStatus stateStatus});
}

/// @nodoc
class __$$AppPermissionStatusImplCopyWithImpl<$Res>
    extends _$AppPermissionStatusCopyWithImpl<$Res, _$AppPermissionStatusImpl>
    implements _$$AppPermissionStatusImplCopyWith<$Res> {
  __$$AppPermissionStatusImplCopyWithImpl(_$AppPermissionStatusImpl _value,
      $Res Function(_$AppPermissionStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppPermissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
    Object? combinedStatus = freezed,
    Object? error = freezed,
    Object? stateStatus = null,
  }) {
    return _then(_$AppPermissionStatusImpl(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as Permission,
      combinedStatus: freezed == combinedStatus
          ? _value.combinedStatus
          : combinedStatus // ignore: cast_nullable_to_non_nullable
              as ({
              PermissionStatus? permissionStatus,
              ServiceStatus? serviceStatus,
              bool? shouldShowRequestRationale
            })?,
      error: freezed == error ? _value.error : error,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ));
  }
}

/// @nodoc

class _$AppPermissionStatusImpl extends _AppPermissionStatus {
  const _$AppPermissionStatusImpl(
      {required this.permission,
      this.combinedStatus,
      this.error,
      this.stateStatus = StateStatus.initial})
      : super._();

  @override
  final Permission permission;
  @override
  final ({
    PermissionStatus? permissionStatus,
    ServiceStatus? serviceStatus,
    bool? shouldShowRequestRationale
  })? combinedStatus;
  @override
  final Object? error;
  @override
  @JsonKey()
  final StateStatus stateStatus;

  @override
  String toString() {
    return 'AppPermissionStatus(permission: $permission, combinedStatus: $combinedStatus, error: $error, stateStatus: $stateStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppPermissionStatusImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.combinedStatus, combinedStatus) ||
                other.combinedStatus == combinedStatus) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission, combinedStatus,
      const DeepCollectionEquality().hash(error), stateStatus);

  /// Create a copy of AppPermissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppPermissionStatusImplCopyWith<_$AppPermissionStatusImpl> get copyWith =>
      __$$AppPermissionStatusImplCopyWithImpl<_$AppPermissionStatusImpl>(
          this, _$identity);
}

abstract class _AppPermissionStatus extends AppPermissionStatus {
  const factory _AppPermissionStatus(
      {required final Permission permission,
      final ({
        PermissionStatus? permissionStatus,
        ServiceStatus? serviceStatus,
        bool? shouldShowRequestRationale
      })? combinedStatus,
      final Object? error,
      final StateStatus stateStatus}) = _$AppPermissionStatusImpl;
  const _AppPermissionStatus._() : super._();

  @override
  Permission get permission;
  @override
  ({
    PermissionStatus? permissionStatus,
    ServiceStatus? serviceStatus,
    bool? shouldShowRequestRationale
  })? get combinedStatus;
  @override
  Object? get error;
  @override
  StateStatus get stateStatus;

  /// Create a copy of AppPermissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppPermissionStatusImplCopyWith<_$AppPermissionStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
