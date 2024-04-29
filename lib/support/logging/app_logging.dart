import 'dart:io';

import 'package:feech/constants.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:newrelic_mobile/newrelic_mobile.dart';

import 'console_logging.dart';
import 'crashlytics_logging.dart';
import 'logging.dart';
import 'new_relic_logging.dart';

class AppLogging extends Logging {
  @override
  final logger = Logger("App");

  final List<Logging> _internalLoggingList = [];
  final List<FlutterExceptionHandler> _internalFlutterExceptionHandlerList = [];

  AppLogging() {
    hierarchicalLoggingEnabled = true;
    recordStackTraceAtLevel = Level.SEVERE;
    _setupConsole();
    _setupCrashlytics();
    _setupNewRelic();
    FlutterError.onError = _handleFlutterError;
    logger.level = Level.ALL;
    logger.onRecord.listen((record) {
      _log(record);
    });
  }

  void _handleFlutterError(FlutterErrorDetails details) {
    for (final flutterExceptionHandler in _internalFlutterExceptionHandlerList) {
      flutterExceptionHandler.call(details);
    }
  }

  void _setupConsole() {
    try {
      _internalLoggingList.add(ConsoleLogging());
    } catch (error, stackTrace) {
      debugPrint("$debugTag AppLogging ${error.toString()}");
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  void _setupNewRelic() {
    try {
      // AAd54d22310231c55e0ab58d0ed2786154c909673d-NRMA  - Native Android
      // AA5d973d22f76e3014f35df8fbfd0eb3394a744b0c-NRMA - Flutter Android
      final accessToken = Platform.isAndroid
          ? 'AA5d973d22f76e3014f35df8fbfd0eb3394a744b0c-NRMA'
          : 'AAbcf68b6bff51e764db060ebf4d156fb6c13e9e4c-NRMA';
      _internalLoggingList.add(
        NewRelicLogging(
          accessToken: accessToken,
          eventType: "Flutter Base",
          maxEventBufferTimeInSeconds: 60,
          minLoggingLevel: Level.INFO,
        ),
      );
      _internalFlutterExceptionHandlerList.add(NewrelicMobile.onError);
    } catch (error, stackTrace) {
      debugPrint("$debugTag AppLogging ${error.toString()}");
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  void _setupCrashlytics() {
    try {
      _internalLoggingList.add(CrashlyticsLogging());
      _internalFlutterExceptionHandlerList.add(FirebaseCrashlytics.instance.recordFlutterError);
    } catch (error, stackTrace) {
      debugPrint("$debugTag AppLogging ${error.toString()}");
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  void _log(LogRecord logRecord) {
    for (final logging in _internalLoggingList) {
      logging.logger.log(
        logRecord.level,
        logRecord.message,
        logRecord.error,
        logRecord.stackTrace,
        logRecord.zone,
      );
    }
  }
}
