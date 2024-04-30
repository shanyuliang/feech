import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../utilities/handy_util.dart';
import 'logging.dart';

class CrashlyticsLogging extends Logging {
  CrashlyticsLogging({
    String loggerName = "Crashlytics",
    Level minLoggingLevel = Level.SEVERE,
  }) : logger = Logger(loggerName)..level = minLoggingLevel {
    logger.onRecord.listen((record) {
      suppressThrowableAsync(throwable: () async {
        await _log(record);
      });
    });
  }

  Future<void> _log(LogRecord logRecord) async {
    final isFatal = logRecord.level >= Level.SHOUT;
    await FirebaseCrashlytics.instance
        .recordError(logRecord.error, logRecord.stackTrace, fatal: isFatal, reason: logRecord.message);
    await FirebaseCrashlytics.instance.sendUnsentReports();
  }

  @override
  final Logger logger;

  @override
  FlutterExceptionHandler? get flutterExceptionHandler => FirebaseCrashlytics.instance.recordFlutterError;

  @override
  Future<void> initialise() async {}
}
