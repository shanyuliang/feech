import 'package:flutter/widgets.dart';

import '../support/screen_width_mode.dart';

extension DoubleExtension on double {
  double asSp(BuildContext context) => MediaQuery.of(context).textScaler.scale(this);

  ScreenWidthMode asWidthGetScreenWidthMode() {
    for (final screenWidthMode in ScreenWidthMode.values.reversed) {
      if (this >= screenWidthMode.minWidth) {
        return screenWidthMode;
      }
    }
    return ScreenWidthMode.small;
  }
}
