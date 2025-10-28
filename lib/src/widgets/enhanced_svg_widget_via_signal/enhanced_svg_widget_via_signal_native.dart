import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants.dart';
import '../../signals/svg_as_html_string_signal.dart';
import '../../signals/svg_string_signal.dart';

class EnhancedSvgWidgetViaSignal extends StatelessWidget {
  final String svgLink;
  final Map<String, String>? headers;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Clip clipBehavior;
  final Color backgroundColor;
  final bool debugLogDiagnostics;
  late final SvgAsHtmlStringSignal svgAsHtmlStringSignal;

  EnhancedSvgWidgetViaSignal({
    super.key,
    required this.svgLink,
    this.headers,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.antiAlias,
    this.backgroundColor = Colors.transparent,
    this.debugLogDiagnostics = false,
  }) {
    svgAsHtmlStringSignal = SvgAsHtmlStringSignal(
      svgLink: svgLink,
      headers: headers,
      alignment: alignment,
      backgroundColor: backgroundColor,
      fillContainer: false,
      fit: BoxFit.contain,
      svgStringSignal: SvgStringSignal(svgLink: svgLink, headers: headers, debugLogDiagnostics: debugLogDiagnostics),
      debugLogDiagnostics: debugLogDiagnostics,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (debugLogDiagnostics) {
      developer.log("EnhancedSvgWidgetViaSignal[$hashCode] 1", name: debugTag);
    }
    return Watch((ctx) {
      if (debugLogDiagnostics) {
        developer.log("EnhancedSvgWidgetViaSignal[$hashCode] 2", name: debugTag);
      }
      final htmlStringAndSize = svgAsHtmlStringSignal.value;
      if (debugLogDiagnostics) {
        developer.log("EnhancedSvgWidgetViaSignal[$hashCode] htmlStringAndSize $htmlStringAndSize", name: debugTag);
      }
      switch (htmlStringAndSize) {
        case AsyncData(:final value):
          {
            if (debugLogDiagnostics) {
              developer.log("EnhancedSvgWidgetViaSignal[$hashCode] AsyncData value $value", name: debugTag);
            }
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
                    child: WebViewWidget(controller: webViewController),
                  ),
                ),
              );
            } else {
              return _placeholder();
            }
          }
        default:
          {
            if (debugLogDiagnostics) {
              developer.log("EnhancedSvgWidgetViaSignal Non-AsyncData", name: debugTag);
            }
            return _placeholder();
          }
      }
    });
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
