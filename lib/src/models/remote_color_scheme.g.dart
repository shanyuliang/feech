// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_color_scheme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteColorScheme _$RemoteColorSchemeFromJson(Map<String, dynamic> json) =>
    RemoteColorScheme(
      name: json['name'] as String,
      effectiveEvaluation: json['effectiveEvaluation'] == null
          ? null
          : EffectiveEvaluation.fromJson(
              json['effectiveEvaluation'] as Map<String, dynamic>,
            ),
      fontFamily: json['fontFamily'] as String?,
    );

Map<String, dynamic> _$RemoteColorSchemeToJson(RemoteColorScheme instance) =>
    <String, dynamic>{
      'name': instance.name,
      'effectiveEvaluation': instance.effectiveEvaluation,
      'fontFamily': instance.fontFamily,
    };
