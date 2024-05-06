import 'package:flutter/material.dart';

class Shimmer extends StatefulWidget {
  const Shimmer({
    super.key,
    required this.child,
    Color? baseColor,
    Color? highlightColor,
    BlendMode? blendMode,
  })  : baseColor = baseColor ?? const Color(0xFFD8E3E7),
        highlightColor = highlightColor ?? const Color(0xFFC8D5DA),
        blendMode = blendMode ?? BlendMode.src;

  final Widget child;
  final Color baseColor;
  final Color highlightColor;

  // BlendMode.src is best for text line
  // BlendMode.srcATop is best for image
  // Default is BlendMode.src
  final BlendMode blendMode;

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  LinearGradient get gradient => LinearGradient(
        colors: [
          widget.baseColor,
          widget.highlightColor,
          widget.baseColor,
        ],
        stops: const [
          0.1,
          0.5,
          0.9,
        ],
        begin: const Alignment(-1.0, -0.3),
        end: const Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
        transform: _SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _shimmerController.removeListener(_onShimmerChange);
    _shimmerController.addListener(_onShimmerChange);
  }

  @override
  void dispose() {
    _shimmerController.removeListener(_onShimmerChange);
    _shimmerController.dispose();
    super.dispose();
  }

  void _onShimmerChange() {
    setState(() {
      // update the shimmer painting.
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: widget.blendMode,
      shaderCallback: (bounds) {
        return gradient.createShader(bounds);
      },
      child: widget.child,
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
