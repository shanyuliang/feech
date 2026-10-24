import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_lat_lng.freezed.dart';
part 'user_lat_lng.g.dart';

@freezed
class const UserLatLng({required final double latitude, required final double longitude}) with _$UserLatLng {
  factory UserLatLng.fromJson(Map<String, dynamic> json) => _$UserLatLngFromJson(json);
}
