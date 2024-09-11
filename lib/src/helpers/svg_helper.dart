import 'dart:ui' as ui_lib;

import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http_pkg;

import '../extensions/general_type_extension.dart';
import '../extensions/string_extension.dart';
import '../support/map_cache.dart';
import '../utilities/handy_util.dart';

class SvgHelper {
  static Future<void> _onPictureInfoEvicted({
    required int key,
    required PictureInfo value,
  }) async {
    suppressThrowableSync(throwable: () {
      value.picture.dispose();
    });
  }

  static final pictureInfoCache = MapCache<int, PictureInfo>.lru(
    onEvicted: _onPictureInfoEvicted,
  );

  static final pngBytesCache = MapCache<int, Uint8List>.lru();

  static final bitmapDescriptorCache = MapCache<int, BitmapDescriptor>.lru();

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

  static Future<PictureInfo?> getPictureInfo({
    required String svgLink,
    final Map<String, String>? headers,
    final List<String>? interpolateParams,
    final bool useCache = true,
  }) async {
    PictureInfo? pictureInfo;
    final pictureInfoCacheKey = Object.hash(svgLink, interpolateParams);
    if (useCache) {
      pictureInfo = await pictureInfoCache.get(pictureInfoCacheKey);
    }
    if (pictureInfo == null) {
      final svgString = await _getSvgString(
        svgLink: svgLink,
        headers: headers,
      );
      if (svgString != null) {
        final interpolatedSvgString = svgString.interpolate(interpolateParams);
        pictureInfo =
            await vg.loadPicture(SvgStringLoader(interpolatedSvgString), null);
        if (useCache) {
          pictureInfoCache.set(pictureInfoCacheKey, pictureInfo);
        }
      }
    }
    return pictureInfo;
  }

  static Future<Uint8List?> getPngBytes({
    required String svgLink,
    final int sampling = 1,
    final Map<String, String>? headers,
    final List<String>? interpolateParams,
    final bool useCache = true,
  }) async {
    Uint8List? pngBytes;
    final pngBytesCacheKey = Object.hash(svgLink, interpolateParams);
    if (useCache) {
      pngBytes = await pngBytesCache.get(pngBytesCacheKey);
    }
    if (pngBytes == null) {
      final pictureInfo = await getPictureInfo(
        svgLink: svgLink,
        headers: headers,
        interpolateParams: interpolateParams,
        useCache: false,
      );
      if (pictureInfo != null) {
        final width = pictureInfo.size.width.toInt() * sampling;
        final height = pictureInfo.size.height.toInt() * sampling;
        final image = await pictureInfo.picture.toImage(width, height);
        final byteData =
            await image.toByteData(format: ui_lib.ImageByteFormat.png);
        pngBytes = byteData?.buffer.asUint8List();
        if (pngBytes != null && useCache) {
          pngBytesCache.set(pngBytesCacheKey, pngBytes);
        }
      }
    }
    return pngBytes;
  }

  static Future<BitmapDescriptor?> getBitmapDescriptor({
    required String svgLink,
    final int sampling = 1,
    final Map<String, String>? headers,
    final List<String>? interpolateParams,
  }) async {
    final bitmapDescriptorCacheKey = Object.hash(svgLink, interpolateParams);
    BitmapDescriptor? bitmapDescriptor =
        await bitmapDescriptorCache.get(bitmapDescriptorCacheKey);
    if (bitmapDescriptor == null) {
      final pngBytes = await getPngBytes(
        svgLink: svgLink,
        sampling: sampling,
        headers: headers,
        interpolateParams: interpolateParams,
        useCache: false,
      );
      bitmapDescriptor = pngBytes?.let((it) => BitmapDescriptor.bytes(it));
      if (bitmapDescriptor != null) {
        bitmapDescriptorCache.set(bitmapDescriptorCacheKey, bitmapDescriptor);
      }
    }
    return bitmapDescriptor;
  }
}
