import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../support/json_converters.dart';

part 'primary_color.freezed.dart';

@freezed
class const PrimaryColor({@ColorStringConverter() required final Color color, final String? id, final String? name, final String? nameAlias})
    with _$PrimaryColor;
