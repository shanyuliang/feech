import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../extensions/alignment_extension.dart';
import '../extensions/color_extension.dart';
import 'svg_asset_base64_src_provider.dart';

part 'svg_as_html_string_provider.g.dart';

@Riverpod()
class SvgAsHtmlStringProvider extends _$SvgAsHtmlStringProvider {
  static const htmlStringTemplate = '''<!DOCTYPE html>
      <html lang="">
      <head>
          <meta charset="UTF-8">
          <style>
              html {
                  width: 100%;
                  height: 100%;
                  overflow: hidden;
                  margin: 0;
              }
      
              body {
                  background-image: url("--IMAGE--");
                  background-color: --COLOR--;
                  background-position: --ALIGNMENT--;
                  background-size: --FIT--;
                  background-repeat: no-repeat;
                  background-attachment: fixed;
                  height: 100%;
                  margin: 0;
                  padding: 0;
              }
          </style>
          <title></title>
      </head>
      <body></body>
      </html>
      ''';

  @override
  Future<String> build({
    required String svgLink,
    Alignment alignment = Alignment.center,
    BoxFit fit = BoxFit.contain,
    Color backgroundColor = Colors.transparent,
  }) async {
    String src;
    if (svgLink.startsWith("http")) {
      src = svgLink;
    } else {
      src = await ref.read(svgAssetBase64SrcProvider(svgAsset: svgLink).future);
    }
    final htmlString = htmlStringTemplate.replaceFirst(
      '''--IMAGE--''',
      src,
    ).replaceFirst(
      '''--COLOR--''',
      backgroundColor.toHexRGBAString(),
    ).replaceFirst(
      '''--ALIGNMENT--''',
      alignment.toCSSPosition(),
    ).replaceFirst(
      '''--FIT--''',
      fit.name,
    );
    return htmlString;
  }
}
