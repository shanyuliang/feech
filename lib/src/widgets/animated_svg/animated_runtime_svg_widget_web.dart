import 'dart:js_interop';
import 'dart:ui_web';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:material_ui/material_ui.dart';
import 'package:web/web.dart' as web;

class AnimatedRuntimeSvgWidget extends StatefulWidget {
  final String _svgSource;
  final _AnimatedRuntimeSvgSourceType _sourceType;
  final Map<String, String>? headers;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final WidgetBuilder? loadingBuilder;
  final Widget Function(BuildContext context, Object error)? errorBuilder;

  const AnimatedRuntimeSvgWidget.asset({
    super.key,
    required String assetPath,
    this.width,
    this.height,
    this.backgroundColor = Colors.transparent,
    this.loadingBuilder,
    this.errorBuilder,
  }) : _svgSource = assetPath,
       _sourceType = _AnimatedRuntimeSvgSourceType.asset,
       headers = null;

  const AnimatedRuntimeSvgWidget.network({
    super.key,
    required String url,
    this.headers,
    this.width,
    this.height,
    this.backgroundColor = Colors.transparent,
    this.loadingBuilder,
    this.errorBuilder,
  }) : _svgSource = url,
       _sourceType = _AnimatedRuntimeSvgSourceType.network;

  const AnimatedRuntimeSvgWidget.string({
    super.key,
    required String svgXml,
    this.width,
    this.height,
    this.backgroundColor = Colors.transparent,
    this.loadingBuilder,
    this.errorBuilder,
  }) : _svgSource = svgXml,
       _sourceType = _AnimatedRuntimeSvgSourceType.inline,
       headers = null;

  @override
  State<AnimatedRuntimeSvgWidget> createState() => _AnimatedRuntimeSvgWidgetState();
}

class _AnimatedRuntimeSvgWidgetState extends State<AnimatedRuntimeSvgWidget> {
  static final Set<String> _registeredViewTypes = <String>{};
  late final Future<String> _htmlFuture;

  @override
  void initState() {
    super.initState();
    _htmlFuture = _buildHtml();
  }

  Future<String> _buildHtml() async {
    final svgString = await _loadSvgString();
    return _buildHtmlFromSvg(svgString, widget.backgroundColor);
  }

  Future<String> _loadSvgString() async {
    switch (widget._sourceType) {
      case _AnimatedRuntimeSvgSourceType.asset:
        return rootBundle.loadString(widget._svgSource);
      case _AnimatedRuntimeSvgSourceType.network:
        final response = await http.get(Uri.parse(widget._svgSource), headers: widget.headers);
        if (response.statusCode < 200 || response.statusCode > 299) {
          throw FlutterError('Failed to fetch SVG: HTTP ${response.statusCode} for ${widget._svgSource}');
        }
        return response.body;
      case _AnimatedRuntimeSvgSourceType.inline:
        return widget._svgSource;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _htmlFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return widget.errorBuilder?.call(context, snapshot.error!) ?? const SizedBox.shrink();
        }
        final html = snapshot.data;
        if (html == null) {
          return widget.loadingBuilder?.call(context) ??
              SizedBox(
                width: widget.width,
                height: widget.height,
              );
        }
        final viewType =
            'animated-runtime-svg-${html.hashCode}-${widget.width}-${widget.height}-${widget.backgroundColor.toARGB32()}';
        if (!_registeredViewTypes.contains(viewType)) {
          _registeredViewTypes.add(viewType);
          platformViewRegistry.registerViewFactory(
            viewType,
            (int viewId) => web.HTMLIFrameElement()
              ..srcdoc = html.toJS
              ..frameBorder = 'none'
              ..width = '100%'
              ..height = '100%'
              ..style.border = 'none',
          );
        }
        return SizedBox(
          width: widget.width,
          height: widget.height,
          child: HtmlElementView(viewType: viewType),
        );
      },
    );
  }
}

String _buildHtmlFromSvg(String svgXml, Color backgroundColor) {
  final cssColor = '#${(backgroundColor.a * 255).round().toRadixString(16).padLeft(2, '0')}${(backgroundColor.r * 255).round().toRadixString(16).padLeft(2, '0')}${(backgroundColor.g * 255).round().toRadixString(16).padLeft(2, '0')}${(backgroundColor.b * 255).round().toRadixString(16).padLeft(2, '0')}';
  return '''
<!DOCTYPE html>
<html lang="">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <style>
    html, body {
      margin: 0;
      padding: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
      background: $cssColor;
    }
    svg {
      width: 100%;
      height: 100%;
      display: block;
    }
  </style>
</head>
<body>
$svgXml
</body>
</html>
''';
}

enum _AnimatedRuntimeSvgSourceType { asset, network, inline }
