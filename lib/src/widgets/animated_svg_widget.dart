import 'dart:convert';
import 'dart:html' as html;
import 'dart:ui_web';

import 'package:feech/src/providers/svg_asset_base64_src_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class _WebAnimatedSvgWidget extends ConsumerStatefulWidget {
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
  ConsumerState<ConsumerStatefulWidget> createState() => _WebAnimatedSvgWidgetState();
}

class _WebAnimatedSvgWidgetState extends ConsumerState<_WebAnimatedSvgWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.svgLink.startsWith("http")) {
      platformViewRegistry.registerViewFactory('img-svg-$hashCode', (int viewId) {
        final html.ImageElement element =
        html.ImageElement(src: widget.svgLink, height: 100, width: 100);
        return element;
      });
    } else {
      ref.read(svgAssetBase64SrcProvider(svgAsset: widget.svgLink));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.svgLink.startsWith("http")) {
      // return HtmlElementView(viewType: 'img-svg-$hashCode');
    }else{
      final base64Src = ref.watch(svgAssetBase64SrcProvider(svgAsset: widget.svgLink));
      switch (base64Src) {
        case AsyncData(:final value):
          {
            platformViewRegistry.registerViewFactory('img-svg-$hashCode', (int viewId) {
              final html.ImageElement element = html.ImageElement(src: value, height: 100, width: 100);
              return element;
            });
          }
      }
    }
    return HtmlElementView(viewType: 'img-svg-$hashCode');
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
