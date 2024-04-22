import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../internal/file.dart';
import '../utilities/handy_util.dart';

extension FileExtension on File {
  Future<bool> isSvgFile() async {
    return suppressThrowable(throwable: () async {
      (await vg.loadPicture(SvgFileLoader(this), null)).picture.dispose();
      return true;
    }, whenError: (ex) {
      debugPrint("$debugTag isSvgFile $ex");
      return false;
    })!;
  }
}
