import 'dart:ui';

extension LocaleExtension on Locale {
  String getLocaleName() {
    if (countryCode != null) {
      return "${languageCode}_$countryCode";
    } else {
      return languageCode;
    }
  }
}
