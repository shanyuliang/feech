import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../support/logging/consolidated_logging.dart';
import '../../support/logging/logging.dart';

part 'app_logging_provider.g.dart';

@Riverpod(keepAlive: true)
class AppLogging extends _$AppLogging {
  @override
  Future<Logging> build({required List<Logging> Function() actionLoggingList}) async {
    final logging = ConsolidatedLogging(actionLoggingList: actionLoggingList);
    await logging.initialise();
    return logging;
  }
}
