import 'package:flutter/widgets.dart';

import '../models/display_width_mode.dart';
import 'double_extension.dart';

extension BuildContextExtension on BuildContext {
  DisplayWidthMode getDisplayWidthMode() {
    final screenSize = MediaQuery.of(this).size;
    return screenSize.width.asWidthToDisplayWidthMode();
  }
}
