import 'package:flutter/foundation.dart';

import '../constants.dart';

T? suppressThrowable<T>({
  required final T? Function() throwable,
  final T? Function(Object ex)? whenError,
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
