import 'dart:developer' as developer;
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../extensions/box_constraints_extension.dart';
import '../../models/runtime_info.dart';

part 'runtime_info_provider.g.dart';

@Riverpod(keepAlive: true)
class RuntimeInfoProvider extends _$RuntimeInfoProvider {
  @override
  RuntimeInfo build({final bool debugLogDiagnostics = false}) {
    const appLifecycleState = AppLifecycleState.resumed;
    final brightness = PlatformDispatcher.instance.platformBrightness;
    final displayConstraints = BoxConstraints.fromViewConstraints(
        PlatformDispatcher.instance.implicitView?.physicalConstraints ??
            ViewConstraints.tight(Size.zero));
    final displayWidthMode = displayConstraints.toDisplayWidthMode();
    final locale = PlatformDispatcher.instance.locale;
    final textScaleFactor = PlatformDispatcher.instance.textScaleFactor;

    return RuntimeInfo(
      appLifecycleState: appLifecycleState,
      brightness: brightness,
      displayConstraints: displayConstraints,
      displayWidthMode: displayWidthMode,
      locale: locale,
      textScaleFactor: textScaleFactor,
    );
  }

  void setAppLifecycleState(AppLifecycleState appLifecycleState) {
    if (debugLogDiagnostics) {
      developer.log(
          "RuntimeInfoProvider setAppLifecycleState $appLifecycleState");
    }
    state = state.copyWith(appLifecycleState: appLifecycleState);
  }

  void setBrightness(Brightness brightness) {
    if (debugLogDiagnostics) {
      developer.log("RuntimeInfoProvider setBrightness $brightness");
    }
    state = state.copyWith(brightness: brightness);
  }

  void setDisplayConstraints(BoxConstraints displayConstraints) {
    final displayWidthMode = displayConstraints.toDisplayWidthMode();
    if (debugLogDiagnostics) {
      developer.log(
          "RuntimeInfoProvider setDisplayConstraints $displayConstraints");
      developer
          .log("RuntimeInfoProvider setDisplayWidthMode $displayWidthMode}");
    }
    state = state.copyWith(
        displayConstraints: displayConstraints,
        displayWidthMode: displayWidthMode);
  }

  void setLocale(Locale locale) {
    if (debugLogDiagnostics) {
      developer.log("RuntimeInfoProvider setLocale $locale");
    }
    state = state.copyWith(locale: locale);
  }

  void setTextScaleFactor(double textScaleFactor) {
    if (debugLogDiagnostics) {
      developer
          .log("RuntimeInfoProvider setTextScaleFactor $textScaleFactor");
    }
    state = state.copyWith(textScaleFactor: textScaleFactor);
  }

  void refresh() {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    final locale = PlatformDispatcher.instance.locale;
    final textScaleFactor = PlatformDispatcher.instance.textScaleFactor;
    if (debugLogDiagnostics) {
      developer.log(
          "RuntimeInfoProvider refresh brightness $brightness, locale $locale, textScaleFactor $textScaleFactor");
    }
    state = state.copyWith(
      brightness: brightness,
      locale: locale,
      textScaleFactor: textScaleFactor,
    );
  }
}
