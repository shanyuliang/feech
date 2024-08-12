import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'svg_asset_base64_src_provider.g.dart';

@Riverpod()
class SvgAssetBase64SrcProvider extends _$SvgAssetBase64SrcProvider {
  @override
  Future<String> build({required String svgAsset}) async {
    final svgString = await rootBundle.loadString(svgAsset);
    final svgBase64 = base64Encode(svgString.codeUnits);
    // final String base64 = base64Encode(utf8.encode(svgString));
    final base64Src = 'data:image/svg+xml;base64,$svgBase64';
    return base64Src;
  }
}
