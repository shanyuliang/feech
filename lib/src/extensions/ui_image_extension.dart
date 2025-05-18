import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';

extension UiImageExtension on ui.Image {
  Future<Uint8List?> getBytes({ui.ImageByteFormat format = ui.ImageByteFormat.png}) async {
    final byteData = await toByteData(format: format);
    return byteData?.buffer.asUint8List();
  }
}
