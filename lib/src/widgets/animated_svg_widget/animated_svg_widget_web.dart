import 'dart:html' as html;
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../extensions/alignment_extension.dart';
import '../../extensions/color_extension.dart';
import '../../providers/svg_asset_base64_src_provider.dart';

class AnimatedSvgWidget extends ConsumerStatefulWidget {
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
  ConsumerState<ConsumerStatefulWidget> createState() => _AnimatedSvgWidgetState();
}

class _AnimatedSvgWidgetState extends ConsumerState<AnimatedSvgWidget> {
  static const htmlStringTemplate = '''<!DOCTYPE html>
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

  @override
  Widget build(BuildContext context) {
    if (widget.svgLink.startsWith("http")) {
      platformViewRegistry.registerViewFactory('img-svg-$hashCode', (int viewId) {
        // final html.ImageElement element = html.ImageElement(src: widget.svgLink)
        //   ..style.width = "100%"
        //   ..style.height = "100%";
        // return element;
        final html.IFrameElement element = html.IFrameElement()
          ..src = widget.svgLink
          ..style.border = "none"
          ..style.width = "100%"
          ..style.height = "100%";
        return element;
      });
      return HtmlElementView(viewType: 'img-svg-$hashCode');
    } else {
      final base64Src = ref.watch(svgAssetBase64SrcProvider(svgAsset: widget.svgLink));
      switch (base64Src) {
        case AsyncData(:final value):
          {
            platformViewRegistry.registerViewFactory('img-svg-$hashCode', (int viewId) {
              final html.ImageElement element = html.ImageElement(src: value)
                ..style.width = "100%"
                ..style.height = "100%";
              return element;
            });
            return HtmlElementView(viewType: 'img-svg-$hashCode');
          }
        default:
          return const SizedBox.shrink();
      }
    }
  }

  Future<String> _generateHtmlString() async {
    String src;
    if (widget.svgLink.startsWith("http")) {
      src = widget.svgLink;
    } else {
      src = await ref.read(svgAssetBase64SrcProvider(svgAsset: widget.svgLink).future);
    }
    final htmlString = htmlStringTemplate.replaceFirst(
      '''--IMAGE--''',
      src,
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
