// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeRange _$TimeRangeFromJson(Map<String, dynamic> json) => TimeRange(
  from: const DateTimeStringConverterNullable().fromJson(
    json['from'] as String?,
  ),
  to: const DateTimeStringConverterNullable().fromJson(json['to'] as String?),
);

Map<String, dynamic> _$TimeRangeToJson(TimeRange instance) => <String, dynamic>{
  'from': const DateTimeStringConverterNullable().toJson(instance.from),
  'to': const DateTimeStringConverterNullable().toJson(instance.to),
};
