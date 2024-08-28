import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../providers/svg_file_provider.dart';

class CachedNetworkSvgPicture extends ConsumerWidget {
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
  final Color backgroundColor;

  const CachedNetworkSvgPicture({
    super.key,
    required this.url,
    this.headers,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.loadingBuilder,
    this.errorBuilder,
    this.colorFilter,
    this.allowDrawingOutsideViewBox = false,
    this.semanticsLabel,
    this.excludeFromSemantics = false,
    this.clipBehavior = Clip.antiAlias,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUrlAndFile = ref.watch(svgFileProvider(svgLink: url, headers: headers));
    return asyncUrlAndFile.when(
      loading: () {
        return loadingBuilder?.call(context) ?? _cachedSvgPictureDefaultPlaceholder(context);
      },
      error: (Object error, StackTrace stackTrace) {
        return errorBuilder?.call(context) ?? _cachedSvgPictureDefaultPlaceholder(context);
      },
      data: ((String, File?) urlAndFile) {
        final file = urlAndFile.$2;
        if (file != null) {
          return Container(
            color: backgroundColor,
            child: SvgPicture.file(
              file,
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
            ),
          );
        } else {
          return errorBuilder?.call(context) ?? _cachedSvgPictureDefaultPlaceholder(context);
        }
      },
    );
  }

  Widget _cachedSvgPictureDefaultPlaceholder(BuildContext context) {
    return Container(color: backgroundColor);
  }
}
