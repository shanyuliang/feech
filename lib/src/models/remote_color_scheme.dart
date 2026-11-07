import 'package:freezed_annotation/freezed_annotation.dart';

import 'effective_evaluation.dart';

part 'remote_color_scheme.freezed.dart';

part 'remote_color_scheme.g.dart';

@freezed
@JsonSerializable()
abstract class RemoteColorScheme({required final String name, final EffectiveEvaluation? effectiveEvaluation, final String? fontFamily})
    with _$RemoteColorScheme {
  factory RemoteColorScheme.fromJson(Map<String, dynamic> json) => _$RemoteColorSchemeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteColorSchemeToJson(this);
}
