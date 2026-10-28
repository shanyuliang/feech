import 'package:freezed_annotation/freezed_annotation.dart';

import '../support/state_status.dart';
import 'user_lat_lng.dart';

part 'user_location.freezed.dart';

part 'user_location.g.dart';

@freezed
@JsonSerializable()
class const UserLocation({
  final UserLatLng? lastKnownLocation,
  final UserLatLng? currentLocation,
  final Object? error,
  final bool isListeningLocationChange = false,
  final StateStatus stateStatus = StateStatus.initial,
}) with _$UserLocation {
  factory UserLocation.fromJson(Map<String, dynamic> json) => _$UserLocationFromJson(json);

  Map<String, dynamic> toJson() => _$UserLocationToJson(this);
}
