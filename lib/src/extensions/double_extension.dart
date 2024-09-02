import 'package:flutter/widgets.dart';

import '../models/display_width_mode.dart';

extension DoubleExtension on double {
  double asSp(BuildContext context) => MediaQuery.of(context).textScaler.scale(this);

  DisplayWidthMode asWidthToDisplayWidthMode() {
    for (final displayWidthMode in DisplayWidthMode.values.reversed) {
      if (this >= displayWidthMode.minWidth) {
        return displayWidthMode;
      }
    }
    return DisplayWidthMode.compact;
  }
}
