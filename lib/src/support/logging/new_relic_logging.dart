import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:newrelic_mobile/config.dart';
import 'package:newrelic_mobile/newrelic_mobile.dart';

import '../../constants.dart';
import '../../utilities/handy_util.dart';
import 'logging.dart';

class NewRelicLogging extends Logging {
  final String accessToken;
  final String eventType;
  final int maxEventBufferTimeInSeconds;
  final bool logErrorAsNormalEvent;
  final bool debugLogDiagnostics;

  NewRelicLogging({
    required this.accessToken,
    required this.eventType,
    this.maxEventBufferTimeInSeconds = 300,
    this.logErrorAsNormalEvent = false,
    this.debugLogDiagnostics = false,
    Level minLoggingLevel = Level.INFO,
    String loggerName = "New Relic",
  }) : logger = Logger(loggerName)..level = minLoggingLevel {
    logger.onRecord.listen((record) {
      suppressThrowableAsync(throwable: () async {
        await _log(record);
      });
    });
  }

  Future<void> _log(LogRecord logRecord) async {
    Map<String, dynamic> eventAttributes = {};
    if (logRecord.object is Map) {
      eventAttributes.addAll(logRecord.object as Map<String, dynamic>);
    } else {
      eventAttributes.addAll({"feechLogMessage": logRecord.message});
    }
    eventAttributes.addAll({
      "feechLogTime": logRecord.time.toIso8601String(),
      "feechLogLevel": logRecord.level.name,
    });
    if (logRecord.level >= Level.SEVERE && logErrorAsNormalEvent) {
      eventAttributes.addAll({
        "feechError": logRecord.error.toString(),
        "feechStackTrace": logRecord.stackTrace.toString(),
        "feechIsFatal": logRecord.level >= Level.SHOUT,
      });
    }
    if (logRecord.level < Level.SEVERE || logErrorAsNormalEvent) {
      NewrelicMobile.instance
          .recordCustomEvent(
        eventType,
        eventAttributes: eventAttributes,
      )
          .then(
        (value) {
          if (debugLogDiagnostics) {
            developer.log(
              "New Relic recordCustomEvent result: $value",
              name: debugTag,
            );
          }
        },
      );
    } else {
      NewrelicMobile.instance.recordError(
        logRecord.error ?? Error(),
        logRecord.stackTrace,
        attributes: eventAttributes,
        isFatal: logRecord.level >= Level.SHOUT,
      );
    }
  }

  @override
  final Logger logger;

  @override
  FlutterExceptionHandler? get flutterExceptionHandler =>
      NewrelicMobile.onError;

  @override
  Future<void> initialise() async {
    final config =
        Config(accessToken: accessToken, printStatementAsEventsEnabled: false);
    await NewrelicMobile.instance.startAgent(config);
    await NewrelicMobile.instance
        .setMaxEventBufferTime(maxEventBufferTimeInSeconds);
  }
}
