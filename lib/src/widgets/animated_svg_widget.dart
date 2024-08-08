import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

const urlTemplate = '''<!DOCTYPE html>
<html lang="">
<head>
    <meta charset="UTF-8">
    <style>
        html {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0;
        }

        body {
            background-image: url("--SSVVGG--");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
    <title></title>
</head>
<body></body>
</html>
''';

const assetTemplate = '''<!DOCTYPE html>
<html lang="">
<head>
    <meta charset="UTF-8">
    <style>
        html {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0;
        }

        body {
            background-image: url("data:image/svg+xml;base64,--SSVVGG--");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
    <title></title>
</head>
<body></body>
</html>
''';

class AnimatedSvgWidget extends StatefulWidget {
  final String svgLink;

  const AnimatedSvgWidget({
    super.key,
    required this.svgLink,
  });

  @override
  State<AnimatedSvgWidget> createState() => _AnimatedSvgWidgetState();
}

class _AnimatedSvgWidgetState extends State<AnimatedSvgWidget> {
  final _webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    _generateHtmlString().then((string) {
      _webViewController.loadHtmlString(string);
    });
  }

  @override
  Widget build(final BuildContext context) {
    return WebViewWidget(
      controller: _webViewController,
    );
  }

  Future<String> _generateHtmlString() async {
    if (widget.svgLink.startsWith("http")) {
      final htmlString = urlTemplate.replaceAll('''--SSVVGG--''', widget.svgLink);
      return htmlString;
    } else {
      final svgString = await rootBundle.loadString(widget.svgLink);
      final svgBase64 = base64Encode(svgString.codeUnits);
      final htmlString = assetTemplate.replaceAll('''--SSVVGG--''', svgBase64);
      return htmlString;
    }
  }
}
