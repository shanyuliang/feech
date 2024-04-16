import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

extension FileExtension on File {
  Future<bool> isSvgFile() async {
    try {
      final pictureInfo = await vg.loadPicture(SvgFileLoader(this), null);
      pictureInfo.picture.dispose();
      return true;
    } catch (ex) {
      debugPrint("$debugTag isSvgFile $ex");
      return false;
    }
  }
}
