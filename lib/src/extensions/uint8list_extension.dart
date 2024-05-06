import 'dart:convert';

import 'package:asn1lib/asn1lib.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';

import 'general_type_extension.dart';

extension Uint8ListExtension on Uint8List {
  String? asCertificateDerGetSpkiPin() {
    try {
      final foundSpki = _getSpki(this);
      return foundSpki?.let((it) => _getSpkiPin(it));
    } catch (ex) {
      debugPrint(ex.toString());
      return null;
    }
  }

  ASN1Sequence? _getSpki(Uint8List theCertificateDer) {
    final theASN1Parser = ASN1Parser(theCertificateDer);
    if (theASN1Parser.hasNext()) {
      final theASN1Object = theASN1Parser.nextObject();

      /// https://www.rfc-editor.org/rfc/rfc3280#section-4.1
      return ((theASN1Object as ASN1Sequence).elements[0] as ASN1Sequence).elements[6] as ASN1Sequence;
    }
    return null;
  }

  String _getSpkiPin(ASN1Sequence spkiObject) {
    final spkiDigest = sha256.convert(spkiObject.encodedBytes.toList());
    return base64.encode(spkiDigest.bytes);
  }
}
