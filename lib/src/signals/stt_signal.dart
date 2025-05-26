import 'package:signals_flutter/signals_flutter.dart';

import '../models/stt.dart';
import '../support/logging/consolidated_logging.dart';
import '../support/logging/logging.dart';

class SttSignal extends FutureSignal<Stt> {
  SttSignal({required List<Logging> Function() actionLoggingList, bool debugLogDiagnostics = false})
    : super(() async {
        final logging = ConsolidatedLogging(actionLoggingList: actionLoggingList);
        await logging.initialise();
        return logging;
      });
}
