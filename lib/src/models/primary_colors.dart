import 'package:freezed_annotation/freezed_annotation.dart';

import 'primary_color_culture.dart';

part 'primary_colors.freezed.dart';

@freezed
class const PrimaryColors({final List<PrimaryColorCulture> cultures = const []}) with _$PrimaryColors;
