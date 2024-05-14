import 'package:flutter/widgets.dart';

import '../support/screen_width_mode.dart';
import 'double_extension.dart';

extension BuildContextExtension on BuildContext {
  ScreenWidthMode getScreenWidthMode() {
    final screenSize = MediaQuery.of(this).size;
    return screenSize.width.asWidthGetScreenWidthMode();
  }
}
