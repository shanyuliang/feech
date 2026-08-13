import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

import '../extensions/general_type_extension.dart';

T? suppressThrowableSync<T>({required T? Function() throwable, T? Function(Object error, StackTrace stackTrace)? whenError}) {
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

T suppressThrowableSyncDefault<T>({required T Function() throwable, required T Function(Object error, StackTrace stackTrace) whenError}) {
  try {
    return throwable.call();
  } catch (error, stackTrace) {
    return whenError.call(error, stackTrace);
  }
}

Future<T?> suppressThrowableAsync<T>({
  required Future<T?> Function() throwable,
  Future<T?> Function(Object error, StackTrace stackTrace)? whenError,
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
  required Future<T> Function() throwable,
  required Future<T> Function(Object error, StackTrace stackTrace) whenError,
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
