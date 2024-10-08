import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:newrelic_mobile/config.dart';
import 'package:newrelic_mobile/newrelic_mobile.dart';

import '../../utilities/handy_util.dart';
import 'logging.dart';

class NewRelicLogging extends Logging {
  final String accessToken;
  final String eventType;
  final int maxEventBufferTimeInSeconds;

  NewRelicLogging({
    required this.accessToken,
    required this.eventType,
    required this.maxEventBufferTimeInSeconds,
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
    Map<String, dynamic> eventAttributes = {"message": logRecord.message};
    if (logRecord.object != null) {
      debugPrint('logRecord.object is ${logRecord.object.runtimeType}');
      try {
        eventAttributes = logRecord.object as Map<String, dynamic>;
      } catch (ex) {
        debugPrint("LogRecord has a not-null object but it is not a Map.");
      }
    } else {
      debugPrint('logRecord.object is null');
    }
    eventAttributes.addAll({
      "time": logRecord.time.toIso8601String(),
      "level": logRecord.level.name,
    });
    if (logRecord.level >= Level.SEVERE) {
      final isFatal = logRecord.level >= Level.SHOUT;
      NewrelicMobile.instance.recordError(
        logRecord.error ?? Error(),
        logRecord.stackTrace,
        attributes: eventAttributes,
        isFatal: isFatal,
      );
    } else {
      await NewrelicMobile.instance
          .recordCustomEvent(eventType, eventAttributes: eventAttributes);
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
