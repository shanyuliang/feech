import 'dart:io';

import 'uint8list_extension.dart';

extension X509CertificateExtension on X509Certificate {
  bool validateSpkiPin(List<String>? validPins) {
    if (validPins != null && validPins.isNotEmpty) {
      final spkiPin = der.asCertificateDerGetSpkiPin();
      return validPins.contains(spkiPin);
    } else {
      return true;
    }
  }
}
