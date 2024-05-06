import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../constants.dart';
import '../../utilities/handy_util.dart';
import 'logging.dart';

class ConsolidatedLogging extends Logging {
  late final List<Logging> _internalLoggingList;

  ConsolidatedLogging({
    required List<Logging> Function() actionLoggingList,
  }) {
    hierarchicalLoggingEnabled = true;
    recordStackTraceAtLevel = Level.SEVERE;
    _internalLoggingList = actionLoggingList();
    logger.level = Level.ALL;
    logger.onRecord.listen((record) {
      _log(record);
    });
    FlutterError.onError = flutterExceptionHandler;
  }

  void _log(LogRecord logRecord) {
    for (final logging in _internalLoggingList) {
      suppressThrowableSync(
        throwable: () {
          logging.logger.log(
            logRecord.level,
            logRecord.message,
            logRecord.error,
            logRecord.stackTrace,
            logRecord.zone,
          );
        },
        whenError: (error, stackTrace) {
          debugPrint("$debugTag ConsolidatedLogging ${error.toString()}");
          debugPrintStack(stackTrace: stackTrace);
        },
      );
    }
  }

  @override
  final logger = Logger("Consolidated");

  @override
  FlutterExceptionHandler? get flutterExceptionHandler => (FlutterErrorDetails details) {
        for (final internalLogging in _internalLoggingList) {
          suppressThrowableSync(
            throwable: () {
              internalLogging.flutterExceptionHandler?.call(details);
            },
            whenError: (error, stackTrace) {
              debugPrint("$debugTag ConsolidatedLogging ${error.toString()}");
              debugPrintStack(stackTrace: stackTrace);
            },
          );
        }
      };

  @override
  Future<void> initialise() async {
    for (final internalLogging in _internalLoggingList) {
      await suppressThrowableAsync(
        throwable: () async {
          await internalLogging.initialise();
        },
        whenError: (error, stackTrace) async {
          debugPrint("$debugTag ConsolidatedLogging ${error.toString()}");
          debugPrintStack(stackTrace: stackTrace);
        },
      );
    }
  }
}
