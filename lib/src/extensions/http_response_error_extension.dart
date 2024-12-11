import 'package:webview_flutter/webview_flutter.dart';

extension HttpResponseErrorExtension on HttpResponseError {
  String toReadableString() {
    return "HttpResponseError [statusCode: ${response?.statusCode}] [uri: ${response?.uri}]";
  }
}
