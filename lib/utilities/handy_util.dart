import 'dart:async';

import 'package:flutter/foundation.dart';

import '../constants.dart';

FutureOr<T>? suppressThrowable<T>({
  required final FutureOr<T>? Function() throwable,
  final FutureOr<T>? Function(Object ex)? whenError,
}) {
  try {
    return throwable.call();
  } catch (ex) {
    debugPrint("$debugTag suppressed throwable $ex");
    return suppressThrowable(
      throwable: () {
        return whenError?.call(ex);
      },
    );
  }
}
