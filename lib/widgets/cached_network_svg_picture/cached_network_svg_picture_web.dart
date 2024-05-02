import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedNetworkSvgPicture extends StatelessWidget {
  final String url;
  final Widget? loadingPlaceholder;
  final Widget? errorPlaceholder;
  final ColorFilter? colorFilter;
  final BoxFit fit;

  const CachedNetworkSvgPicture({
    super.key,
    required this.url,
    this.loadingPlaceholder,
    this.errorPlaceholder,
    this.colorFilter,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    try {
      return SvgPicture.network(
        url,
        placeholderBuilder: (_) {
          return loadingPlaceholder ?? const DefaultPlaceholder();
        },
        colorFilter: colorFilter,
        fit: fit,
      );
    } catch (error, _) {
      return errorPlaceholder ?? const DefaultPlaceholder();
    }
  }
}

class DefaultPlaceholder extends StatelessWidget {
  const DefaultPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(dimension: 1);
  }
}
