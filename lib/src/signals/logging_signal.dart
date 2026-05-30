import 'package:signals_flutter/signals_flutter.dart';

import '../support/logging/consolidated_logging.dart';
import '../support/logging/logging.dart';

class LoggingSignal extends FutureSignal<Logging> {
  final bool debugLogDiagnostics;

  LoggingSignal({required List<Logging> Function() actionLoggingList, this.debugLogDiagnostics = false})
    : super(() async {
        final logging = ConsolidatedLogging(actionLoggingList: actionLoggingList);
        await logging.initialise();
        return logging;
      }, options: AsyncSignalOptions(name: "LoggingSignal"));
}
