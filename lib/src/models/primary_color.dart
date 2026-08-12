import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../support/json_converters.dart';

part 'primary_color.freezed.dart';

@Freezed()
abstract class PrimaryColor with _$PrimaryColor {
  const factory PrimaryColor({@ColorStringConverter() required Color color, String? id, String? name, String? nameAlias}) =
      _PrimaryColor;
}
