import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../extensions/color_extension.dart';
import '../extensions/date_time_extension.dart';
import '../extensions/int_extension.dart';
import '../extensions/string_extension.dart';
import 'json_converter_ex.dart';

class DateTimeStringConverter extends JsonConverterEx<DateTime, String> {
  const DateTimeStringConverter();

  @override
  DateTime fromJson(String json) => json.parseAsDTODateTime();

  @override
  String toJson(DateTime object) => object.formatToDTOString();
}

class DateTimeStringConverterNullable extends JsonConverterEx<DateTime?, String?> {
  const DateTimeStringConverterNullable();

  @override
  DateTime? fromJson(String? json) => json?.parseAsDTODateTime();

  @override
  String? toJson(DateTime? object) => object?.formatToDTOString();
}

class DateTimeEpochConverter extends JsonConverterEx<DateTime, int> {
  final bool isUtc;

  const DateTimeEpochConverter({required this.isUtc});

  @override
  DateTime fromJson(int json) => json.parseAsDTODateTime(isUtc: isUtc);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}

class DateTimeEpochConverterNullable extends JsonConverterEx<DateTime?, int?> {
  final bool isUtc;

  const DateTimeEpochConverterNullable({required this.isUtc});

  @override
  DateTime? fromJson(int? json) => json?.parseAsDTODateTime(isUtc: isUtc);

  @override
  int? toJson(DateTime? object) => object?.millisecondsSinceEpoch;
}

class DateTimeTimestampConverter extends JsonConverterEx<DateTime, Timestamp> {
  const DateTimeTimestampConverter();

  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => object.toTimestamp();
}

class DateTimeTimestampConverterNullable extends JsonConverterEx<DateTime?, Timestamp?> {
  const DateTimeTimestampConverterNullable();

  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? object) => object?.toTimestamp();
}

class BoolIntConverter extends JsonConverterEx<bool, int> {
  const BoolIntConverter();

  @override
  bool fromJson(int json) => json == 1;

  @override
  int toJson(bool object) => object ? 1 : 0;
}

class ColorStringConverter extends JsonConverterEx<Color, String> {
  const ColorStringConverter();

  @override
  Color fromJson(String json) => json.parseAsHexColor();

  @override
  String toJson(Color object) => object.toHexString();
}
