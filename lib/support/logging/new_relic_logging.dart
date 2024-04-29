import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:newrelic_mobile/config.dart';
import 'package:newrelic_mobile/newrelic_mobile.dart';

import '../../constants.dart';
import 'logging.dart';

class NewRelicLogging extends Logging {
  @override
  final Logger logger;
  final String accessToken;
  final String eventType;
  final int maxEventBufferTimeInSeconds;
  final Level minLoggingLevel;
  Completer? _initializationCompleter;

  NewRelicLogging({
    required this.accessToken,
    required this.eventType,
    required this.maxEventBufferTimeInSeconds,
    required this.minLoggingLevel,
  }) : logger = Logger("New Relic") {
    _initialize();
    logger.level = minLoggingLevel;
    logger.onRecord.listen((record) {
      _log(record);
    });
  }

  Future<void> _initialize() async {
    if (_initializationCompleter == null) {
      _initializationCompleter = Completer();

      final config = Config(
        accessToken: accessToken,
      );

      await NewrelicMobile.instance.startAgent(config);
      await NewrelicMobile.instance.setMaxEventBufferTime(maxEventBufferTimeInSeconds);
      if (!_initializationCompleter!.isCompleted) {
        _initializationCompleter!.complete();
      }
    } else {
      return _initializationCompleter!.future;
    }
  }

  Future<void> _log(LogRecord logRecord) async {
    if (logRecord.level >= minLoggingLevel) {
      await _initialize();
      try {
        final body = {
          "time": logRecord.time.toIso8601String(),
          "level": logRecord.level.name,
          "message": logRecord.message,
        };
        if (logRecord.level >= Level.SEVERE) {
          final isFatal = logRecord.level >= Level.SHOUT;
          NewrelicMobile.instance.recordError(
            logRecord.error ?? Error(),
            logRecord.stackTrace,
            attributes: body,
            isFatal: isFatal,
          );
        } else {
          NewrelicMobile.instance.recordCustomEvent(eventType, eventAttributes: body);
        }
      } catch (error, stackTrace) {
        debugPrint("$debugTag NewRelicLogging ${error.toString()}");
        debugPrintStack(stackTrace: stackTrace);
      }
    }
  }
}
