// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_themes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteThemes _$RemoteThemesFromJson(Map<String, dynamic> json) => RemoteThemes(
  schemeVersion: (json['schemeVersion'] as num?)?.toInt() ?? 0,
  dataVersion: (json['dataVersion'] as num?)?.toInt() ?? 0,
  appThemes: (json['appThemes'] as List<dynamic>?)
      ?.map((e) => RemoteAppTheme.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RemoteThemesToJson(RemoteThemes instance) =>
    <String, dynamic>{
      'schemeVersion': instance.schemeVersion,
      'dataVersion': instance.dataVersion,
      'appThemes': instance.appThemes,
    };
