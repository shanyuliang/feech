import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../providers/svg_as_html_string_provider.dart';

class EnhancedSvgWidget extends ConsumerWidget {
  final String svgLink;
  final Map<String, String>? headers;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Clip clipBehavior;
  final Color backgroundColor;

  const EnhancedSvgWidget({
    super.key,
    required this.svgLink,
    this.headers,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.antiAlias,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final htmlStringAndSize = ref.watch(svgAsHtmlStringProvider(
      svgLink: svgLink,
      headers: headers,
      alignment: alignment,
      backgroundColor: backgroundColor,
      fillContainer: false,
      fit: BoxFit.contain,
    ));
    switch (htmlStringAndSize) {
      case AsyncData(:final value):
        {
          final svgHtml = value.$1;
          final svgSize = value.$2;
          if (svgHtml != null && svgSize != null) {
            final webViewController = WebViewController()
              ..setBackgroundColor(Colors.transparent)
              ..setJavaScriptMode(JavaScriptMode.unrestricted);
            webViewController.loadHtmlString(svgHtml);
            final containerSize = _decideSize(svgSize: svgSize);
            return Container(
              width: containerSize.width,
              height: containerSize.height,
              color: backgroundColor,
              child: FittedBox(
                fit: fit,
                alignment: alignment,
                clipBehavior: clipBehavior,
                child: SizedBox.fromSize(
                  size: svgSize,
                  child: WebViewWidget(
                    controller: webViewController,
                  ),
                ),
              ),
            );
          } else {
            return _placeholder();
          }
        }
      default:
        return _placeholder();
    }
  }

  Size _decideSize({required final Size svgSize}) {
    double? width = this.width;
    double? height = this.height;
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

  Widget _placeholder() {
    return Container(width: width, height: height, color: backgroundColor);
  }
}
