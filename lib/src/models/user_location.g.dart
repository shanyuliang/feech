// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserLocation _$UserLocationFromJson(
  Map<String, dynamic> json,
) => _UserLocation(
  lastKnownLocation: json['lastKnownLocation'] == null
      ? null
      : UserLatLng.fromJson(json['lastKnownLocation'] as Map<String, dynamic>),
  currentLocation: json['currentLocation'] == null
      ? null
      : UserLatLng.fromJson(json['currentLocation'] as Map<String, dynamic>),
  error: json['error'],
  isListeningLocationChange:
      json['isListeningLocationChange'] as bool? ?? false,
  stateStatus:
      $enumDecodeNullable(_$StateStatusEnumMap, json['stateStatus']) ??
      StateStatus.initial,
);

Map<String, dynamic> _$UserLocationToJson(_UserLocation instance) =>
    <String, dynamic>{
      'lastKnownLocation': instance.lastKnownLocation,
      'currentLocation': instance.currentLocation,
      'error': instance.error,
      'isListeningLocationChange': instance.isListeningLocationChange,
      'stateStatus': _$StateStatusEnumMap[instance.stateStatus]!,
    };

const _$StateStatusEnumMap = {
  StateStatus.initial: 'initial',
  StateStatus.updating: 'updating',
  StateStatus.updated: 'updated',
  StateStatus.errorUpdating: 'errorUpdating',
};

_UserLatLng _$UserLatLngFromJson(Map<String, dynamic> json) => _UserLatLng(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
);

Map<String, dynamic> _$UserLatLngToJson(_UserLatLng instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
