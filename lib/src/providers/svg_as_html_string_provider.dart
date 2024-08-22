import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../extensions/alignment_extension.dart';
import '../extensions/color_extension.dart';
import 'svg_asset_base64_src_provider.dart';

part 'svg_as_html_string_provider.g.dart';

@Riverpod()
class SvgAsHtmlStringProvider extends _$SvgAsHtmlStringProvider {
  static const htmlStringTemplateBody = '''<!DOCTYPE html>
      <html lang="">
      <head>
          <meta charset="UTF-8">
          <style>
              html, body {
                  width: 100%;
                  height: 100%;
                  margin: 0;
                  padding: 0;
                  overflow: hidden;
              }
              body {
                  background-image: url("--IMAGE--");
                  background-color: --COLOR--;
                  background-position: --ALIGNMENT--;
                  background-size: contain;
                  background-repeat: no-repeat;
                  background-attachment: fixed;
              }
          </style>
          <title></title>
      </head>
      <body></body>
      </html>
      ''';

  static const htmlStringTemplateObject = '''<!DOCTYPE html>
      <html lang="">
      <head>
          <style>
              html, body {
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
                overflow: hidden;
                display: flex;
              }
              body {
                background-color: --COLOR--;
              }
              object {
                max-width: 100vw;
                max-height: 100vh;
                display: block;
                --ALIGNMENT--
              }
          </style>
          <title></title>
      </head>
      <body>
      <object type="image/svg+xml" data="--IMAGE--"></object>
      </body>
      </html>
      ''';

  static const htmlStringTemplateObjectFill = '''<!DOCTYPE html>
      <html lang="">
      <head>
          <style>
              html, body {
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
                overflow: hidden;
              }
              body {
                background-color: --COLOR--;
              }
              object {
                width: 100vw;
                height: 100vh;
              }
          </style>
          <script>
            function update(event) {
        var object = document.getElementById("feech_animated_svg");
        console.log(object);
        var objectDoc = object.contentDocument;
        console.log(objectDoc);
        var svgs = objectDoc.getElementsByTagName("svg");
        var svg = svgs[0];
        svg.setAttribute("preserveAspectRatio", "xMinYMin meet");
    }

window.addEventListener("load", function(){
    update();
});
          </script>
          <title></title>
      </head>
      <body>
      <object id="feech_animated_svg" type="image/svg+xml" data="--IMAGE--"></object>
      </body>
      </html>
      ''';

  // Note: If fillParent is true:
  // 1. The svg will occupy the whole container;
  // 2. The alignment is decided by the preserveAspectRatio attribute;
  // 3. preserveAspectRatio default to "xMidYMid meet";
  @override
  Future<String> build({
    required String svgLink,
    Alignment alignment = Alignment.center,
    Color backgroundColor = Colors.transparent,
    bool fillParent = false,
  }) async {
    String src;
    if (svgLink.startsWith("http")) {
      src = svgLink;
    } else {
      src = await ref.read(svgAssetBase64SrcProvider(svgAsset: svgLink).future);
    }
    final htmlString = (fillParent ? htmlStringTemplateObjectFill : htmlStringTemplateObject).replaceFirst(
      '''--IMAGE--''',
      src,
    ).replaceFirst(
      '''--COLOR--''',
      backgroundColor.toHexRGBAString(),
    ).replaceFirst(
      '''--ALIGNMENT--''',
      alignment.toCSSMargin(),
    );
    return htmlString;
  }
}
