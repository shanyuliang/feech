import 'package:freezed_annotation/freezed_annotation.dart';

import 'primary_color_category.dart';

part 'primary_color_culture.freezed.dart';

@Freezed()
abstract class PrimaryColorCulture with _$PrimaryColorCulture {
  const factory PrimaryColorCulture({required String name, String? nameAlias, @Default([]) List<PrimaryColorCategory> categories}) =
      _PrimaryColorCulture;
}
