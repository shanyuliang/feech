import 'package:freezed_annotation/freezed_annotation.dart';

import '../../support/state_status.dart';

part 'user_location.freezed.dart';
part 'user_location.g.dart';

@Freezed()
class UserLocation with _$UserLocation {
  const UserLocation._();

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
class UserLatLng with _$UserLatLng {
  const UserLatLng._();

  factory UserLatLng.fromJson(Map<String, dynamic> json) => _$UserLatLngFromJson(json);

  const factory UserLatLng({
    required final double latitude,
    required final double longitude,
  }) = _UserLatLng;
}
