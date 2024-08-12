import 'dart:html' as html;
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/svg_as_html_string_provider.dart';

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
  final _validator = html.NodeValidatorBuilder.common()
    ..allowElement("title", uriPolicy: _AllowUriPolicy())
    ..allowElement("style", uriPolicy: _AllowUriPolicy())
    ..allowElement("meta", attributes: ["charset"], uriPolicy: _AllowUriPolicy())
    ..allowImages(_AllowUriPolicy())
    ..allowInlineStyles()
    ..allowSvg();

  // ..allowElement('img', attributes: ['src'], uriPolicy: _AllowUriPolicy())
  // ..allowElement('a', attributes: ['href'], uriPolicy: _AllowUriPolicy());

  @override
  Widget build(BuildContext context) {
    final htmlString = ref.watch(svgAsHtmlStringProvider(
      svgLink: widget.svgLink,
      alignment: widget.alignment,
      backgroundColor: widget.backgroundColor,
      fit: widget.fit,
    ));
    switch (htmlString) {
      case AsyncData(:final value):
        {
          platformViewRegistry.registerViewFactory('html-$hashCode', (int viewId) {
            final element = html.HtmlHtmlElement()
              ..setInnerHtml(value, validator: _validator)
              ..style.border = "none"
              ..style.width = "100%"
              ..style.height = "100%";
            return element;
          });
          return HtmlElementView(viewType: 'html-$hashCode');
        }
      default:
        return const SizedBox.shrink();
    }
  }
}

class _AllowUriPolicy implements html.UriPolicy {
  @override
  bool allowsUri(String uri) {
    return true;
  }
}
