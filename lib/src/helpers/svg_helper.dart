import 'dart:ui' as ui_lib;

import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http_pkg;

import '../extensions/general_type_extension.dart';
import '../support/map_cache.dart';
import '../utilities/handy_util.dart';

class SvgHelper {
  static Future<void> _onPictureInfoEvicted({
    required String key,
    required PictureInfo value,
  }) async {
    suppressThrowableSync(throwable: () {
      value.picture.dispose();
    });
  }

  static final pictureInfoCache = MapCache<String, PictureInfo>.lru(
    maximumSize: 9999,
    onEvicted: _onPictureInfoEvicted,
  );

  static final bitmapDescriptorCache = MapCache<int, BitmapDescriptor>.lru(
    maximumSize: 9999,
  );

  static Future<String?> _getSvgString({
    required String svgLink,
    final Map<String, String>? headers,
  }) async {
    if (svgLink.startsWith("http")) {
      final response = await http_pkg.get(Uri.parse(svgLink), headers: headers);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return response.body;
      } else {
        return null;
      }
    } else {
      return await rootBundle.loadString(svgLink);
    }
  }

  static Future<Uint8List?> getPngByteData({
    required String svgLink,
    final Map<String, String>? headers,
  }) async {
    final svgString = await _getSvgString(
      svgLink: svgLink,
      headers: headers,
    );
    if (svgString != null) {
      final pictureInfo =
          await vg.loadPicture(SvgStringLoader(svgString), null);
      final width = pictureInfo.size.width.toInt();
      final height = pictureInfo.size.height.toInt();
      final image = await pictureInfo.picture.toImage(width, height);
      pictureInfo.picture.dispose();
      final byteData =
          await image.toByteData(format: ui_lib.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } else {
      return null;
    }
  }

  static Future<BitmapDescriptor?> getBitmapDescriptor({
    required String svgLink,
    final Map<String, String>? headers,
  }) async {
    final pngByteData = await getPngByteData(
      svgLink: svgLink,
      headers: headers,
    );
    return pngByteData?.let((it) => BitmapDescriptor.bytes(it));
  }
}
