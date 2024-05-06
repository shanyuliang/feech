import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../utilities/handy_util.dart';
import 'logging.dart';

class ConsoleLogging extends Logging {
  final bool debugBuildTypeOnly;

  ConsoleLogging({
    String loggerName = "Console",
    Level minLoggingLevel = Level.ALL,
    this.debugBuildTypeOnly = true,
  }) : logger = Logger(loggerName)..level = minLoggingLevel {
    logger.onRecord.listen((record) {
      suppressThrowableAsync(throwable: () async {
        await _log(record);
      });
    });
  }

  Future<void> _log(LogRecord logRecord) async {
    if (kDebugMode || !debugBuildTypeOnly) {
      debugPrint("[${logRecord.level.name}] ${logRecord.message}");
    }
  }

  @override
  final Logger logger;

  @override
  FlutterExceptionHandler? get flutterExceptionHandler => (FlutterErrorDetails details) {
        if (kDebugMode || !debugBuildTypeOnly) {
          debugPrint("[Flutter Error] $details");
        }
      };

  @override
  Future<void> initialise() async {}
}
