import 'dart:async';

import 'package:flutter/foundation.dart';

import '../constants.dart';

T? suppressThrowableSync<T>({
  required final T? Function() throwable,
  final T? Function(Object ex)? whenError,
}) {
  try {
    return throwable.call();
  } catch (ex) {
    debugPrint("$debugTag suppressed throwable $ex");
    return suppressThrowableSync(
      throwable: () {
        return whenError?.call(ex);
      },
    );
  }
}

T suppressThrowableSyncDefault<T>({
  required final T Function() throwable,
  required final T Function(Object ex) whenError,
}) {
  try {
    return throwable.call();
  } catch (ex) {
    debugPrint("$debugTag suppressed throwable $ex");
    return whenError.call(ex);
  }
}

Future<T?> suppressThrowableAsync<T>({
  required final Future<T?> Function() throwable,
  final Future<T?> Function(Object ex)? whenError,
}) async {
  try {
    return await throwable.call();
  } catch (ex) {
    debugPrint("$debugTag suppressed throwable $ex");
    return suppressThrowableAsync(
      throwable: () {
        return Future.value(whenError?.call(ex));
      },
    );
  }
}

Future<T> suppressThrowableAsyncDefault<T>({
  required final Future<T> Function() throwable,
  required final Future<T> Function(Object ex) whenError,
}) async {
  try {
    return await throwable.call();
  } catch (ex) {
    debugPrint("$debugTag suppressed throwable $ex");
    return await whenError.call(ex);
  }
}
