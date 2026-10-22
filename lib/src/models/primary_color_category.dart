import 'package:freezed_annotation/freezed_annotation.dart';

import 'primary_color.dart';

part 'primary_color_category.freezed.dart';

@freezed
class const PrimaryColorCategory({required final String name, final String? nameAlias, final List<PrimaryColor> colors = const []})
    with _$PrimaryColorCategory;
