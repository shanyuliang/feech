import 'package:webview_flutter/webview_flutter.dart';

extension WebResourceErrorExtension on WebResourceError {
  String toReadableString() {
    return "WebResourceError [errorCode: $errorCode] [errorType: $errorType] [description: $description] [isForMainFrame: $isForMainFrame] [url: $url]";
  }
}
