import 'package:flutter/widgets.dart';

import '../models/display_width_mode.dart';

extension SizeExtension on Size {
  DisplayWidthMode toDisplayWidthMode() {
    DisplayWidthMode displayWidthMode;
    if (width >= DisplayWidthMode.extraLarge.minWidth) {
      displayWidthMode = DisplayWidthMode.extraLarge;
    } else if (width >= DisplayWidthMode.large.minWidth) {
      displayWidthMode = DisplayWidthMode.large;
    } else if (width >= DisplayWidthMode.expanded.minWidth) {
      displayWidthMode = DisplayWidthMode.expanded;
    } else if (width >= DisplayWidthMode.medium.minWidth) {
      displayWidthMode = DisplayWidthMode.medium;
    } else {
      displayWidthMode = DisplayWidthMode.compact;
    }
    return displayWidthMode;
  }
}
