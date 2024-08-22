import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../support/network/app_client.dart';
import 'network_helper_provider/network_helper_provider.dart';

part 'svg_string_provider.g.dart';

@Riverpod()
class SvgStringProvider extends _$SvgStringProvider {
  @override
  Future<String?> build({required String svgLink}) async {
    if (svgLink.startsWith("http")) {
      final networkHelper = ref.read(networkHelperProvider(AppClient()));
      final networkResult = await networkHelper.getAsync<String, String>(url: svgLink);
      return networkResult.getGoodValueOrNull();
    } else {
      return await rootBundle.loadString(svgLink);
    }
  }
}
