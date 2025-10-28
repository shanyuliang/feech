import 'dart:developer' as developer;
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../extensions/box_constraints_extension.dart';
import '../models/runtime_info.dart';

class RuntimeInfoSignal extends Signal<RuntimeInfo> {
  final bool debugLogDiagnostics;

  RuntimeInfoSignal({this.debugLogDiagnostics = false})
    : super(
        RuntimeInfo(
          appLifecycleState: AppLifecycleState.resumed,
          brightness: PlatformDispatcher.instance.platformBrightness,
          displayConstraints: BoxConstraints.fromViewConstraints(
            PlatformDispatcher.instance.implicitView?.physicalConstraints ?? ViewConstraints.tight(Size.zero),
          ),
          displayWidthMode: BoxConstraints.fromViewConstraints(
            PlatformDispatcher.instance.implicitView?.physicalConstraints ?? ViewConstraints.tight(Size.zero),
          ).toDisplayWidthMode(),
          locale: PlatformDispatcher.instance.locale,
          textScaleFactor: PlatformDispatcher.instance.textScaleFactor,
        ),
        debugLabel: "RuntimeInfoSignal",
      );

  void setAppLifecycleState(AppLifecycleState appLifecycleState) {
    if (debugLogDiagnostics) {
      developer.log("RuntimeInfoSignal setAppLifecycleState $appLifecycleState");
    }
    value = peek().copyWith(appLifecycleState: appLifecycleState);
  }

  void setBrightness(Brightness brightness) {
    if (debugLogDiagnostics) {
      developer.log("RuntimeInfoSignal setBrightness $brightness");
    }
    value = peek().copyWith(brightness: brightness);
  }

  void setDisplayConstraints(BoxConstraints displayConstraints) {
    final displayWidthMode = displayConstraints.toDisplayWidthMode();
    if (debugLogDiagnostics) {
      developer.log("RuntimeInfoSignal setDisplayConstraints $displayConstraints");
      developer.log("RuntimeInfoSignal setDisplayWidthMode $displayWidthMode}");
    }
    value = peek().copyWith(displayConstraints: displayConstraints, displayWidthMode: displayWidthMode);
  }

  void setLocale(Locale locale) {
    if (debugLogDiagnostics) {
      developer.log("RuntimeInfoSignal setLocale $locale");
    }
    value = peek().copyWith(locale: locale);
  }

  void setTextScaleFactor(double textScaleFactor) {
    if (debugLogDiagnostics) {
      developer.log("RuntimeInfoSignal setTextScaleFactor $textScaleFactor");
    }
    value = peek().copyWith(textScaleFactor: textScaleFactor);
  }

  void refresh() {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    final locale = PlatformDispatcher.instance.locale;
    final textScaleFactor = PlatformDispatcher.instance.textScaleFactor;
    if (debugLogDiagnostics) {
      developer.log("RuntimeInfoSignal refresh brightness $brightness, locale $locale, textScaleFactor $textScaleFactor");
    }
    value = peek().copyWith(brightness: brightness, locale: locale, textScaleFactor: textScaleFactor);
  }
}
