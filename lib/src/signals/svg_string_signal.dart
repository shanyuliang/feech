import 'dart:developer' as developer;

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:signals_flutter/signals_flutter.dart';

import '../constants.dart';

class SvgStringSignal extends FutureSignal<String?> {
  final bool debugLogDiagnostics;

  SvgStringSignal({required final String svgLink, final Map<String, String>? headers, this.debugLogDiagnostics = false})
    : super(() async {
        if (debugLogDiagnostics) {
          developer.log("SvgStringSignal fetching SVG from $svgLink", name: debugTag);
        }
        if (svgLink.startsWith("http")) {
          final response = await http.get(Uri.parse(svgLink), headers: headers);
          if (response.statusCode >= 200 && response.statusCode <= 299) {
            return response.body;
          } else {
            return null;
          }
        } else {
          return await rootBundle.loadString(svgLink);
        }
      }, debugLabel: "SvgStringSignal");
}
