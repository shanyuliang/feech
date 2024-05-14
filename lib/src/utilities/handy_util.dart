import 'dart:async';

T? suppressThrowableSync<T>({
  required final T? Function() throwable,
  final T? Function(Object error, StackTrace stackTrace)? whenError,
}) {
  try {
    return throwable.call();
  } catch (error, stackTrace) {
    return suppressThrowableSync(
      throwable: () {
        return whenError?.call(error, stackTrace);
      },
    );
  }
}

T suppressThrowableSyncDefault<T>({
  required final T Function() throwable,
  required final T Function(Object error, StackTrace stackTrace) whenError,
}) {
  try {
    return throwable.call();
  } catch (error, stackTrace) {
    return whenError.call(error, stackTrace);
  }
}

Future<T?> suppressThrowableAsync<T>({
  required final Future<T?> Function() throwable,
  final Future<T?> Function(Object error, StackTrace stackTrace)? whenError,
}) async {
  try {
    return await throwable.call();
  } catch (error, stackTrace) {
    return suppressThrowableAsync(
      throwable: () {
        return Future.value(whenError?.call(error, stackTrace));
      },
    );
  }
}

Future<T> suppressThrowableAsyncDefault<T>({
  required final Future<T> Function() throwable,
  required final Future<T> Function(Object error, StackTrace stackTrace) whenError,
}) async {
  try {
    return await throwable.call();
  } catch (error, stackTrace) {
    return await whenError.call(error, stackTrace);
  }
}
