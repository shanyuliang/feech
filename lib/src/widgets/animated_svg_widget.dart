import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../extensions/alignment_extension.dart';
import '../extensions/color_extension.dart';

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
            background-image: url("--IMAGE--");
            background-color: --COLOR--;
            background-position: --ALIGNMENT--;
            background-size: --FIT--;
            background-repeat: no-repeat;
            background-attachment: fixed;
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
            background-image: url("data:image/svg+xml;base64,--IMAGE--");
            background-color: --COLOR--;
            background-position: --ALIGNMENT--;
            background-size: --FIT--;
            background-repeat: no-repeat;
            background-attachment: fixed;
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
  final Alignment alignment;
  final BoxFit fit;
  final Color backgroundColor;

  const AnimatedSvgWidget({
    super.key,
    required this.svgLink,
    this.alignment = Alignment.center,
    this.fit = BoxFit.contain,
    this.backgroundColor = Colors.transparent,
  }) : assert(
          fit == BoxFit.contain || fit == BoxFit.cover,
          'fit can only be contain or cover',
        );

  @override
  State<AnimatedSvgWidget> createState() => _AnimatedSvgWidgetState();
}

class _AnimatedSvgWidgetState extends State<AnimatedSvgWidget> {
  final _webViewController = WebViewController()..setBackgroundColor(Colors.transparent);

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
      final htmlString = urlTemplate.replaceFirst(
        '''--IMAGE--''',
        widget.svgLink,
      ).replaceFirst(
        '''--COLOR--''',
        widget.backgroundColor.toHexRGBAString(),
      ).replaceFirst(
        '''--ALIGNMENT--''',
        widget.alignment.toCSSPosition(),
      ).replaceFirst(
        '''--FIT--''',
        widget.fit.name,
      );
      return htmlString;
    } else {
      final svgString = await rootBundle.loadString(widget.svgLink);
      final svgBase64 = base64Encode(svgString.codeUnits);
      final htmlString = assetTemplate.replaceFirst(
        '''--IMAGE--''',
        svgBase64,
      ).replaceFirst(
        '''--COLOR--''',
        widget.backgroundColor.toHexRGBAString(),
      ).replaceFirst(
        '''--ALIGNMENT--''',
        widget.alignment.toCSSPosition(),
      ).replaceFirst(
        '''--FIT--''',
        widget.fit.name,
      );
      return htmlString;
    }
  }
}
