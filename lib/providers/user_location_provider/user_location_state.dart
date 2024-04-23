import 'package:freezed_annotation/freezed_annotation.dart';

import '../../support/state_status.dart';

part 'user_location_state.freezed.dart';
part 'user_location_state.g.dart';

@Freezed()
class UserLocationState with _$UserLocationState {
  const UserLocationState._();

  factory UserLocationState.fromJson(Map<String, dynamic> json) => _$UserLocationStateFromJson(json);

  const factory UserLocationState({
    final UserLatLng? lastKnownLocation,
    final UserLatLng? currentLocation,
    final Object? error,
    @Default(StateStatus.initial) final StateStatus stateStatus,
  }) = _UserLocationState;
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
