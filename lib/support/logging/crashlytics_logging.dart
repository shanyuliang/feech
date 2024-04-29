import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../constants.dart';
import 'logging.dart';

class CrashlyticsLogging extends Logging {
  @override
  final Logger logger;
  final Level minLoggingLevel;

  CrashlyticsLogging({
    this.minLoggingLevel = Level.SEVERE,
  }) : logger = Logger("Crashlytics") {
    logger.level = minLoggingLevel;
    logger.onRecord.listen((record) {
      _log(record);
    });
  }

  Future<void> _log(LogRecord logRecord) async {
    if (logRecord.level >= minLoggingLevel) {
      try {
        final isFatal = logRecord.level >= Level.SHOUT;
        await FirebaseCrashlytics.instance
            .recordError(logRecord.error, logRecord.stackTrace, fatal: isFatal, reason: logRecord.message);
        await FirebaseCrashlytics.instance.sendUnsentReports();
      } catch (error, stackTrace) {
        debugPrint("$debugTag CrashlyticsLogging ${error.toString()}");
        debugPrintStack(stackTrace: stackTrace);
      }
    }
  }
}
