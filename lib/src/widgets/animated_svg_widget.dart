import 'dart:convert';
import 'dart:ui_web';
import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../extensions/alignment_extension.dart';
import '../extensions/color_extension.dart';

class AnimatedSvgWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return _WebAnimatedSvgWidget(
        svgLink: svgLink,
        alignment: alignment,
        fit: fit,
        backgroundColor: backgroundColor,
      );
    } else {
      return _NativeAnimatedSvgWidget(
        svgLink: svgLink,
        alignment: alignment,
        fit: fit,
        backgroundColor: backgroundColor,
      );
    }
  }
}

class _WebAnimatedSvgWidget extends StatefulWidget {
  final String svgLink;
  final Alignment alignment;
  final BoxFit fit;
  final Color backgroundColor;

  const _WebAnimatedSvgWidget({
    required this.svgLink,
    this.alignment = Alignment.center,
    this.fit = BoxFit.contain,
    this.backgroundColor = Colors.transparent,
  }) : assert(
          fit == BoxFit.contain || fit == BoxFit.cover,
          'fit can only be contain or cover',
        );

  @override
  State<_WebAnimatedSvgWidget> createState() => _WebAnimatedSvgWidgetState();
}

class _WebAnimatedSvgWidgetState extends State<_WebAnimatedSvgWidget> {

  @override
  void initState() {
    super.initState();

    platformViewRegistry.registerViewFactory('img-svg-${hashCode}',
            (int viewId) {
              //final svgString = await rootBundle.loadString(widget.svgLink);
              //final svgBase64 = base64Encode(svgString.codeUnits);
          //final String base64 = base64Encode(utf8.encode(svgString));
          //final base64String = 'data:image/svg+xml;base64,$svgBase64';
          final html.ImageElement element = html.ImageElement(
              src: "https://www.svgrepo.com/download/530572/accelerate.svg", height:100, width: 100);
          return element;
        });
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: 'img-svg-${hashCode}');
    if (widget.svgLink.startsWith("http")) {
      // return SvgPicture.network(widget.svgLink);
      // return Image.network(widget.svgLink);
      return HtmlElementView(viewType: 'openstreetmap');
    } else {
      // return SvgPicture.asset(widget.svgLink);
      return Image.asset(widget.svgLink);
    }
  }
}

class _NativeAnimatedSvgWidget extends StatefulWidget {
  final String svgLink;
  final Alignment alignment;
  final BoxFit fit;
  final Color backgroundColor;

  const _NativeAnimatedSvgWidget({
    required this.svgLink,
    this.alignment = Alignment.center,
    this.fit = BoxFit.contain,
    this.backgroundColor = Colors.transparent,
  }) : assert(
          fit == BoxFit.contain || fit == BoxFit.cover,
          'fit can only be contain or cover',
        );

  @override
  State<_NativeAnimatedSvgWidget> createState() => _NativeAnimatedSvgWidgetState();
}

class _NativeAnimatedSvgWidgetState extends State<_NativeAnimatedSvgWidget> {
  static const urlTemplate = '''<!DOCTYPE html>
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

  static const assetTemplate = '''<!DOCTYPE html>
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
