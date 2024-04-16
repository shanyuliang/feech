import 'package:flutter/foundation.dart';

T? suppressThrowable<T>(T? Function() throwableFunction, T? defaultReturn) {
  try {
    return throwableFunction.call();
  } catch (ex) {
    debugPrint("[Fumech] suppress throwable $ex");
    return defaultReturn;
  }
}
