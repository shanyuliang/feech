import 'package:flutter/material.dart';

import 'general_type_extension.dart';

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final matrix = renderObject?.getTransformTo(null);

    if (matrix != null && renderObject?.paintBounds != null) {
      return MatrixUtils.transformRect(matrix, renderObject!.paintBounds);
    } else {
      return null;
    }
  }

  Size? get size {
    final renderObject = currentContext?.findRenderObject();
    return renderObject?.let((it) => (it as RenderBox).size);
  }

  Offset? get offset {
    final renderObject = currentContext?.findRenderObject();
    return renderObject?.let((it) => (it as RenderBox).localToGlobal(Offset.zero));
  }

  Size? get physicalSize {
    final logicalSize = size;
    if (logicalSize != null && currentContext != null) {
      final devicePixelRatio = MediaQuery.maybeDevicePixelRatioOf(currentContext!);
      if (devicePixelRatio != null) {
        return logicalSize * devicePixelRatio;
      }
    }
    return null;
  }
}
