import 'package:flutter/material.dart';

class ScrimCover extends StatelessWidget {
  final Widget child;
  final Color color;
  final Alignment begin;
  final Alignment end;

  const ScrimCover({
    super.key,
    required this.child,
    this.color = Colors.black,
    this.begin = Alignment.bottomCenter,
    this.end = Alignment.topCenter,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: begin,
          end: end,
          colors: [
            color.withOpacity(0.66),
            color.withOpacity(0.66),
            Colors.transparent,
          ],
          stops: [
            0.0,
            0.4,
            0.8,
          ],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
