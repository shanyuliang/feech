import 'package:flutter/widgets.dart';

import '../constants.dart';
import '../support/screen_width_mode.dart';
import 'double_extension.dart';

extension BuildContextExtension on BuildContext {
  ScreenWidthMode getScreenWidthMode() {
    final screenSize = MediaQuery.of(this).size;
    debugPrint("$debugTag screen size $screenSize");
    return screenSize.width.asWidthGetScreenWidthMode();
  }
}
