import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/handy_util.dart';
import 'locale_extension.dart';
import 'uri_extension.dart';

extension StringExtension on String {
  static final whitespacesRegExp = RegExp(r"\s+");
  static final leftRightSingleQuoteRegExp = RegExp(r"[\u2018\u2019]");

  Uint8List asHexConvertToUint8List() {
    if (length % 2 != 0) {
      throw 'Odd number of hex digits';
    }
    final l = length ~/ 2;
    final result = Uint8List(l);
    for (var i = 0; i < l; ++i) {
      var x = int.parse(substring(2 * i, 2 * (i + 1)), radix: 16);
      if (x.isNaN) {
        throw 'Expected hex string';
      }
      result[i] = x;
    }
    return result;
  }

  /// This function convert a base asset name to a candidate asset name list
  /// For example:
  /// "assets/images/volvo.png"
  /// could be converted to
  /// "assets/images/paidDebug/zh_CN/volvo.png" and "assets/images/zh_CN/volvo.png"
  /// This function only generate the asset name. It doesn't check the existence of the asset.
  List<String> asAssetGetCandidates() {
    final originalPathNameUri = parseAsUri()!;
    final variant = getVariant();
    final buildType = getBuildType();
    final locale = PlatformDispatcher.instance.locale;
    final localeName = locale.getLocaleName();
    final languageCode = locale.languageCode;
    final candidates = <String>[];
    candidates.add(originalPathNameUri
        .insertLastPathSegment(insertedPathSegment: variant)
        .insertLastPathSegment(insertedPathSegment: localeName)
        .path);
    candidates.add(originalPathNameUri
        .insertLastPathSegment(insertedPathSegment: variant)
        .insertLastPathSegment(insertedPathSegment: languageCode)
        .path);
    candidates.add(originalPathNameUri.insertLastPathSegment(insertedPathSegment: variant).path);
    candidates.add(originalPathNameUri
        .insertLastPathSegment(insertedPathSegment: appFlavor)
        .insertLastPathSegment(insertedPathSegment: localeName)
        .path);
    candidates.add(originalPathNameUri
        .insertLastPathSegment(insertedPathSegment: appFlavor)
        .insertLastPathSegment(insertedPathSegment: languageCode)
        .path);
    candidates.add(originalPathNameUri.insertLastPathSegment(insertedPathSegment: appFlavor).path);
    candidates.add(originalPathNameUri
        .insertLastPathSegment(insertedPathSegment: buildType)
        .insertLastPathSegment(insertedPathSegment: localeName)
        .path);
    candidates.add(originalPathNameUri
        .insertLastPathSegment(insertedPathSegment: buildType)
        .insertLastPathSegment(insertedPathSegment: languageCode)
        .path);
    candidates.add(originalPathNameUri.insertLastPathSegment(insertedPathSegment: buildType).path);
    candidates.add(originalPathNameUri.insertLastPathSegment(insertedPathSegment: localeName).path);
    candidates.add(originalPathNameUri.insertLastPathSegment(insertedPathSegment: languageCode).path);
    candidates.add(this);
    return candidates;
  }

  String asNameGetInitials({int? maxResultLength}) {
    final nameParts = trim().split(whitespacesRegExp);
    final initials = nameParts.fold('', (previousValue, element) => '$previousValue${element.isNotEmpty ? element[0] : ''}');
    if (initials.length > (maxResultLength ?? 3)) {
      return initials.substring(0, maxResultLength).toUpperCase();
    } else {
      return initials.toUpperCase();
    }
  }

  Color parseAsHexColor() {
    return Color(int.parse(replaceFirst("#", ""), radix: 16));
  }

  Color mapToPrimaryColor() {
    final colorIndex = hashCode % Colors.primaries.length;
    return Colors.primaries[colorIndex];
  }

  Color mapToHSLColor(double saturation, double lightness) {
    final hue = (hashCode % 360).toDouble();
    final hslColor = HSLColor.fromAHSL(1.0, hue, saturation, lightness);
    return hslColor.toColor();
  }

  DateTime parseAsDTODateTime() => DateTime.parse(this);

  /// Trim leading and trailing spaces and also replace multiple whitespaces to single whitespace
  String superTrim() => trim().replaceAll(whitespacesRegExp, ' ');

  /// Replace left/right single quote with strait single quote
  String normalizeSingleQuotes() => replaceAll(leftRightSingleQuoteRegExp, "'");

  String interpolate(List<String> params) {
    String result = this;
    for (int i = 0; i < params.length; i++) {
      result = result.replaceAll('%${i + 1}\$s', params[i]);
    }
    return result;
  }

  String capitalizeEachWord() {
    if (length <= 1) {
      return toUpperCase();
    }
    final words = split(' ');
    final capitalized = words.map((final word) {
      final first = word.substring(0, 1).toUpperCase();
      final rest = word.substring(1);

      return '$first$rest';
    });

    return capitalized.join(' ');
  }

  Uri? parseAsUri() {
    try {
      return Uri.parse(this);
    } catch (ex) {
      return null;
    }
  }

  Alignment parseAsAlignment() {
    return switch (toUpperCase()) {
      "CENTERLEFT" => Alignment.centerLeft,
      "CENTER" => Alignment.center,
      "CENTERRIGHT" => Alignment.centerRight,
      "TOPLEFT" => Alignment.topLeft,
      "TOPCENTER" => Alignment.topCenter,
      "TOPRIGHT" => Alignment.topRight,
      "BOTTOMLEFT" => Alignment.bottomLeft,
      "BOTTOMCENTER" => Alignment.bottomCenter,
      "BOTTOMRIGHT" => Alignment.bottomRight,
      _ => Alignment.center,
    };
  }
}

extension StringNullableExtension on String? {
  bool isNullOrEmpty() {
    final self = this;
    if (self == null) {
      return true;
    } else {
      return self.isEmpty;
    }
  }

  bool isNotNullAndNotEmpty() {
    final self = this;
    if (self == null) {
      return false;
    } else {
      return self.isNotEmpty;
    }
  }
}
