// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_permission_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppPermissionStatus {

 Permission get permission; CombinedStatus? get combinedStatus; Object? get error; StateStatus get stateStatus;
/// Create a copy of AppPermissionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppPermissionStatusCopyWith<AppPermissionStatus> get copyWith => _$AppPermissionStatusCopyWithImpl<AppPermissionStatus>(this as AppPermissionStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppPermissionStatus&&(identical(other.permission, permission) || other.permission == permission)&&(identical(other.combinedStatus, combinedStatus) || other.combinedStatus == combinedStatus)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stateStatus, stateStatus) || other.stateStatus == stateStatus));
}


@override
int get hashCode => Object.hash(runtimeType,permission,combinedStatus,const DeepCollectionEquality().hash(error),stateStatus);

@override
String toString() {
  return 'AppPermissionStatus(permission: $permission, combinedStatus: $combinedStatus, error: $error, stateStatus: $stateStatus)';
}


}

/// @nodoc
abstract mixin class $AppPermissionStatusCopyWith<$Res>  {
  factory $AppPermissionStatusCopyWith(AppPermissionStatus value, $Res Function(AppPermissionStatus) _then) = _$AppPermissionStatusCopyWithImpl;
@useResult
$Res call({
 Permission permission, CombinedStatus? combinedStatus, Object? error, StateStatus stateStatus
});




}
/// @nodoc
class _$AppPermissionStatusCopyWithImpl<$Res>
    implements $AppPermissionStatusCopyWith<$Res> {
  _$AppPermissionStatusCopyWithImpl(this._self, this._then);

  final AppPermissionStatus _self;
  final $Res Function(AppPermissionStatus) _then;

/// Create a copy of AppPermissionStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? permission = null,Object? combinedStatus = freezed,Object? error = freezed,Object? stateStatus = null,}) {
  return _then(_self.copyWith(
permission: null == permission ? _self.permission : permission // ignore: cast_nullable_to_non_nullable
as Permission,combinedStatus: freezed == combinedStatus ? _self.combinedStatus : combinedStatus // ignore: cast_nullable_to_non_nullable
as CombinedStatus?,error: freezed == error ? _self.error : error ,stateStatus: null == stateStatus ? _self.stateStatus : stateStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,
  ));
}

}


/// @nodoc


class _AppPermissionStatus implements AppPermissionStatus {
  const _AppPermissionStatus({required this.permission, this.combinedStatus, this.error, this.stateStatus = StateStatus.initial});
  

@override final  Permission permission;
@override final  CombinedStatus? combinedStatus;
@override final  Object? error;
@override@JsonKey() final  StateStatus stateStatus;

/// Create a copy of AppPermissionStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppPermissionStatusCopyWith<_AppPermissionStatus> get copyWith => __$AppPermissionStatusCopyWithImpl<_AppPermissionStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppPermissionStatus&&(identical(other.permission, permission) || other.permission == permission)&&(identical(other.combinedStatus, combinedStatus) || other.combinedStatus == combinedStatus)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stateStatus, stateStatus) || other.stateStatus == stateStatus));
}


@override
int get hashCode => Object.hash(runtimeType,permission,combinedStatus,const DeepCollectionEquality().hash(error),stateStatus);

@override
String toString() {
  return 'AppPermissionStatus(permission: $permission, combinedStatus: $combinedStatus, error: $error, stateStatus: $stateStatus)';
}


}

/// @nodoc
abstract mixin class _$AppPermissionStatusCopyWith<$Res> implements $AppPermissionStatusCopyWith<$Res> {
  factory _$AppPermissionStatusCopyWith(_AppPermissionStatus value, $Res Function(_AppPermissionStatus) _then) = __$AppPermissionStatusCopyWithImpl;
@override @useResult
$Res call({
 Permission permission, CombinedStatus? combinedStatus, Object? error, StateStatus stateStatus
});




}
/// @nodoc
class __$AppPermissionStatusCopyWithImpl<$Res>
    implements _$AppPermissionStatusCopyWith<$Res> {
  __$AppPermissionStatusCopyWithImpl(this._self, this._then);

  final _AppPermissionStatus _self;
  final $Res Function(_AppPermissionStatus) _then;

/// Create a copy of AppPermissionStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? permission = null,Object? combinedStatus = freezed,Object? error = freezed,Object? stateStatus = null,}) {
  return _then(_AppPermissionStatus(
permission: null == permission ? _self.permission : permission // ignore: cast_nullable_to_non_nullable
as Permission,combinedStatus: freezed == combinedStatus ? _self.combinedStatus : combinedStatus // ignore: cast_nullable_to_non_nullable
as CombinedStatus?,error: freezed == error ? _self.error : error ,stateStatus: null == stateStatus ? _self.stateStatus : stateStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,
  ));
}


}

// dart format on
