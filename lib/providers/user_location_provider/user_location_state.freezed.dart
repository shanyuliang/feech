// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLocationState _$UserLocationStateFromJson(Map<String, dynamic> json) {
  return _UserLocationState.fromJson(json);
}

/// @nodoc
mixin _$UserLocationState {
  UserLatLng? get lastKnownLocation => throw _privateConstructorUsedError;
  UserLatLng? get currentLocation => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  bool get isListeningLocationChange => throw _privateConstructorUsedError;
  StateStatus get stateStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLocationStateCopyWith<UserLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLocationStateCopyWith<$Res> {
  factory $UserLocationStateCopyWith(
          UserLocationState value, $Res Function(UserLocationState) then) =
      _$UserLocationStateCopyWithImpl<$Res, UserLocationState>;
  @useResult
  $Res call(
      {UserLatLng? lastKnownLocation,
      UserLatLng? currentLocation,
      Object? error,
      bool isListeningLocationChange,
      StateStatus stateStatus});

  $UserLatLngCopyWith<$Res>? get lastKnownLocation;
  $UserLatLngCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class _$UserLocationStateCopyWithImpl<$Res, $Val extends UserLocationState>
    implements $UserLocationStateCopyWith<$Res> {
  _$UserLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastKnownLocation = freezed,
    Object? currentLocation = freezed,
    Object? error = freezed,
    Object? isListeningLocationChange = null,
    Object? stateStatus = null,
  }) {
    return _then(_value.copyWith(
      lastKnownLocation: freezed == lastKnownLocation
          ? _value.lastKnownLocation
          : lastKnownLocation // ignore: cast_nullable_to_non_nullable
              as UserLatLng?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as UserLatLng?,
      error: freezed == error ? _value.error : error,
      isListeningLocationChange: null == isListeningLocationChange
          ? _value.isListeningLocationChange
          : isListeningLocationChange // ignore: cast_nullable_to_non_nullable
              as bool,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserLatLngCopyWith<$Res>? get lastKnownLocation {
    if (_value.lastKnownLocation == null) {
      return null;
    }

    return $UserLatLngCopyWith<$Res>(_value.lastKnownLocation!, (value) {
      return _then(_value.copyWith(lastKnownLocation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserLatLngCopyWith<$Res>? get currentLocation {
    if (_value.currentLocation == null) {
      return null;
    }

    return $UserLatLngCopyWith<$Res>(_value.currentLocation!, (value) {
      return _then(_value.copyWith(currentLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserLocationStateImplCopyWith<$Res>
    implements $UserLocationStateCopyWith<$Res> {
  factory _$$UserLocationStateImplCopyWith(_$UserLocationStateImpl value,
          $Res Function(_$UserLocationStateImpl) then) =
      __$$UserLocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserLatLng? lastKnownLocation,
      UserLatLng? currentLocation,
      Object? error,
      bool isListeningLocationChange,
      StateStatus stateStatus});

  @override
  $UserLatLngCopyWith<$Res>? get lastKnownLocation;
  @override
  $UserLatLngCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class __$$UserLocationStateImplCopyWithImpl<$Res>
    extends _$UserLocationStateCopyWithImpl<$Res, _$UserLocationStateImpl>
    implements _$$UserLocationStateImplCopyWith<$Res> {
  __$$UserLocationStateImplCopyWithImpl(_$UserLocationStateImpl _value,
      $Res Function(_$UserLocationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastKnownLocation = freezed,
    Object? currentLocation = freezed,
    Object? error = freezed,
    Object? isListeningLocationChange = null,
    Object? stateStatus = null,
  }) {
    return _then(_$UserLocationStateImpl(
      lastKnownLocation: freezed == lastKnownLocation
          ? _value.lastKnownLocation
          : lastKnownLocation // ignore: cast_nullable_to_non_nullable
              as UserLatLng?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as UserLatLng?,
      error: freezed == error ? _value.error : error,
      isListeningLocationChange: null == isListeningLocationChange
          ? _value.isListeningLocationChange
          : isListeningLocationChange // ignore: cast_nullable_to_non_nullable
              as bool,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLocationStateImpl extends _UserLocationState {
  const _$UserLocationStateImpl(
      {this.lastKnownLocation,
      this.currentLocation,
      this.error,
      this.isListeningLocationChange = false,
      this.stateStatus = StateStatus.initial})
      : super._();

  factory _$UserLocationStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLocationStateImplFromJson(json);

  @override
  final UserLatLng? lastKnownLocation;
  @override
  final UserLatLng? currentLocation;
  @override
  final Object? error;
  @override
  @JsonKey()
  final bool isListeningLocationChange;
  @override
  @JsonKey()
  final StateStatus stateStatus;

  @override
  String toString() {
    return 'UserLocationState(lastKnownLocation: $lastKnownLocation, currentLocation: $currentLocation, error: $error, isListeningLocationChange: $isListeningLocationChange, stateStatus: $stateStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLocationStateImpl &&
            (identical(other.lastKnownLocation, lastKnownLocation) ||
                other.lastKnownLocation == lastKnownLocation) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.isListeningLocationChange,
                    isListeningLocationChange) ||
                other.isListeningLocationChange == isListeningLocationChange) &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lastKnownLocation,
      currentLocation,
      const DeepCollectionEquality().hash(error),
      isListeningLocationChange,
      stateStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLocationStateImplCopyWith<_$UserLocationStateImpl> get copyWith =>
      __$$UserLocationStateImplCopyWithImpl<_$UserLocationStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLocationStateImplToJson(
      this,
    );
  }
}

abstract class _UserLocationState extends UserLocationState {
  const factory _UserLocationState(
      {final UserLatLng? lastKnownLocation,
      final UserLatLng? currentLocation,
      final Object? error,
      final bool isListeningLocationChange,
      final StateStatus stateStatus}) = _$UserLocationStateImpl;
  const _UserLocationState._() : super._();

  factory _UserLocationState.fromJson(Map<String, dynamic> json) =
      _$UserLocationStateImpl.fromJson;

  @override
  UserLatLng? get lastKnownLocation;
  @override
  UserLatLng? get currentLocation;
  @override
  Object? get error;
  @override
  bool get isListeningLocationChange;
  @override
  StateStatus get stateStatus;
  @override
  @JsonKey(ignore: true)
  _$$UserLocationStateImplCopyWith<_$UserLocationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserLatLng _$UserLatLngFromJson(Map<String, dynamic> json) {
  return _UserLatLng.fromJson(json);
}

/// @nodoc
mixin _$UserLatLng {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLatLngCopyWith<UserLatLng> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLatLngCopyWith<$Res> {
  factory $UserLatLngCopyWith(
          UserLatLng value, $Res Function(UserLatLng) then) =
      _$UserLatLngCopyWithImpl<$Res, UserLatLng>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$UserLatLngCopyWithImpl<$Res, $Val extends UserLatLng>
    implements $UserLatLngCopyWith<$Res> {
  _$UserLatLngCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLatLngImplCopyWith<$Res>
    implements $UserLatLngCopyWith<$Res> {
  factory _$$UserLatLngImplCopyWith(
          _$UserLatLngImpl value, $Res Function(_$UserLatLngImpl) then) =
      __$$UserLatLngImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$UserLatLngImplCopyWithImpl<$Res>
    extends _$UserLatLngCopyWithImpl<$Res, _$UserLatLngImpl>
    implements _$$UserLatLngImplCopyWith<$Res> {
  __$$UserLatLngImplCopyWithImpl(
      _$UserLatLngImpl _value, $Res Function(_$UserLatLngImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$UserLatLngImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLatLngImpl extends _UserLatLng {
  const _$UserLatLngImpl({required this.latitude, required this.longitude})
      : super._();

  factory _$UserLatLngImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLatLngImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'UserLatLng(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLatLngImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLatLngImplCopyWith<_$UserLatLngImpl> get copyWith =>
      __$$UserLatLngImplCopyWithImpl<_$UserLatLngImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLatLngImplToJson(
      this,
    );
  }
}

abstract class _UserLatLng extends UserLatLng {
  const factory _UserLatLng(
      {required final double latitude,
      required final double longitude}) = _$UserLatLngImpl;
  const _UserLatLng._() : super._();

  factory _UserLatLng.fromJson(Map<String, dynamic> json) =
      _$UserLatLngImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$UserLatLngImplCopyWith<_$UserLatLngImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
