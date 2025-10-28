import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../constants.dart';
import '../extensions/alignment_extension.dart';
import '../extensions/color_extension.dart';
import '../utilities/handy_util.dart';
import 'svg_string_signal.dart';

class SvgAsHtmlStringSignal extends FutureSignal<(String?, Size?)> {
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

  static const htmlStringTemplateSvg = '''<!DOCTYPE html>
      <html lang="">
      <head>
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
              svg {
                max-width: 100vw;
                max-height: 100vh;
                display: block;
                --ALIGNMENT--
              }
          </style>
          <title></title>
      </head>
      <body>
      --IMAGE--
      </body>
      </html>
      ''';

  static const htmlStringTemplateSvgFillContainer = '''<!DOCTYPE html>
      <html lang="">
      <head>
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
              svg {
                width: 100vw;
                height: 100vh;
              }
          </style>
          <script>
            function update(event) {
                var svgs = document.getElementsByTagName("svg");
                var svg = svgs[0];
                svg.setAttribute("preserveAspectRatio", "--ALIGNMENT--");
            }
            window.addEventListener("load", function(){
                update();
            });
          </script>
          <title></title>
      </head>
      <body>
      --IMAGE--
      </body>
      </html>
      ''';
  final bool debugLogDiagnostics;

  // Note: If `fillContainer` is true:
  // 1. The svg will occupy the whole container;
  // 2. Content outside of view box may be seen;

  // Note: `fit` only apply if `fillContainer` is true.

  SvgAsHtmlStringSignal({
    required final String svgLink,
    final Map<String, String>? headers,
    final AlignmentGeometry alignment = Alignment.center,
    final Color backgroundColor = Colors.transparent,
    final bool fillContainer = false,
    final BoxFit fit = BoxFit.contain,
    this.debugLogDiagnostics = false,
  }) : super(() async {
         Future<Size?> getSizeFromSVGString(String svgString) async {
           return suppressThrowableAsyncDefault(
             throwable: () async {
               final pictureInfo = await vg.loadPicture(SvgStringLoader(svgString), null);
               final size = pictureInfo.size;
               pictureInfo.picture.dispose();
               return size;
             },
             whenError: (error, stackTrace) async {
               return null;
             },
           );
         }

         final svgString = await SvgStringSignal(svgLink: svgLink, headers: headers, debugLogDiagnostics: debugLogDiagnostics).future;
         if (debugLogDiagnostics) {
           developer.log("SvgAsHtmlStringSignal svgString: $svgString", name: debugTag);
         }
         if (svgString != null) {
           final size = await getSizeFromSVGString(svgString);
           if (debugLogDiagnostics) {
             developer.log("SvgAsHtmlStringSignal size: $size", name: debugTag);
           }
           final alignmentString = fillContainer
               ? (fit == BoxFit.fill ? "none" : alignment.resolve(null).toSvgPreserveAspectRatio(fit == BoxFit.cover ? "slice" : "meet"))
               : alignment.resolve(null).toCSSMargin();
           final htmlString = (fillContainer ? htmlStringTemplateSvgFillContainer : htmlStringTemplateSvg)
               .replaceFirst('''--IMAGE--''', svgString)
               .replaceFirst('''--COLOR--''', backgroundColor.toHexRGBAString())
               .replaceFirst('''--ALIGNMENT--''', alignmentString);
           if (debugLogDiagnostics) {
             developer.log("SvgAsHtmlStringSignal returning: ${(htmlString, size)}", name: debugTag);
           }
           return (htmlString, size);
         } else {
           return (null, null);
         }
       }, debugLabel: "SvgAsHtmlStringSignal");
}
