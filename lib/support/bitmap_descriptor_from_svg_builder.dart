import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart' as img;

import '../constants.dart';
import '../extensions/string_extension.dart';
import '../utilities/handy_util.dart';
import 'map_cache.dart';

class BitmapDescriptorFromSvgBuilder {
  static Future<void> _onEvicted({required String key, required PictureInfo value}) async {
    suppressThrowableSync(throwable: () {
      value.picture.dispose();
    });
  }

  static final pictureInfoCache = MapCache<String, PictureInfo>.lru(
    maximumSize: 9999,
    onEvicted: _onEvicted,
  );

  static final bitmapDescriptorCache = MapCache<int, BitmapDescriptor>.lru(
    maximumSize: 9999,
  );

  static const String _dummySvg = """<svg width="144" height="144">
      <circle cx="72" cy="72" fill="#0000FF" r="72" />
      <text style="font-size:108;stroke:#FFFFFF;fill:#FFFFFF" text-anchor="middle" x="72" y="108">S</text>
      </svg>""";
  final BuildContext _context;
  String? _assetName;
  String? _svgString;
  List<String>? _interpolateParams;
  bool _originalSizeAsLp = false;
  bool _originalSizeAsSp = false;
  int _targetLpWidth = 0;
  int _targetSpWidth = 0;
  int _targetPxWidth = 0;
  bool _debugLog = false;

  BitmapDescriptorFromSvgBuilder(this._context);

  BitmapDescriptorFromSvgBuilder assetName(String assetName) {
    _assetName = assetName;
    _svgString = null;
    return this;
  }

  BitmapDescriptorFromSvgBuilder svgString(String svgString) {
    _svgString = svgString;
    _assetName = null;
    return this;
  }

  BitmapDescriptorFromSvgBuilder interpolateParams(List<String> interpolateParams) {
    _interpolateParams = interpolateParams;
    return this;
  }

  BitmapDescriptorFromSvgBuilder originalSizeAsLp() {
    _originalSizeAsLp = true;
    _originalSizeAsSp = false;
    _targetLpWidth = 0;
    _targetSpWidth = 0;
    _targetPxWidth = 0;
    return this;
  }

  BitmapDescriptorFromSvgBuilder originalSizeAsSp() {
    _originalSizeAsSp = true;
    _originalSizeAsLp = false;
    _targetLpWidth = 0;
    _targetSpWidth = 0;
    _targetPxWidth = 0;
    return this;
  }

  BitmapDescriptorFromSvgBuilder targetLpWidth(int targetLpWidth) {
    _targetLpWidth = targetLpWidth;
    _originalSizeAsLp = false;
    _originalSizeAsSp = false;
    _targetSpWidth = 0;
    _targetPxWidth = 0;
    return this;
  }

  BitmapDescriptorFromSvgBuilder targetSpWidth(int targetSpWidth) {
    _targetSpWidth = targetSpWidth;
    _originalSizeAsLp = false;
    _originalSizeAsSp = false;
    _targetLpWidth = 0;
    _targetPxWidth = 0;
    return this;
  }

  BitmapDescriptorFromSvgBuilder targetPxWidth(int targetPxWidth) {
    _targetPxWidth = targetPxWidth;
    _originalSizeAsLp = false;
    _originalSizeAsSp = false;
    _targetLpWidth = 0;
    _targetSpWidth = 0;
    return this;
  }

  BitmapDescriptorFromSvgBuilder enableDebugLog() {
    _debugLog = true;
    return this;
  }

