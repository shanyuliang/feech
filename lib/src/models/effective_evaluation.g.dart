// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effective_evaluation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EffectiveEvaluation _$EffectiveEvaluationFromJson(Map<String, dynamic> json) =>
    EffectiveEvaluation(
      versionRange: json['versionRange'] == null
          ? null
          : VersionRange.fromJson(json['versionRange'] as Map<String, dynamic>),
      timeRange: json['timeRange'] == null
          ? null
          : TimeRange.fromJson(json['timeRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EffectiveEvaluationToJson(
  EffectiveEvaluation instance,
) => <String, dynamic>{
  'versionRange': instance.versionRange,
  'timeRange': instance.timeRange,
};
