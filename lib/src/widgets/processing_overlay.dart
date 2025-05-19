import 'dart:ui';

import 'package:flutter/material.dart';

class ProcessingOverlay extends StatelessWidget {
  const ProcessingOverlay({
    super.key,
    required this.processing,
    required this.child,
    this.indicator = const CircularProgressIndicator(),
    this.dimmerOpacity = 0.25,
    this.blurSigma = 0.0,
  });

  final bool processing;
  final Widget child;
  final Widget indicator;
  final double dimmerOpacity;
  final double blurSigma;

  @override
  Widget build(final BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        child,
        if (processing)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: Container(color: Colors.black.withAlpha((dimmerOpacity * 255).toInt()), child: Center(child: indicator)),
          ),
      ],
    );
  }
}
