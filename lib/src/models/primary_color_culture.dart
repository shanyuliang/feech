import 'package:freezed_annotation/freezed_annotation.dart';

import 'primary_color_category.dart';

part 'primary_color_culture.freezed.dart';

@freezed
class const PrimaryColorCulture({required final String name, final String? nameAlias, final List<PrimaryColorCategory> categories = const []})
    with _$PrimaryColorCulture;
