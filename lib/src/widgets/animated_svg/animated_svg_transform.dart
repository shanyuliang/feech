import 'dart:ui' show lerpDouble;

import 'package:material_ui/material_ui.dart';

class AnimatedSvgTransform extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final bool repeat;
  final bool reverse;
  final bool autoplay;
  final double beginScale;
  final double endScale;
  final double beginRotationRadians;
  final double endRotationRadians;
  final Offset beginOffset;
  final Offset endOffset;
  final double beginOpacity;
  final double endOpacity;

  const AnimatedSvgTransform({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1200),
    this.curve = Curves.easeInOut,
    this.repeat = true,
    this.reverse = true,
    this.autoplay = true,
    this.beginScale = 1,
    this.endScale = 1,
    this.beginRotationRadians = 0,
    this.endRotationRadians = 0,
    this.beginOffset = Offset.zero,
    this.endOffset = Offset.zero,
    this.beginOpacity = 1,
    this.endOpacity = 1,
  }) : assert(beginOpacity >= 0 && beginOpacity <= 1),
       assert(endOpacity >= 0 && endOpacity <= 1);

  @override
  State<AnimatedSvgTransform> createState() => _AnimatedSvgTransformState();
}

class _AnimatedSvgTransformState extends State<AnimatedSvgTransform> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    if (widget.autoplay) {
      _play();
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedSvgTransform oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
    if (oldWidget.curve != widget.curve) {
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    }
    if (!oldWidget.autoplay && widget.autoplay && !_controller.isAnimating) {
      _play();
    }
    if (oldWidget.autoplay && !widget.autoplay && _controller.isAnimating) {
      _controller.stop();
    }
    if ((oldWidget.repeat != widget.repeat || oldWidget.reverse != widget.reverse) && widget.autoplay) {
      _play();
    }
  }

  void _play() {
    _controller.stop();
    if (widget.repeat) {
      _controller.repeat(reverse: widget.reverse);
    } else {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (context, child) {
        final t = _animation.value;
        final scale = lerpDouble(widget.beginScale, widget.endScale, t)!;
        final rotation = lerpDouble(widget.beginRotationRadians, widget.endRotationRadians, t)!;
        final opacity = lerpDouble(widget.beginOpacity, widget.endOpacity, t)!;
        final offset = Offset.lerp(widget.beginOffset, widget.endOffset, t)!;
        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: offset,
            child: Transform.rotate(
              angle: rotation,
              child: Transform.scale(
                scale: scale,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
