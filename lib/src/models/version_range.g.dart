// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionRange _$VersionRangeFromJson(Map<String, dynamic> json) => VersionRange(
  from: const VersionConverterNullable().fromJson(json['from'] as String?),
  to: const VersionConverterNullable().fromJson(json['to'] as String?),
);

Map<String, dynamic> _$VersionRangeToJson(VersionRange instance) =>
    <String, dynamic>{
      'from': const VersionConverterNullable().toJson(instance.from),
      'to': const VersionConverterNullable().toJson(instance.to),
    };
