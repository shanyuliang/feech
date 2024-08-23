import 'dart:html' as html;
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/svg_as_html_string_provider.dart';

class AnimatedSvgWidget extends ConsumerStatefulWidget {
  final String svgLink;
  final Alignment alignment;
  final Color backgroundColor;
  final bool fillContainer;
  final BoxFit fitModeWhenFillContainer;

  const AnimatedSvgWidget({
    super.key,
    required this.svgLink,
    this.alignment = Alignment.center,
    this.backgroundColor = Colors.transparent,
    this.fillContainer = false,
    this.fitModeWhenFillContainer = BoxFit.contain,
  }) : assert(
          fitModeWhenFillContainer == BoxFit.contain || fitModeWhenFillContainer == BoxFit.cover,
          'fitModeWhenFillContainer can only be contain or cover',
        );

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AnimatedSvgWidgetState();
}

class _AnimatedSvgWidgetState extends ConsumerState<AnimatedSvgWidget> {
  @override
  Widget build(BuildContext context) {
    final htmlString = ref.watch(svgAsHtmlStringProvider(
      svgLink: widget.svgLink,
      alignment: widget.alignment,
      backgroundColor: widget.backgroundColor,
      fillContainer: widget.fillContainer,
      fit: widget.fitModeWhenFillContainer,
    ));
    switch (htmlString) {
      case AsyncData(:final value):
        {
          platformViewRegistry.registerViewFactory(
              'html-$hashCode',
              (int viewId) => html.IFrameElement()
                ..srcdoc = value
                ..style.border = "none"
                ..style.width = "100%"
                ..style.height = "100%");
          return HtmlElementView(viewType: 'html-$hashCode');
        }
      default:
        return const SizedBox.shrink();
    }
  }
}
