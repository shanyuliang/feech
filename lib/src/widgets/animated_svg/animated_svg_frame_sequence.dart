import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

typedef AnimatedSvgFrameBuilder = Widget Function(BuildContext context, int frameIndex);

class AnimatedSvgFrameSequence extends StatefulWidget {
  final int frameCount;
  final AnimatedSvgFrameBuilder frameBuilder;
  final Duration frameDuration;
  final bool loop;
  final bool autoplay;
  final ValueChanged<int>? onFrameChanged;
  final VoidCallback? onCompleted;

  const AnimatedSvgFrameSequence({
    super.key,
    required this.frameCount,
    required this.frameBuilder,
    this.frameDuration = const Duration(milliseconds: 100),
    this.loop = true,
    this.autoplay = true,
    this.onFrameChanged,
    this.onCompleted,
  }) : assert(frameCount > 0, 'frameCount must be greater than 0');

  factory AnimatedSvgFrameSequence.assets({
    Key? key,
    required List<String> frameAssetPaths,
    Duration frameDuration = const Duration(milliseconds: 100),
    bool loop = true,
    bool autoplay = true,
    ValueChanged<int>? onFrameChanged,
    VoidCallback? onCompleted,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    ColorFilter? colorFilter,
    WidgetBuilder? placeholderBuilder,
  }) {
    assert(frameAssetPaths.isNotEmpty, 'frameAssetPaths cannot be empty');
    return AnimatedSvgFrameSequence(
      key: key,
      frameCount: frameAssetPaths.length,
      frameDuration: frameDuration,
      loop: loop,
      autoplay: autoplay,
      onFrameChanged: onFrameChanged,
      onCompleted: onCompleted,
      frameBuilder: (context, frameIndex) {
        return SvgPicture.asset(
          frameAssetPaths[frameIndex],
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          colorFilter: colorFilter,
          placeholderBuilder: placeholderBuilder,
        );
      },
    );
  }

  @override
  State<AnimatedSvgFrameSequence> createState() => _AnimatedSvgFrameSequenceState();
}

class _AnimatedSvgFrameSequenceState extends State<AnimatedSvgFrameSequence> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int _currentFrame = 0;
  int _lastNotifiedFrame = -1;

  Duration get _cycleDuration => Duration(microseconds: widget.frameDuration.inMicroseconds * widget.frameCount);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _cycleDuration)
      ..addListener(_handleTick)
      ..addStatusListener(_handleStatus);
    if (widget.autoplay) {
      _play();
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedSvgFrameSequence oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.frameDuration != widget.frameDuration || oldWidget.frameCount != widget.frameCount) {
      _controller.duration = _cycleDuration;
    }
    if (!oldWidget.autoplay && widget.autoplay && !_controller.isAnimating) {
      _play();
    }
    if (oldWidget.autoplay && !widget.autoplay && _controller.isAnimating) {
      _controller.stop();
    }
  }

  void _play() {
    if (widget.loop) {
      _controller.repeat();
    } else {
      _controller.forward(from: 0);
    }
  }

  void _handleTick() {
    final nextFrame = (_controller.value * widget.frameCount).floor().clamp(0, widget.frameCount - 1);
    if (nextFrame != _currentFrame) {
      setState(() {
        _currentFrame = nextFrame;
      });
    }
    if (nextFrame != _lastNotifiedFrame) {
      _lastNotifiedFrame = nextFrame;
      widget.onFrameChanged?.call(nextFrame);
    }
  }

  void _handleStatus(AnimationStatus status) {
    if (!widget.loop && status == AnimationStatus.completed) {
      _currentFrame = widget.frameCount - 1;
      widget.onCompleted?.call();
    }
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_handleTick)
      ..removeStatusListener(_handleStatus)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: ValueKey<int>(_currentFrame),
      child: widget.frameBuilder(context, _currentFrame),
    );
  }
}
