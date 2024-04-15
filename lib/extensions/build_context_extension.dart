import 'package:flutter/widgets.dart';

import '../support/screen_width_mode.dart';
import 'double_extension.dart';

extension BuildContextExtension on BuildContext {
  ScreenWidthMode getScreenWidthMode() {
    final width = MediaQuery.of(this).size.width;
    debugPrint("[Feech] screen width $width");
    return width.asWidthGetScreenWidthMode();
  }
}
