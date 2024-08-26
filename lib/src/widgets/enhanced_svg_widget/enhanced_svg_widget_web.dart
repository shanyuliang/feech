import 'dart:html' as html;
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../../extensions/alignment_extension.dart';
import '../../extensions/color_extension.dart';
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
  @override
  Widget build(BuildContext context) {
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
            final viewType =
                "${widget.svgLink}-${widget.alignment.resolve(null).toShortString()}-${widget.backgroundColor.toHexRGBAString()}";
            platformViewRegistry.registerViewFactory(
                viewType,
                (int viewId) => html.IFrameElement()
                  ..srcdoc = svgHtml
                  ..style.border = "none"
                  ..style.width = "100%"
                  ..style.height = "100%");
            final containerSize = _decideSize(svgSize: svgSize);
            return Container(
              width: containerSize.width,
              height: containerSize.height,
              color: widget.backgroundColor,
              child: FittedBox(
                fit: widget.fit,
                alignment: widget.alignment,
                clipBehavior: widget.clipBehavior,
                child: Stack(
                  children: [
                    SizedBox.fromSize(
                      size: svgSize,
                      child: HtmlElementView(viewType: viewType),
                    ),
                    PointerInterceptor(
                      child: SizedBox.fromSize(
                        size: svgSize,
                        child: const Material(color: Colors.transparent),
                      ),
                    ),
                  ],
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

  Widget _placeholder() {
    return Container(width: widget.width, height: widget.height, color: widget.backgroundColor);
  }
}
