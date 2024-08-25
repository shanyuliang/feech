import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../providers/svg_as_html_string_provider.dart';

class EnhancedSvgWidget extends ConsumerStatefulWidget {
  final String svgLink;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Clip clipBehavior;
  final Color backgroundColor;

  const EnhancedSvgWidget({
    super.key,
    required this.svgLink,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.none,
    this.backgroundColor = Colors.transparent,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EnhancedSvgWidgetState();
}

class _EnhancedSvgWidgetState extends ConsumerState<EnhancedSvgWidget> {
  final _webViewController = WebViewController()
    ..setBackgroundColor(Colors.transparent)
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  Widget build(final BuildContext context) {
    final htmlString = ref.watch(svgAsHtmlStringProvider(
      svgLink: widget.svgLink,
      alignment: widget.alignment,
      backgroundColor: widget.backgroundColor,
      fillContainer: false,
      fit: BoxFit.contain,
    ));
    switch (htmlString) {
      case AsyncData(:final value):
        {
          final svgHtml = value.$1;
          final svgSize = value.$2;
          if (svgHtml != null && svgSize != null) {
            _webViewController.loadHtmlString(svgHtml);
            return SizedBox.fromSize(
              size: _decideSize(svgSize: svgSize),
              child: FittedBox(
                fit: widget.fit,
                alignment: widget.alignment,
                clipBehavior: widget.clipBehavior,
                child: SizedBox.fromSize(
                  size: svgSize,
                  child: WebViewWidget(
                    controller: _webViewController,
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        }
      default:
        return const SizedBox.shrink();
    }
  }

  Size _decideSize({required final Size svgSize}) {
    double? width = widget.width;
    double? height = widget.height;
    if (width != null && height != null) {
    } else if (height != null) {
      width = height * svgSize.width / svgSize.height;
    } else if (width != null) {
      height = width * svgSize.height / svgSize.width;
    } else {
      width = svgSize.width;
      height = svgSize.height;
    }
    return Size(width, height);
  }
}
