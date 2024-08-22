import 'dart:html' as html;
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/svg_as_html_string_provider.dart';

class AnimatedSvgWidget extends ConsumerStatefulWidget {
  final String svgLink;
  final Alignment alignment;
  final Color backgroundColor;

  const AnimatedSvgWidget({
    super.key,
    required this.svgLink,
    this.alignment = Alignment.center,
    this.backgroundColor = Colors.transparent,
  });

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
