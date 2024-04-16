import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../extensions/general_type_extension.dart';
import '../support/bitmap_descriptor_from_svg_builder.dart';

Future<BitmapDescriptor> getBitmapDescriptorFromSVGAsset({
  required final BuildContext context,
  required final String assetName,
  final bool originalSizeAsLp = false,
  final bool originalSizeAsSp = false,
  final int targetLpWidth = 0,
  final int targetSpWidth = 0,
  final int targetPxWidth = 0,
  final bool enableCache = true,
  final bool enableDebugLog = false,
}) {
  final bitmapDescriptorFromSvgBuilder = BitmapDescriptorFromSvgBuilder(context);
  bitmapDescriptorFromSvgBuilder.assetName(assetName);
  _applyOtherParameters(
    bitmapDescriptorFromSvgBuilder: bitmapDescriptorFromSvgBuilder,
    originalSizeAsLp: originalSizeAsLp,
    originalSizeAsSp: originalSizeAsSp,
    targetLpWidth: targetLpWidth,
    targetSpWidth: targetSpWidth,
    targetPxWidth: targetPxWidth,
    enableCache: enableCache,
    enableDebugLog: enableDebugLog,
  );
  return bitmapDescriptorFromSvgBuilder.build();
}

Future<BitmapDescriptor> getBitmapDescriptorFromSVGString({
  required final BuildContext context,
  required final String svgString,
  final List<String>? interpolateParams,
  final bool originalSizeAsLp = false,
  final bool originalSizeAsSp = false,
  final int targetLpWidth = 0,
  final int targetSpWidth = 0,
  final int targetPxWidth = 0,
  final bool enableCache = true,
  final bool enableDebugLog = false,
}) {
  final bitmapDescriptorFromSvgBuilder = BitmapDescriptorFromSvgBuilder(context);
  bitmapDescriptorFromSvgBuilder.svgString(svgString);
  interpolateParams?.let((it) {
    bitmapDescriptorFromSvgBuilder.interpolateParams(it);
  });
  _applyOtherParameters(
    bitmapDescriptorFromSvgBuilder: bitmapDescriptorFromSvgBuilder,
    originalSizeAsLp: originalSizeAsLp,
    originalSizeAsSp: originalSizeAsSp,
    targetLpWidth: targetLpWidth,
    targetSpWidth: targetSpWidth,
    targetPxWidth: targetPxWidth,
    enableCache: enableCache,
    enableDebugLog: enableDebugLog,
  );
  return bitmapDescriptorFromSvgBuilder.build();
}

void _applyOtherParameters({
  required BitmapDescriptorFromSvgBuilder bitmapDescriptorFromSvgBuilder,
  final bool originalSizeAsLp = false,
  final bool originalSizeAsSp = false,
  final int targetLpWidth = 0,
  final int targetSpWidth = 0,
  final int targetPxWidth = 0,
  final bool enableCache = true,
  final bool enableDebugLog = false,
}) {
  if (originalSizeAsLp) {
    bitmapDescriptorFromSvgBuilder.originalSizeAsLp();
  } else if (originalSizeAsSp) {
    bitmapDescriptorFromSvgBuilder.originalSizeAsSp();
  }
  if (targetLpWidth > 0) {
    bitmapDescriptorFromSvgBuilder.targetLpWidth(targetLpWidth);
  } else if (targetSpWidth > 0) {
    bitmapDescriptorFromSvgBuilder.targetSpWidth(targetSpWidth);
  } else if (targetPxWidth > 0) {
    bitmapDescriptorFromSvgBuilder.targetPxWidth(targetPxWidth);
  }
  if (enableCache) {
    bitmapDescriptorFromSvgBuilder.enableCache();
  }
  if (enableDebugLog) {
    bitmapDescriptorFromSvgBuilder.enableDebugLog();
  }
}
