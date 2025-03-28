// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraMeta {

 List<CameraDescription>? get cameraDescriptions; CameraDescription? get selectedCameraDescription; CameraController? get selectedCameraController; String? get imagePath; StateStatus get stateStatus;
/// Create a copy of CameraMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraMetaCopyWith<CameraMeta> get copyWith => _$CameraMetaCopyWithImpl<CameraMeta>(this as CameraMeta, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraMeta&&const DeepCollectionEquality().equals(other.cameraDescriptions, cameraDescriptions)&&(identical(other.selectedCameraDescription, selectedCameraDescription) || other.selectedCameraDescription == selectedCameraDescription)&&(identical(other.selectedCameraController, selectedCameraController) || other.selectedCameraController == selectedCameraController)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.stateStatus, stateStatus) || other.stateStatus == stateStatus));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cameraDescriptions),selectedCameraDescription,selectedCameraController,imagePath,stateStatus);

@override
String toString() {
  return 'CameraMeta(cameraDescriptions: $cameraDescriptions, selectedCameraDescription: $selectedCameraDescription, selectedCameraController: $selectedCameraController, imagePath: $imagePath, stateStatus: $stateStatus)';
}


}

/// @nodoc
abstract mixin class $CameraMetaCopyWith<$Res>  {
  factory $CameraMetaCopyWith(CameraMeta value, $Res Function(CameraMeta) _then) = _$CameraMetaCopyWithImpl;
@useResult
$Res call({
 List<CameraDescription>? cameraDescriptions, CameraDescription? selectedCameraDescription, CameraController? selectedCameraController, String? imagePath, StateStatus stateStatus
});




}
/// @nodoc
class _$CameraMetaCopyWithImpl<$Res>
    implements $CameraMetaCopyWith<$Res> {
  _$CameraMetaCopyWithImpl(this._self, this._then);

  final CameraMeta _self;
  final $Res Function(CameraMeta) _then;

/// Create a copy of CameraMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cameraDescriptions = freezed,Object? selectedCameraDescription = freezed,Object? selectedCameraController = freezed,Object? imagePath = freezed,Object? stateStatus = null,}) {
  return _then(_self.copyWith(
cameraDescriptions: freezed == cameraDescriptions ? _self.cameraDescriptions : cameraDescriptions // ignore: cast_nullable_to_non_nullable
as List<CameraDescription>?,selectedCameraDescription: freezed == selectedCameraDescription ? _self.selectedCameraDescription : selectedCameraDescription // ignore: cast_nullable_to_non_nullable
as CameraDescription?,selectedCameraController: freezed == selectedCameraController ? _self.selectedCameraController : selectedCameraController // ignore: cast_nullable_to_non_nullable
as CameraController?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,stateStatus: null == stateStatus ? _self.stateStatus : stateStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,
  ));
}

}


/// @nodoc


class _CameraMeta implements CameraMeta {
  const _CameraMeta({final  List<CameraDescription>? cameraDescriptions, this.selectedCameraDescription, this.selectedCameraController, this.imagePath, this.stateStatus = StateStatus.initial}): _cameraDescriptions = cameraDescriptions;
  

 final  List<CameraDescription>? _cameraDescriptions;
@override List<CameraDescription>? get cameraDescriptions {
  final value = _cameraDescriptions;
  if (value == null) return null;
  if (_cameraDescriptions is EqualUnmodifiableListView) return _cameraDescriptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CameraDescription? selectedCameraDescription;
@override final  CameraController? selectedCameraController;
@override final  String? imagePath;
@override@JsonKey() final  StateStatus stateStatus;

/// Create a copy of CameraMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraMetaCopyWith<_CameraMeta> get copyWith => __$CameraMetaCopyWithImpl<_CameraMeta>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraMeta&&const DeepCollectionEquality().equals(other._cameraDescriptions, _cameraDescriptions)&&(identical(other.selectedCameraDescription, selectedCameraDescription) || other.selectedCameraDescription == selectedCameraDescription)&&(identical(other.selectedCameraController, selectedCameraController) || other.selectedCameraController == selectedCameraController)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.stateStatus, stateStatus) || other.stateStatus == stateStatus));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cameraDescriptions),selectedCameraDescription,selectedCameraController,imagePath,stateStatus);

@override
String toString() {
  return 'CameraMeta(cameraDescriptions: $cameraDescriptions, selectedCameraDescription: $selectedCameraDescription, selectedCameraController: $selectedCameraController, imagePath: $imagePath, stateStatus: $stateStatus)';
}


}

/// @nodoc
abstract mixin class _$CameraMetaCopyWith<$Res> implements $CameraMetaCopyWith<$Res> {
  factory _$CameraMetaCopyWith(_CameraMeta value, $Res Function(_CameraMeta) _then) = __$CameraMetaCopyWithImpl;
@override @useResult
$Res call({
 List<CameraDescription>? cameraDescriptions, CameraDescription? selectedCameraDescription, CameraController? selectedCameraController, String? imagePath, StateStatus stateStatus
});




}
/// @nodoc
class __$CameraMetaCopyWithImpl<$Res>
    implements _$CameraMetaCopyWith<$Res> {
  __$CameraMetaCopyWithImpl(this._self, this._then);

  final _CameraMeta _self;
  final $Res Function(_CameraMeta) _then;

/// Create a copy of CameraMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cameraDescriptions = freezed,Object? selectedCameraDescription = freezed,Object? selectedCameraController = freezed,Object? imagePath = freezed,Object? stateStatus = null,}) {
  return _then(_CameraMeta(
cameraDescriptions: freezed == cameraDescriptions ? _self._cameraDescriptions : cameraDescriptions // ignore: cast_nullable_to_non_nullable
as List<CameraDescription>?,selectedCameraDescription: freezed == selectedCameraDescription ? _self.selectedCameraDescription : selectedCameraDescription // ignore: cast_nullable_to_non_nullable
as CameraDescription?,selectedCameraController: freezed == selectedCameraController ? _self.selectedCameraController : selectedCameraController // ignore: cast_nullable_to_non_nullable
as CameraController?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,stateStatus: null == stateStatus ? _self.stateStatus : stateStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,
  ));
}


}

// dart format on
