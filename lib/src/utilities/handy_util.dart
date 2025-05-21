import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extensions/general_type_extension.dart';

T? suppressThrowableSync<T>({required final T? Function() throwable, final T? Function(Object error, StackTrace stackTrace)? whenError}) {
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

T suppressThrowableSyncDefault<T>({required final T Function() throwable, required final T Function(Object error, StackTrace stackTrace) whenError}) {
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

void setAppSwitcherTitle({BuildContext? context, String? title}) {
  SystemChrome.setApplicationSwitcherDescription(
    ApplicationSwitcherDescription(label: title, primaryColor: context?.let((it) => Theme.of(it).primaryColor.toARGB32())),
  );
}

String getBuildType() {
  return kReleaseMode ? "release" : (kProfileMode ? "profile" : "debug");
}

String getVariant() {
  if (appFlavor != null) {
    return kReleaseMode ? "${appFlavor}Release" : (kProfileMode ? "${appFlavor}Profile" : "${appFlavor}Debug");
  } else {
    return getBuildType();
  }
}
