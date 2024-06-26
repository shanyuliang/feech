import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SliverFooter extends SingleChildRenderObjectWidget {
  /// Creates a sliver that fills the remaining space in the viewport.
  const SliverFooter({
    super.key,
    super.child,
  });

  @override
  RenderSliverFooter createRenderObject(BuildContext context) => RenderSliverFooter();
}

class RenderSliverFooter extends RenderSliverSingleBoxAdapter {
  /// Creates a [RenderSliver] that wraps a [RenderBox] which is sized to fit
  /// the remaining space in the viewport.
  RenderSliverFooter({
    super.child,
  });

  @override
  void performLayout() {
    final extent = constraints.remainingPaintExtent - min(constraints.overlap, 0.0);
    var childGrowthSize = .0; // added
    if (child != null) {
      // changed maxExtent from 'extent' to double.infinity
      child!.layout(constraints.asBoxConstraints(minExtent: extent, maxExtent: double.infinity), parentUsesSize: true);
      childGrowthSize = constraints.axis == Axis.vertical ? child!.size.height : child!.size.width; // added
    }
    final paintedChildSize = calculatePaintOffset(constraints, from: 0.0, to: extent);
    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);
    geometry = SliverGeometry(
      // used to be this : scrollExtent: constraints.viewportMainAxisExtent,
      scrollExtent: max(extent, childGrowthSize),
      paintExtent: paintedChildSize,
      maxPaintExtent: paintedChildSize,
      hasVisualOverflow: extent > constraints.remainingPaintExtent || constraints.scrollOffset > 0.0,
    );
    if (child != null) {
      setChildParentData(child!, constraints, geometry!);
    }
  }
}
