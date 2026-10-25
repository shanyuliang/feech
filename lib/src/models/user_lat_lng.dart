import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_lat_lng.freezed.dart';

part 'user_lat_lng.g.dart';

@freezed
abstract class UserLatLng with _$UserLatLng {
  factory UserLatLng.fromJson(Map<String, dynamic> json) => _$UserLatLngFromJson(json);

  const factory UserLatLng({required double latitude, required double longitude}) = _UserLatLng;
}
