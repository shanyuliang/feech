import 'dart:io';

import '../extensions/string_extension.dart';
import '../extensions/uint8list_extension.dart';
import 'handy_util.dart';

Future<String?> checkSpkiPin(String url) async {
  return suppressThrowableAsync(throwable: () async {
    final httpClient = HttpClient();
    final request = await httpClient.headUrl(url.parseAsUri()!);
    final response = await request.close();
    final certificate = response.certificate;
    final spkiPin = certificate?.der.asCertificateDerGetSpkiPin();
    return spkiPin;
  });
}
