import 'package:flutter/material.dart';

import 'shimmer.dart';

class ShimmerText extends StatelessWidget {
  final double widthFactor;
  final double textScaleFactor;
  final AlignmentGeometry alignment;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerText({
    super.key,
    this.widthFactor = 0.75,
    this.textScaleFactor = 0.6,
    this.alignment = Alignment.centerLeft,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: Shimmer(
          blendMode: BlendMode.srcATop,
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('', textScaleFactor: textScaleFactor),
          ),
        ),
      ),
    );
  }
}
