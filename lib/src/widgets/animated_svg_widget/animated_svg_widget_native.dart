import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  final _webViewController = WebViewController()..setBackgroundColor(Colors.transparent);

  @override
  Widget build(final BuildContext context) {
    ref.listen(
        svgAsHtmlStringProvider(
          svgLink: widget.svgLink,
          alignment: widget.alignment,
          backgroundColor: widget.backgroundColor,
          fit: widget.fit,
        ), (previous, htmlString) {
      switch (htmlString) {
        case AsyncData(:final value):
          {
            _webViewController.loadHtmlString(value);
          }
      }
    });
    return WebViewWidget(
      controller: _webViewController,
    );
  }
}
