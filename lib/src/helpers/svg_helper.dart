import 'dart:developer' as developer_lib;
import 'dart:ui' as ui_lib;

import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http_pkg;

import '../constants.dart';
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
    final bool debugLogDiagnostics = false,
  }) async {
    PictureInfo? pictureInfo;
    final pictureInfoCacheKey =
        Object.hashAll([svgLink, ...?interpolateParams]);
    if (useCache) {
      if (debugLogDiagnostics) {
        developer_lib.log(
          "SvgHelper getPictureInfo [$svgLink] cache key $pictureInfoCacheKey",
          name: debugTag,
        );
      }
      pictureInfo = await pictureInfoCache.get(pictureInfoCacheKey);
    }
    if (pictureInfo == null) {
      if (useCache && debugLogDiagnostics) {
        developer_lib.log(
          "SvgHelper getPictureInfo [$svgLink] missed cache",
          name: debugTag,
        );
      }
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
          if (debugLogDiagnostics) {
            developer_lib.log(
              "SvgHelper getPictureInfo [$svgLink] saved to cache",
              name: debugTag,
            );
          }
        }
      }
    } else {
      if (debugLogDiagnostics) {
        developer_lib.log(
          "SvgHelper getPictureInfo [$svgLink] hit cache",
          name: debugTag,
        );
      }
    }
    if (debugLogDiagnostics) {
      developer_lib.log(
        "SvgHelper getPictureInfo [$svgLink] picture info with size ${pictureInfo?.size}",
        name: debugTag,
      );
    }
    return pictureInfo;
  }

  static Future<Uint8List?> getPngBytes({
    required String svgLink,
    final double scale = 1.0,
    final Map<String, String>? headers,
    final List<String>? interpolateParams,
    final bool useCache = true,
    final bool debugLogDiagnostics = false,
  }) async {
    Uint8List? pngBytes;
    final pngBytesCacheKey =
        Object.hashAll([svgLink, scale, ...?interpolateParams]);
    if (useCache) {
      if (debugLogDiagnostics) {
        developer_lib.log(
          "SvgHelper getPngBytes [$svgLink] cache key $pngBytesCacheKey",
          name: debugTag,
        );
      }
      pngBytes = await pngBytesCache.get(pngBytesCacheKey);
    }
    if (pngBytes == null) {
      if (useCache && debugLogDiagnostics) {
        developer_lib.log(
          "SvgHelper getPngBytes [$svgLink] missed cache",
          name: debugTag,
        );
      }
      final pictureInfo = await getPictureInfo(
        svgLink: svgLink,
        headers: headers,
        interpolateParams: interpolateParams,
        useCache: false,
        debugLogDiagnostics: debugLogDiagnostics,
      );
      if (pictureInfo != null) {
        final width = pictureInfo.size.width.toInt();
        final height = pictureInfo.size.height.toInt();
        final image = await pictureInfo.picture.toImage(width, height);
        final byteData =
            await image.toByteData(format: ui_lib.ImageByteFormat.png);
        pngBytes = byteData?.buffer.asUint8List();
        if (pngBytes != null && useCache) {
          pngBytesCache.set(pngBytesCacheKey, pngBytes);
          if (debugLogDiagnostics) {
            developer_lib.log(
              "SvgHelper getPngBytes [$svgLink] saved to cache",
              name: debugTag,
            );
          }
        }
      }
    } else {
      if (debugLogDiagnostics) {
        developer_lib.log(
          "SvgHelper getPngBytes [$svgLink] hit cache",
          name: debugTag,
        );
      }
    }
    if (debugLogDiagnostics) {
      developer_lib.log(
        "SvgHelper getPngBytes [$svgLink] png bytes length ${pngBytes?.lengthInBytes}",
        name: debugTag,
      );
    }
    return pngBytes;
  }

  static Future<BitmapDescriptor?> getBitmapDescriptor({
    required String svgLink,
    final double scale = 1.0,
    final Map<String, String>? headers,
    final List<String>? interpolateParams,
    final bool debugLogDiagnostics = false,
  }) async {
    final bitmapDescriptorCacheKey =
        Object.hashAll([svgLink, scale, ...?interpolateParams]);
    if (debugLogDiagnostics) {
      developer_lib.log(
        "SvgHelper getBitmapDescriptor [$svgLink] cache key $bitmapDescriptorCacheKey",
        name: debugTag,
      );
    }
    BitmapDescriptor? bitmapDescriptor =
        await bitmapDescriptorCache.get(bitmapDescriptorCacheKey);
    if (bitmapDescriptor == null) {
      if (debugLogDiagnostics) {
        developer_lib.log(
          "SvgHelper getBitmapDescriptor [$svgLink] missed cache",
          name: debugTag,
        );
      }
      final pngBytes = await getPngBytes(
        svgLink: svgLink,
        scale: scale,
        headers: headers,
        interpolateParams: interpolateParams,
        useCache: false,
        debugLogDiagnostics: debugLogDiagnostics,
      );
      final view = ui_lib.PlatformDispatcher.instance.views.first;
      bitmapDescriptor = pngBytes?.let((it) => BitmapDescriptor.bytes(
            it,
            imagePixelRatio: view.devicePixelRatio,
          ));
      if (bitmapDescriptor != null) {
        bitmapDescriptorCache.set(bitmapDescriptorCacheKey, bitmapDescriptor);
        if (debugLogDiagnostics) {
          developer_lib.log(
            "SvgHelper getBitmapDescriptor [$svgLink] saved to cache",
            name: debugTag,
          );
        }
      }
    } else {
      if (debugLogDiagnostics) {
        developer_lib.log(
          "SvgHelper getBitmapDescriptor [$svgLink] hit cache",
          name: debugTag,
        );
      }
    }
    if (debugLogDiagnostics) {
      developer_lib.log(
        "SvgHelper getBitmapDescriptor [$svgLink] bitmap descriptor ${bitmapDescriptor?.toJson()}",
        name: debugTag,
      );
    }
    return bitmapDescriptor;
  }
}
