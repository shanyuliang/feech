// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserLocation {


/// Create a copy of UserLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLocationCopyWith<UserLocation> get copyWith => _$UserLocationCopyWithImpl<UserLocation>(this as UserLocation, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UserLocation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLocation&&(identical(other.lastKnownLocation, _this.lastKnownLocation) || other.lastKnownLocation == _this.lastKnownLocation)&&(identical(other.currentLocation, _this.currentLocation) || other.currentLocation == _this.currentLocation)&&const DeepCollectionEquality().equals(other.error, _this.error)&&(identical(other.isListeningLocationChange, _this.isListeningLocationChange) || other.isListeningLocationChange == _this.isListeningLocationChange)&&(identical(other.stateStatus, _this.stateStatus) || other.stateStatus == _this.stateStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserLocation;
  return Object.hash(runtimeType,_this.lastKnownLocation,_this.currentLocation,const DeepCollectionEquality().hash(_this.error),_this.isListeningLocationChange,_this.stateStatus);
}

@override
String toString() {
  final _this = this as UserLocation;
  return 'UserLocation(lastKnownLocation: ${_this.lastKnownLocation}, currentLocation: ${_this.currentLocation}, error: ${_this.error}, isListeningLocationChange: ${_this.isListeningLocationChange}, stateStatus: ${_this.stateStatus})';
}


}

/// @nodoc
abstract mixin class $UserLocationCopyWith<$Res>  {
  factory $UserLocationCopyWith(UserLocation value, $Res Function(UserLocation) _then) = _$UserLocationCopyWithImpl;
@useResult
$Res call({
 UserLatLng? lastKnownLocation, UserLatLng? currentLocation, Object? error, bool isListeningLocationChange, StateStatus stateStatus
});


$UserLatLngCopyWith<$Res>? get lastKnownLocation;$UserLatLngCopyWith<$Res>? get currentLocation;

}
/// @nodoc
class _$UserLocationCopyWithImpl<$Res>
    implements $UserLocationCopyWith<$Res> {
  _$UserLocationCopyWithImpl(this._self, this._then);

  final UserLocation _self;
  final $Res Function(UserLocation) _then;

/// Create a copy of UserLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastKnownLocation = freezed,Object? currentLocation = freezed,Object? error = freezed,Object? isListeningLocationChange = null,Object? stateStatus = null,}) {
  return _then(UserLocation(
lastKnownLocation: freezed == lastKnownLocation ? _self.lastKnownLocation : lastKnownLocation // ignore: cast_nullable_to_non_nullable
as UserLatLng?,currentLocation: freezed == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as UserLatLng?,error: freezed == error ? _self.error : error ,isListeningLocationChange: null == isListeningLocationChange ? _self.isListeningLocationChange : isListeningLocationChange // ignore: cast_nullable_to_non_nullable
as bool,stateStatus: null == stateStatus ? _self.stateStatus : stateStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,
  ));
}
/// Create a copy of UserLocation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLatLngCopyWith<$Res>? get lastKnownLocation {
    if (_self.lastKnownLocation == null) {
    return null;
  }

  return $UserLatLngCopyWith<$Res>(_self.lastKnownLocation!, (value) {
    return _then(_self.copyWith(lastKnownLocation: value));
  });
}/// Create a copy of UserLocation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLatLngCopyWith<$Res>? get currentLocation {
    if (_self.currentLocation == null) {
    return null;
  }

  return $UserLatLngCopyWith<$Res>(_self.currentLocation!, (value) {
    return _then(_self.copyWith(currentLocation: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserLocation].
extension UserLocationPatterns on UserLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
