import 'package:freezed_annotation/freezed_annotation.dart';

import 'primary_color.dart';

part 'primary_color_category.freezed.dart';

@Freezed()
abstract class PrimaryColorCategory with _$PrimaryColorCategory {
  const factory PrimaryColorCategory({required final String name, final String? nameAlias, @Default([]) final List<PrimaryColor> colors}) =
      _PrimaryColorCategory;
}
