import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'svg_string_provider.g.dart';

@Riverpod()
class SvgStringProvider extends _$SvgStringProvider {
  @override
  Future<String?> build({required final String svgLink, final Map<String, String>? headers}) async {
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
  }
}
