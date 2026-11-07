// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_color_scheme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteColorScheme _$RemoteColorSchemeFromJson(
  Map<String, dynamic> json,
) => RemoteColorScheme(
  brightness: json['brightness'] == null
      ? Brightness.light
      : const BrightnessStringConverter().fromJson(
          json['brightness'] as String,
        ),
  primary: const ColorStringConverter().fromJson(json['primary'] as String),
  onPrimary: const ColorStringConverter().fromJson(json['onPrimary'] as String),
  secondary: const ColorStringConverter().fromJson(json['secondary'] as String),
  onSecondary: const ColorStringConverter().fromJson(
    json['onSecondary'] as String,
  ),
  surface: const ColorStringConverter().fromJson(json['surface'] as String),
  onSurface: const ColorStringConverter().fromJson(json['onSurface'] as String),
  error: const ColorStringConverter().fromJson(json['error'] as String),
  onError: const ColorStringConverter().fromJson(json['onError'] as String),
);

Map<String, dynamic> _$RemoteColorSchemeToJson(
  RemoteColorScheme instance,
) => <String, dynamic>{
  'brightness': const BrightnessStringConverter().toJson(instance.brightness),
  'primary': const ColorStringConverter().toJson(instance.primary),
  'onPrimary': const ColorStringConverter().toJson(instance.onPrimary),
  'secondary': const ColorStringConverter().toJson(instance.secondary),
  'onSecondary': const ColorStringConverter().toJson(instance.onSecondary),
  'surface': const ColorStringConverter().toJson(instance.surface),
  'onSurface': const ColorStringConverter().toJson(instance.onSurface),
  'error': const ColorStringConverter().toJson(instance.error),
  'onError': const ColorStringConverter().toJson(instance.onError),
};
