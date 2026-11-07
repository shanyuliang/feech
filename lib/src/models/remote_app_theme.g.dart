// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_app_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAppTheme _$RemoteAppThemeFromJson(Map<String, dynamic> json) =>
    RemoteAppTheme(
      name: json['name'] as String,
      effectiveEvaluation: json['effectiveEvaluation'] == null
          ? null
          : EffectiveEvaluation.fromJson(
              json['effectiveEvaluation'] as Map<String, dynamic>,
            ),
      fontFamily: json['fontFamily'] as String?,
    );

Map<String, dynamic> _$RemoteAppThemeToJson(RemoteAppTheme instance) =>
    <String, dynamic>{
      'name': instance.name,
      'effectiveEvaluation': instance.effectiveEvaluation,
      'fontFamily': instance.fontFamily,
    };
