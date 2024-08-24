import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../extensions/general_type_extension.dart';
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
          fitModeWhenFillContainer == BoxFit.contain ||
              fitModeWhenFillContainer == BoxFit.cover ||
              fitModeWhenFillContainer == BoxFit.fill,
          'fitModeWhenFillContainer can only be one of [contain, cover, fill]',
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
            value.$1?.let((it) {
              _webViewController.loadHtmlString(it);
            });
          }
      }
    });
    return WebViewWidget(
      controller: _webViewController,
    );
  }
}
