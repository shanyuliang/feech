import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants.dart';
import '../../helpers/network_helper.dart';

part 'network_helper_provider.g.dart';

@Riverpod(keepAlive: true)
class NetworkHelperProvider extends _$NetworkHelperProvider {
  @override
  NetworkHelper build({Client? client}) {
    return NetworkHelper(client??defaultAppClient);
  }
}
