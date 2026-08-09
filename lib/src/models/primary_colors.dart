import 'package:freezed_annotation/freezed_annotation.dart';

import 'primary_color_culture.dart';

part 'primary_colors.freezed.dart';

@Freezed()
abstract class PrimaryColors with _$PrimaryColors {
  const factory PrimaryColors({@Default([]) final List<PrimaryColorCulture> cultures}) = _PrimaryColors;
}
