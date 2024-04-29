import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import 'logging.dart';

class ConsoleLogging extends Logging {
  @override
  final Logger logger;
  final bool debugBuildTypeOnly;
  final Level minLoggingLevel;

  ConsoleLogging({
    this.debugBuildTypeOnly = true,
    this.minLoggingLevel = Level.ALL,
  }) : logger = Logger("Console") {
    logger.level = minLoggingLevel;
    logger.onRecord.listen((record) {
      _log(record);
    });
  }

  Future<void> _log(LogRecord logRecord) async {
    if (logRecord.level >= minLoggingLevel) {
      if (kDebugMode || !debugBuildTypeOnly) {
        debugPrint("[${logRecord.level.name}] ${logRecord.message}");
      }
    }
  }
}
