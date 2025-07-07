// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [CameraMeta].
extension CameraMetaPatterns on CameraMeta {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CameraMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CameraMeta() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CameraMeta value)  $default,){
final _that = this;
switch (_that) {
case _CameraMeta():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CameraMeta value)?  $default,){
final _that = this;
switch (_that) {
case _CameraMeta() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CameraDescription>? cameraDescriptions,  CameraDescription? selectedCameraDescription,  CameraController? selectedCameraController,  String? imagePath,  StateStatus stateStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CameraMeta() when $default != null:
return $default(_that.cameraDescriptions,_that.selectedCameraDescription,_that.selectedCameraController,_that.imagePath,_that.stateStatus);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CameraDescription>? cameraDescriptions,  CameraDescription? selectedCameraDescription,  CameraController? selectedCameraController,  String? imagePath,  StateStatus stateStatus)  $default,) {final _that = this;
switch (_that) {
case _CameraMeta():
return $default(_that.cameraDescriptions,_that.selectedCameraDescription,_that.selectedCameraController,_that.imagePath,_that.stateStatus);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CameraDescription>? cameraDescriptions,  CameraDescription? selectedCameraDescription,  CameraController? selectedCameraController,  String? imagePath,  StateStatus stateStatus)?  $default,) {final _that = this;
switch (_that) {
case _CameraMeta() when $default != null:
return $default(_that.cameraDescriptions,_that.selectedCameraDescription,_that.selectedCameraController,_that.imagePath,_that.stateStatus);case _:
  return null;

}
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
