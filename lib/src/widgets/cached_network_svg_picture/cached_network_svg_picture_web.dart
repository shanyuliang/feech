import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedNetworkSvgPicture extends StatelessWidget {
  final String url;
  final Map<String, String>? headers;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? errorBuilder;
  final ColorFilter? colorFilter;
  final bool allowDrawingOutsideViewBox;
  final String? semanticsLabel;
  final bool excludeFromSemantics;
  final Clip clipBehavior;
  final Color? backgroundColor;

  CachedNetworkSvgPicture({
    super.key,
    required this.url,
    this.headers,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.loadingBuilder,
    this.errorBuilder,
    ColorFilter? colorFilter,
    this.allowDrawingOutsideViewBox = false,
    this.semanticsLabel,
    this.excludeFromSemantics = false,
    this.clipBehavior = Clip.antiAlias,
    this.backgroundColor,
  }) : colorFilter = colorFilter ?? (backgroundColor != null ? ColorFilter.mode(backgroundColor, BlendMode.dstOver) : null);

  @override
  Widget build(BuildContext context) {
    try {
      return SvgPicture.network(
        url,
        headers: headers,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        placeholderBuilder: loadingBuilder ?? _cachedSvgPictureDefaultPlaceholder,
        colorFilter: colorFilter,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        semanticsLabel: semanticsLabel,
        excludeFromSemantics: excludeFromSemantics,
        clipBehavior: clipBehavior,
      );
    } catch (error, _) {
      return errorBuilder?.call(context) ?? _cachedSvgPictureDefaultPlaceholder(context);
    }
  }

  Widget _cachedSvgPictureDefaultPlaceholder(BuildContext context) {
    return Container(width: width, height: height, color: backgroundColor);
  }
}
