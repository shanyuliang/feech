// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserLocation {

 UserLatLng? get lastKnownLocation; UserLatLng? get currentLocation; Object? get error; bool get isListeningLocationChange; StateStatus get stateStatus;
/// Create a copy of UserLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLocationCopyWith<UserLocation> get copyWith => _$UserLocationCopyWithImpl<UserLocation>(this as UserLocation, _$identity);

  /// Serializes this UserLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLocation&&(identical(other.lastKnownLocation, lastKnownLocation) || other.lastKnownLocation == lastKnownLocation)&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.isListeningLocationChange, isListeningLocationChange) || other.isListeningLocationChange == isListeningLocationChange)&&(identical(other.stateStatus, stateStatus) || other.stateStatus == stateStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastKnownLocation,currentLocation,const DeepCollectionEquality().hash(error),isListeningLocationChange,stateStatus);

@override
String toString() {
  return 'UserLocation(lastKnownLocation: $lastKnownLocation, currentLocation: $currentLocation, error: $error, isListeningLocationChange: $isListeningLocationChange, stateStatus: $stateStatus)';
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
  return _then(_self.copyWith(
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


/// @nodoc
@JsonSerializable()

class _UserLocation extends UserLocation {
  const _UserLocation({this.lastKnownLocation, this.currentLocation, this.error, this.isListeningLocationChange = false, this.stateStatus = StateStatus.initial}): super._();
  factory _UserLocation.fromJson(Map<String, dynamic> json) => _$UserLocationFromJson(json);

@override final  UserLatLng? lastKnownLocation;
@override final  UserLatLng? currentLocation;
@override final  Object? error;
@override@JsonKey() final  bool isListeningLocationChange;
@override@JsonKey() final  StateStatus stateStatus;

/// Create a copy of UserLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLocationCopyWith<_UserLocation> get copyWith => __$UserLocationCopyWithImpl<_UserLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLocation&&(identical(other.lastKnownLocation, lastKnownLocation) || other.lastKnownLocation == lastKnownLocation)&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.isListeningLocationChange, isListeningLocationChange) || other.isListeningLocationChange == isListeningLocationChange)&&(identical(other.stateStatus, stateStatus) || other.stateStatus == stateStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastKnownLocation,currentLocation,const DeepCollectionEquality().hash(error),isListeningLocationChange,stateStatus);

@override
String toString() {
  return 'UserLocation(lastKnownLocation: $lastKnownLocation, currentLocation: $currentLocation, error: $error, isListeningLocationChange: $isListeningLocationChange, stateStatus: $stateStatus)';
}


}

/// @nodoc
abstract mixin class _$UserLocationCopyWith<$Res> implements $UserLocationCopyWith<$Res> {
  factory _$UserLocationCopyWith(_UserLocation value, $Res Function(_UserLocation) _then) = __$UserLocationCopyWithImpl;
@override @useResult
$Res call({
 UserLatLng? lastKnownLocation, UserLatLng? currentLocation, Object? error, bool isListeningLocationChange, StateStatus stateStatus
});


@override $UserLatLngCopyWith<$Res>? get lastKnownLocation;@override $UserLatLngCopyWith<$Res>? get currentLocation;

}
/// @nodoc
class __$UserLocationCopyWithImpl<$Res>
    implements _$UserLocationCopyWith<$Res> {
  __$UserLocationCopyWithImpl(this._self, this._then);

  final _UserLocation _self;
  final $Res Function(_UserLocation) _then;

/// Create a copy of UserLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastKnownLocation = freezed,Object? currentLocation = freezed,Object? error = freezed,Object? isListeningLocationChange = null,Object? stateStatus = null,}) {
  return _then(_UserLocation(
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


/// @nodoc
mixin _$UserLatLng {

 double get latitude; double get longitude;
/// Create a copy of UserLatLng
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLatLngCopyWith<UserLatLng> get copyWith => _$UserLatLngCopyWithImpl<UserLatLng>(this as UserLatLng, _$identity);

  /// Serializes this UserLatLng to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLatLng&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'UserLatLng(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $UserLatLngCopyWith<$Res>  {
  factory $UserLatLngCopyWith(UserLatLng value, $Res Function(UserLatLng) _then) = _$UserLatLngCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class _$UserLatLngCopyWithImpl<$Res>
    implements $UserLatLngCopyWith<$Res> {
  _$UserLatLngCopyWithImpl(this._self, this._then);

  final UserLatLng _self;
  final $Res Function(UserLatLng) _then;

/// Create a copy of UserLatLng
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserLatLng extends UserLatLng {
  const _UserLatLng({required this.latitude, required this.longitude}): super._();
  factory _UserLatLng.fromJson(Map<String, dynamic> json) => _$UserLatLngFromJson(json);

@override final  double latitude;
@override final  double longitude;

/// Create a copy of UserLatLng
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLatLngCopyWith<_UserLatLng> get copyWith => __$UserLatLngCopyWithImpl<_UserLatLng>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserLatLngToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLatLng&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'UserLatLng(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$UserLatLngCopyWith<$Res> implements $UserLatLngCopyWith<$Res> {
  factory _$UserLatLngCopyWith(_UserLatLng value, $Res Function(_UserLatLng) _then) = __$UserLatLngCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class __$UserLatLngCopyWithImpl<$Res>
    implements _$UserLatLngCopyWith<$Res> {
  __$UserLatLngCopyWithImpl(this._self, this._then);

  final _UserLatLng _self;
  final $Res Function(_UserLatLng) _then;

/// Create a copy of UserLatLng
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(_UserLatLng(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
