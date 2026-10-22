// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_permission_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppPermissionStatus {


/// Create a copy of AppPermissionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppPermissionStatusCopyWith<AppPermissionStatus> get copyWith => _$AppPermissionStatusCopyWithImpl<AppPermissionStatus>(this as AppPermissionStatus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AppPermissionStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppPermissionStatus&&(identical(other.permission, _this.permission) || other.permission == _this.permission)&&(identical(other.combinedStatus, _this.combinedStatus) || other.combinedStatus == _this.combinedStatus)&&const DeepCollectionEquality().equals(other.error, _this.error)&&(identical(other.stateStatus, _this.stateStatus) || other.stateStatus == _this.stateStatus));
}


@override
int get hashCode {
  final _this = this as AppPermissionStatus;
  return Object.hash(runtimeType,_this.permission,_this.combinedStatus,const DeepCollectionEquality().hash(_this.error),_this.stateStatus);
}

@override
String toString() {
  final _this = this as AppPermissionStatus;
  return 'AppPermissionStatus(permission: ${_this.permission}, combinedStatus: ${_this.combinedStatus}, error: ${_this.error}, stateStatus: ${_this.stateStatus})';
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
  return _then(AppPermissionStatus(
permission: null == permission ? _self.permission : permission // ignore: cast_nullable_to_non_nullable
as Permission,combinedStatus: freezed == combinedStatus ? _self.combinedStatus : combinedStatus // ignore: cast_nullable_to_non_nullable
as CombinedStatus?,error: freezed == error ? _self.error : error ,stateStatus: null == stateStatus ? _self.stateStatus : stateStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,
  ));
}

}



// dart format on
