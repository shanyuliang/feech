import 'package:freezed_annotation/freezed_annotation.dart';

import 'primary_color.dart';

part 'primary_color_category.freezed.dart';

@Freezed()
abstract class PrimaryColorCategory with _$PrimaryColorCategory {
  const factory PrimaryColorCategory({required String name, String? nameAlias, @Default([]) List<PrimaryColor> colors}) =
      _PrimaryColorCategory;
}
