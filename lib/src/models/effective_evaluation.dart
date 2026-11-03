import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version/version.dart';

import 'time_range.dart';
import 'version_range.dart';

part 'effective_evaluation.freezed.dart';

part 'effective_evaluation.g.dart';

@freezed
@JsonSerializable()
class const EffectiveEvaluation({final VersionRange? versionRange, final TimeRange? timeRange}) with _$EffectiveEvaluation {
  factory EffectiveEvaluation.fromJson(Map<String, dynamic> json) => _$EffectiveEvaluationFromJson(json);

  Map<String, dynamic> toJson() => _$EffectiveEvaluationToJson(this);

  bool evaluate({required Version appVersion, DateTime? targetTime}) {
    return (versionRange?.evaluate(appVersion: appVersion) ?? true) && (timeRange?.evaluate(targetDateTime: targetTime) ?? true);
  }

  @override
  String toString() {
    return 'EffectiveEvaluation\n-- $versionRange\n-- $timeRange';
  }
}
