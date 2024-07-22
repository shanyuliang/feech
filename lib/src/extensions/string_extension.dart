import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/handy_util.dart';

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

  String asAssetGetVariantPathName({bool webUseBaseOnly = true}) {
    if (kIsWeb && webUseBaseOnly) {
      return this;
    } else {
      final variant = getVariant();
      final originalPathNameUri = parseAsUri()!;
      final originalPathSegments = originalPathNameUri.pathSegments.toList();
      final variantPathNameUri =
          originalPathNameUri.replace(pathSegments: originalPathSegments..insert(originalPathSegments.length - 1, variant));
      return variantPathNameUri.path;
    }
  }

  String asAssetGetFlavorPathName({bool webUseBaseOnly = true}) {
    if (kIsWeb && webUseBaseOnly) {
      return this;
    } else {
      if (appFlavor != null) {
        final originalPathNameUri = parseAsUri()!;
        final originalPathSegments = originalPathNameUri.pathSegments.toList();
        final flavorPathNameUri =
            originalPathNameUri.replace(pathSegments: originalPathSegments..insert(originalPathSegments.length - 1, appFlavor!));
        return flavorPathNameUri.path;
      } else {
        return this;
      }
    }
  }

  String asAssetGetBuildTypePathName({bool webUseBaseOnly = true}) {
    if (kIsWeb && webUseBaseOnly) {
      return this;
    } else {
      final buildType = getBuildType();
      final originalPathNameUri = parseAsUri()!;
      final originalPathSegments = originalPathNameUri.pathSegments.toList();
      final buildTypePathNameUri =
          originalPathNameUri.replace(pathSegments: originalPathSegments..insert(originalPathSegments.length - 1, buildType));
      return buildTypePathNameUri.path;
    }
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
