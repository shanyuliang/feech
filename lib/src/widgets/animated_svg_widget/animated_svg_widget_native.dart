import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  final _webViewController = WebViewController()
    ..setBackgroundColor(Colors.transparent)
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  Widget build(final BuildContext context) {
    ref.listen(
        svgAsHtmlStringProvider(
          svgLink: widget.svgLink,
          alignment: widget.alignment,
          backgroundColor: widget.backgroundColor,
          fillContainer: widget.fillContainer,
          fit: widget.fitModeWhenFillContainer,
        ), (previous, htmlString) {
      switch (htmlString) {
        case AsyncData(:final value):
          {
            _webViewController.loadHtmlString(value);
            // if (widget.svgLink.toLowerCase().startsWith("http")) {
            //   _webViewController.loadRequest(Uri.parse(widget.svgLink));
            // } else {
            //   _webViewController.loadFlutterAsset(widget.svgLink);
            // }
          }
      }
    });
    return WebViewWidget(
      controller: _webViewController,
    );
  }
}
