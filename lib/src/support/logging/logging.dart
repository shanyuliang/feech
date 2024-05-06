import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

abstract class Logging {
  Logger get logger;

  FlutterExceptionHandler? get flutterExceptionHandler;

  Future<void> initialise();
}
