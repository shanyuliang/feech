import 'dart:html' as html;
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  @override
  Widget build(BuildContext context) {
    if (widget.svgLink.startsWith("http")) {
      platformViewRegistry.registerViewFactory('img-svg-$hashCode', (int viewId) {
        final html.ImageElement element = html.ImageElement(src: widget.svgLink)
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
}
