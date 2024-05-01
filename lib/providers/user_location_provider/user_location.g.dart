// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLocationImpl _$$UserLocationImplFromJson(Map<String, dynamic> json) =>
    _$UserLocationImpl(
      lastKnownLocation: json['lastKnownLocation'] == null
          ? null
          : UserLatLng.fromJson(
              json['lastKnownLocation'] as Map<String, dynamic>),
      currentLocation: json['currentLocation'] == null
          ? null
          : UserLatLng.fromJson(
              json['currentLocation'] as Map<String, dynamic>),
      error: json['error'],
      isListeningLocationChange:
          json['isListeningLocationChange'] as bool? ?? false,
      stateStatus:
          $enumDecodeNullable(_$StateStatusEnumMap, json['stateStatus']) ??
              StateStatus.initial,
    );

Map<String, dynamic> _$$UserLocationImplToJson(_$UserLocationImpl instance) =>
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

_$UserLatLngImpl _$$UserLatLngImplFromJson(Map<String, dynamic> json) =>
    _$UserLatLngImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$UserLatLngImplToJson(_$UserLatLngImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
