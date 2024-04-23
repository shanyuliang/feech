// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_permission_status_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppPermissionStatusState {
  Permission get permission => throw _privateConstructorUsedError;
  ({PermissionStatus? permissionStatus, ServiceStatus? serviceStatus})?
      get combinedStatus => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  StateStatus get stateStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppPermissionStatusStateCopyWith<AppPermissionStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPermissionStatusStateCopyWith<$Res> {
  factory $AppPermissionStatusStateCopyWith(AppPermissionStatusState value,
          $Res Function(AppPermissionStatusState) then) =
      _$AppPermissionStatusStateCopyWithImpl<$Res, AppPermissionStatusState>;
  @useResult
  $Res call(
      {Permission permission,
      ({
        PermissionStatus? permissionStatus,
        ServiceStatus? serviceStatus
      })? combinedStatus,
      Object? error,
      StateStatus stateStatus});
}

/// @nodoc
class _$AppPermissionStatusStateCopyWithImpl<$Res,
        $Val extends AppPermissionStatusState>
    implements $AppPermissionStatusStateCopyWith<$Res> {
  _$AppPermissionStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              ServiceStatus? serviceStatus
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
abstract class _$$AppPermissionStatusStateImplCopyWith<$Res>
    implements $AppPermissionStatusStateCopyWith<$Res> {
  factory _$$AppPermissionStatusStateImplCopyWith(
          _$AppPermissionStatusStateImpl value,
          $Res Function(_$AppPermissionStatusStateImpl) then) =
      __$$AppPermissionStatusStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Permission permission,
      ({
        PermissionStatus? permissionStatus,
        ServiceStatus? serviceStatus
      })? combinedStatus,
      Object? error,
      StateStatus stateStatus});
}

/// @nodoc
class __$$AppPermissionStatusStateImplCopyWithImpl<$Res>
    extends _$AppPermissionStatusStateCopyWithImpl<$Res,
        _$AppPermissionStatusStateImpl>
    implements _$$AppPermissionStatusStateImplCopyWith<$Res> {
  __$$AppPermissionStatusStateImplCopyWithImpl(
      _$AppPermissionStatusStateImpl _value,
      $Res Function(_$AppPermissionStatusStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
    Object? combinedStatus = freezed,
    Object? error = freezed,
    Object? stateStatus = null,
  }) {
    return _then(_$AppPermissionStatusStateImpl(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as Permission,
      combinedStatus: freezed == combinedStatus
          ? _value.combinedStatus
          : combinedStatus // ignore: cast_nullable_to_non_nullable
              as ({
              PermissionStatus? permissionStatus,
              ServiceStatus? serviceStatus
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

class _$AppPermissionStatusStateImpl extends _AppPermissionStatusState {
  const _$AppPermissionStatusStateImpl(
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
    ServiceStatus? serviceStatus
  })? combinedStatus;
  @override
  final Object? error;
  @override
  @JsonKey()
  final StateStatus stateStatus;

  @override
  String toString() {
    return 'AppPermissionStatusState(permission: $permission, combinedStatus: $combinedStatus, error: $error, stateStatus: $stateStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppPermissionStatusStateImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppPermissionStatusStateImplCopyWith<_$AppPermissionStatusStateImpl>
      get copyWith => __$$AppPermissionStatusStateImplCopyWithImpl<
          _$AppPermissionStatusStateImpl>(this, _$identity);
}

abstract class _AppPermissionStatusState extends AppPermissionStatusState {
  const factory _AppPermissionStatusState(
      {required final Permission permission,
      final ({
        PermissionStatus? permissionStatus,
        ServiceStatus? serviceStatus
      })? combinedStatus,
      final Object? error,
      final StateStatus stateStatus}) = _$AppPermissionStatusStateImpl;
  const _AppPermissionStatusState._() : super._();

  @override
  Permission get permission;
  @override
  ({PermissionStatus? permissionStatus, ServiceStatus? serviceStatus})?
      get combinedStatus;
  @override
  Object? get error;
  @override
  StateStatus get stateStatus;
  @override
  @JsonKey(ignore: true)
  _$$AppPermissionStatusStateImplCopyWith<_$AppPermissionStatusStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
