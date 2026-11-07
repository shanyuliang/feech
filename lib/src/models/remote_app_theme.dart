import 'package:freezed_annotation/freezed_annotation.dart';

import 'effective_evaluation.dart';
import 'remote_color_scheme.dart';

part 'remote_app_theme.freezed.dart';

part 'remote_app_theme.g.dart';

@freezed
@JsonSerializable()
abstract class RemoteAppTheme({
  required final String name,
  final EffectiveEvaluation? effectiveEvaluation,
  final RemoteColorScheme? lightColorScheme,
  final RemoteColorScheme? darkColorScheme,
  final String? fontFamily,
}) with _$RemoteAppTheme {
  factory RemoteAppTheme.fromJson(Map<String, dynamic> json) => _$RemoteAppThemeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAppThemeToJson(this);
}
