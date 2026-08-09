import 'package:freezed_annotation/freezed_annotation.dart';

import 'primary_color_category.dart';

part 'primary_color_culture.freezed.dart';

@Freezed()
abstract class PrimaryColorCulture with _$PrimaryColorCulture {
  const factory PrimaryColorCulture({required final String name, final String? nameAlias, @Default([]) final List<PrimaryColorCategory> categories}) =
      _PrimaryColorCulture;
}