  Future<BitmapDescriptor> build() async {
    String svgString;
    final mediaQueryData = MediaQuery.of(_context);
    if (_assetName != null) {
      svgString = await DefaultAssetBundle.of(_context).loadString(_assetName!);
    } else if (_svgString != null) {
      svgString = _svgString!;
    } else {
      svgString = _dummySvg;
    }
    if (_interpolateParams != null) {
      svgString = svgString.interpolate(_interpolateParams!);
    }

    // final pictureInfo = await pictureInfoCache.getOrSet(svgString, () => vg.loadPicture(SvgStringLoader(svgString), null));
    final pictureInfo =
        (await pictureInfoCache.get(svgString, ifAbsent: (key) => vg.loadPicture(SvgStringLoader(svgString), null)))!;

    int originalWidth = pictureInfo.size.width.round();
    int originalHeight = pictureInfo.size.height.round();
    int targetWidth = originalWidth;
    int targetHeight = originalHeight;

    if (_originalSizeAsLp) {
      final ratio = mediaQueryData.devicePixelRatio;
      targetWidth = (originalWidth * ratio).round();
      targetHeight = (originalHeight * ratio).round();
    } else if (_originalSizeAsSp) {
      final ratio = mediaQueryData.devicePixelRatio * mediaQueryData.textScaleFactor;
      targetWidth = (originalWidth * ratio).round();
      targetHeight = (originalHeight * ratio).round();
    } else if (_targetLpWidth > 0) {
      final int pxWidth = (_targetLpWidth * mediaQueryData.devicePixelRatio).round();
      if (pxWidth != originalWidth) {
        targetWidth = pxWidth;
        targetHeight = (originalHeight * pxWidth / originalWidth).round();
      }
    } else if (_targetSpWidth > 0) {
      final int pxWidth = (_targetSpWidth * mediaQueryData.devicePixelRatio * mediaQueryData.textScaleFactor).round();
      if (pxWidth != originalWidth) {
        targetWidth = pxWidth;
        targetHeight = (originalHeight * pxWidth / originalWidth).round();
      }
    } else if (_targetPxWidth > 0) {
      if (_targetPxWidth != originalWidth) {
        targetWidth = _targetPxWidth;
        targetHeight = (originalHeight * _targetPxWidth / originalWidth).round();
      }
    }

    final bitmapDescriptorCacheKey = Object.hash(svgString, targetWidth, targetHeight);
    final bitmapDescriptor = (await bitmapDescriptorCache.get(
      bitmapDescriptorCacheKey,
      ifAbsent: (key) => _bitmapDescriptorFromPictureInfo(
        pictureInfo: pictureInfo,
        originalWidth: originalWidth,
        originalHeight: originalHeight,
        targetWidth: targetWidth,
      ),
    ))!;

    if (_debugLog) {
      debugPrint("$debugTag BitmapDescriptorFromSvgAssetBuilder");
      debugPrint("$debugTag devicePixelRatio ${mediaQueryData.devicePixelRatio}");
      debugPrint("$debugTag textScaleFactor ${mediaQueryData.textScaleFactor}");
      debugPrint("$debugTag assetName $_assetName");
      debugPrint("$debugTag svgString $svgString");
      debugPrint("$debugTag interpolateParams $_interpolateParams");
      debugPrint("$debugTag original size ${pictureInfo.size}");
      debugPrint("$debugTag originalSizeAsLp $_originalSizeAsLp");
      debugPrint("$debugTag originalSizeAsSp $_originalSizeAsSp");
      debugPrint("$debugTag targetLpWidth $_targetLpWidth");
      debugPrint("$debugTag targetSpWidth $_targetSpWidth");
      debugPrint("$debugTag targetPxWidth $_targetPxWidth");
      debugPrint("$debugTag output width $targetWidth");
      debugPrint("$debugTag output height $targetHeight");
    }

    return bitmapDescriptor;
  }

  Future<BitmapDescriptor> _bitmapDescriptorFromPictureInfo({
    required PictureInfo pictureInfo,
    required int originalWidth,
    required int originalHeight,
    required int targetWidth,
  }) async {
    final image = await pictureInfo.picture.toImage(originalWidth, originalHeight);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (originalWidth != targetWidth) {
      final cmd = img.Command()
        ..decodeImage(byteData!.buffer.asUint8List())
        ..copyResize(width: targetWidth)
        ..encodePng();
      final uint8List = await cmd.getBytesThread();
      return BitmapDescriptor.fromBytes(uint8List!);
    } else {
      return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
    }
  }
}
