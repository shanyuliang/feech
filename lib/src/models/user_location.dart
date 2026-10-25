import 'package:freezed_annotation/freezed_annotation.dart';

import '../support/state_status.dart';
import 'user_lat_lng.dart';

part 'user_location.freezed.dart';
part 'user_location.g.dart';

@freezed
abstract class UserLocation with _$UserLocation {
  factory UserLocation.fromJson(Map<String, dynamic> json) => _$UserLocationFromJson(json);

  const factory UserLocation({
    UserLatLng? lastKnownLocation,
    UserLatLng? currentLocation,
    Object? error,
    @Default(false) bool isListeningLocationChange,
    @Default(StateStatus.initial) StateStatus stateStatus,
  }) = _UserLocation;
}
