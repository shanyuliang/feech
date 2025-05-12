import 'package:freezed_annotation/freezed_annotation.dart';

import '../support/state_status.dart';

part 'user_location.freezed.dart';
part 'user_location.g.dart';

@Freezed()
abstract class UserLocation with _$UserLocation {
  factory UserLocation.fromJson(Map<String, dynamic> json) => _$UserLocationFromJson(json);

  const factory UserLocation({
    final UserLatLng? lastKnownLocation,
    final UserLatLng? currentLocation,
    final Object? error,
    @Default(false) final bool isListeningLocationChange,
    @Default(StateStatus.initial) final StateStatus stateStatus,
  }) = _UserLocation;
}

@Freezed()
abstract class UserLatLng with _$UserLatLng {
  factory UserLatLng.fromJson(Map<String, dynamic> json) => _$UserLatLngFromJson(json);

  const factory UserLatLng({required final double latitude, required final double longitude}) = _UserLatLng;
}
