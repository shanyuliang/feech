import 'dart:math';

import 'package:flutter/widgets.dart';

class CurvedPathFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    const double radius = 120;
    const double iconSize = 48;
    for (int i = 0; i < context.childCount; i++) {
      final double theta = (i / (context.childCount - 1)) * pi;
      final double x = radius * (1 + cos(theta)) - iconSize / 2 + 72;
      final double y = radius * (1 + sin(theta)) - iconSize / 2 - 72;
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(CurvedPathFlowDelegate oldDelegate) => false;
}
