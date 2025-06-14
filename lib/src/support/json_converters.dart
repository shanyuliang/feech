import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:version/version.dart';

import '../extensions/alignment_extension.dart';
import '../extensions/box_fit_extension.dart';
import '../extensions/color_extension.dart';
import '../extensions/date_time_extension.dart';
import '../extensions/int_extension.dart';
import '../extensions/string_extension.dart';
import '../models/timezone_mode.dart';
import 'json_converter_ex.dart';

class DateTimeDynamicConverter extends JsonConverterEx<DateTime, Object> {
  static final dummyDateTime = DateTime(1970, 1, 1, 0, 0, 0, 0, 0);
  final String? parsingOfFormat;
  final String? parsingWithTimezoneSuffix;
  final TimezoneMode parsingOutputTimezoneMode;

  const DateTimeDynamicConverter({this.parsingOfFormat, this.parsingWithTimezoneSuffix, this.parsingOutputTimezoneMode = TimezoneMode.auto});

  @override
  DateTime fromJson(Object json) {
    if (json is String) {
      return json.parseAsDTODateTime(
        ofFormat: parsingOfFormat,
        withTimezoneSuffix: parsingWithTimezoneSuffix,
        outputTimezoneMode: parsingOutputTimezoneMode,
      );
    } else if (json is int) {
      return DateTime.fromMillisecondsSinceEpoch(json, isUtc: parsingOutputTimezoneMode == TimezoneMode.utc);
    } else {
      return dummyDateTime;
    }
  }

  @override
  Object toJson(DateTime object) => object.formatToDTOString();

  const DateTimeDynamicConverter.auLocalInputLocalOutput()
    : this(parsingOfFormat: 'dd/MM/yyyy HH:mm:ss', parsingWithTimezoneSuffix: null, parsingOutputTimezoneMode: TimezoneMode.local);

  const DateTimeDynamicConverter.isoUtcInputLocalOutput()
    : this(parsingOfFormat: null, parsingWithTimezoneSuffix: 'Z', parsingOutputTimezoneMode: TimezoneMode.local);

  const DateTimeDynamicConverter.isoInputLocalOutput()
    : this(parsingOfFormat: null, parsingWithTimezoneSuffix: null, parsingOutputTimezoneMode: TimezoneMode.local);
}

class DateTimeDynamicConverterNullable extends JsonConverterEx<DateTime?, dynamic> {
  final String? parsingOfFormat;
  final String? parsingWithTimezoneSuffix;
  final TimezoneMode parsingOutputTimezoneMode;

  const DateTimeDynamicConverterNullable({this.parsingOfFormat, this.parsingWithTimezoneSuffix, this.parsingOutputTimezoneMode = TimezoneMode.auto});

  @override
  DateTime? fromJson(dynamic json) {
    if (json != null) {
      if (json is String) {
        return json.parseAsDTODateTime(
          ofFormat: parsingOfFormat,
          withTimezoneSuffix: parsingWithTimezoneSuffix,
          outputTimezoneMode: parsingOutputTimezoneMode,
        );
      } else if (json is int) {
        return DateTime.fromMillisecondsSinceEpoch(json, isUtc: parsingOutputTimezoneMode == TimezoneMode.utc);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  dynamic toJson(DateTime? object) => object?.formatToDTOString();

  const DateTimeDynamicConverterNullable.auLocalInputLocalOutput()
    : this(parsingOfFormat: 'dd/MM/yyyy HH:mm:ss', parsingWithTimezoneSuffix: null, parsingOutputTimezoneMode: TimezoneMode.local);

  const DateTimeDynamicConverterNullable.isoUtcInputLocalOutput()
    : this(parsingOfFormat: null, parsingWithTimezoneSuffix: 'Z', parsingOutputTimezoneMode: TimezoneMode.local);

  const DateTimeDynamicConverterNullable.isoInputLocalOutput()
    : this(parsingOfFormat: null, parsingWithTimezoneSuffix: null, parsingOutputTimezoneMode: TimezoneMode.local);
}

class DateTimeStringConverter extends JsonConverterEx<DateTime, String> {
  final String? parsingOfFormat;
  final String? parsingWithTimezoneSuffix;
  final TimezoneMode parsingOutputTimezoneMode;

  const DateTimeStringConverter({this.parsingOfFormat, this.parsingWithTimezoneSuffix, this.parsingOutputTimezoneMode = TimezoneMode.auto});

  @override
  DateTime fromJson(String json) => json.parseAsDTODateTime(
    ofFormat: parsingOfFormat,
    withTimezoneSuffix: parsingWithTimezoneSuffix,
    outputTimezoneMode: parsingOutputTimezoneMode,
  );

  @override
  String toJson(DateTime object) => object.formatToDTOString();
}

class DateTimeStringConverterNullable extends JsonConverterEx<DateTime?, String?> {
  final String? parsingOfFormat;
  final String? parsingWithTimezoneSuffix;
  final TimezoneMode parsingOutputTimezoneMode;

  const DateTimeStringConverterNullable({this.parsingOfFormat, this.parsingWithTimezoneSuffix, this.parsingOutputTimezoneMode = TimezoneMode.auto});

  @override
  DateTime? fromJson(String? json) => json?.parseAsDTODateTime(
    ofFormat: parsingOfFormat,
    withTimezoneSuffix: parsingWithTimezoneSuffix,
    outputTimezoneMode: parsingOutputTimezoneMode,
  );

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

class LatLngConverter extends JsonConverterEx<LatLng, List<double>> {
  const LatLngConverter();

  @override
  LatLng fromJson(List<double> json) {
    return LatLng(json[0], json[1]);
  }

  @override
  List<double> toJson(LatLng object) => [object.latitude, object.longitude];
}

class LatLngListConverterNullable extends JsonConverterEx<List<LatLng>?, List<List<double>>?> {
  const LatLngListConverterNullable();

  @override
  List<LatLng>? fromJson(List<List<double>>? json) {
    if (json != null) {
      return json.map((e) => LatLng(e[0], e[1])).toList();
    } else {
      return null;
    }
  }

  @override
  List<List<double>>? toJson(List<LatLng>? object) => object?.map((e) => [e.latitude, e.longitude]).toList();
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
  Color fromJson(String json) => json.parseAsHexARGBColor();

  @override
  String toJson(Color object) => object.toHexARGBString();
}

class AlignmentStringConverter extends JsonConverterEx<Alignment, String> {
  const AlignmentStringConverter();

  @override
  Alignment fromJson(String json) => json.parseAsAlignment();

  @override
  String toJson(Alignment object) => object.toShortString();
}

class BoxFitStringConverter extends JsonConverterEx<BoxFit, String> {
  const BoxFitStringConverter();

  @override
  BoxFit fromJson(String json) => json.parseAsBoxFit();

  @override
  String toJson(BoxFit object) => object.toShortString();
}

class VersionConverter extends JsonConverterEx<Version, String> {
  const VersionConverter();

  @override
  Version fromJson(String json) => json.parseAsVersion();

  @override
  String toJson(Version object) => object.toString();
}

class VersionConverterNullable extends JsonConverterEx<Version?, String?> {
  const VersionConverterNullable();

  @override
  Version? fromJson(String? json) => json?.parseAsVersion();

  @override
  String? toJson(Version? object) => object?.toString();
}
