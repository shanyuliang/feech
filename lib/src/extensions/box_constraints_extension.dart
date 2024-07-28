import 'package:flutter/widgets.dart';

import '../models/display_width_mode.dart';

extension BoxConstraintsExtension on BoxConstraints {
  DisplayWidthMode toDisplayWidthMode() {
    DisplayWidthMode displayWidthMode;
    if (maxWidth >= DisplayWidthMode.extraLarge.minWidth) {
      displayWidthMode = DisplayWidthMode.extraLarge;
    } else if (maxWidth >= DisplayWidthMode.large.minWidth) {
      displayWidthMode = DisplayWidthMode.large;
    } else if (maxWidth >= DisplayWidthMode.expanded.minWidth) {
      displayWidthMode = DisplayWidthMode.expanded;
    } else if (maxWidth >= DisplayWidthMode.medium.minWidth) {
      displayWidthMode = DisplayWidthMode.medium;
    } else {
      displayWidthMode = DisplayWidthMode.compact;
    }
    return displayWidthMode;
  }
}
