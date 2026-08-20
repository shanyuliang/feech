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
          appLifecycleState: WidgetsBinding.instance.lifecycleState,
          brightness: WidgetsBinding.instance.platformDispatcher.platformBrightness,
          locale: WidgetsBinding.instance.platformDispatcher.locale,
          textScaleFactor: WidgetsBinding.instance.platformDispatcher.textScaleFactor,
          // displayConstraints: BoxConstraints.fromViewConstraints(
          //   WidgetsBinding.instance.platformDispatcher.implicitView?.physicalConstraints ?? ViewConstraints.tight(Size.zero),
          // ),
          // displayWidthMode: BoxConstraints.fromViewConstraints(
          //   WidgetsBinding.instance.platformDispatcher.implicitView?.physicalConstraints ?? ViewConstraints.tight(Size.zero),
          // ).toDisplayWidthMode(),
          displayConstraints: BoxConstraints.loose(
            WidgetsBinding.instance.platformDispatcher.implicitView?.physicalSize ?? Size.zero,
          ),
          displayWidthMode: BoxConstraints.loose(
            WidgetsBinding.instance.platformDispatcher.implicitView?.physicalSize ?? Size.zero,
          ).toDisplayWidthMode(),
        ),
        options: SignalOptions(name: "RuntimeInfoSignal"),
      ) {
    final appLifecycleListener = AppLifecycleListener(
      onStateChange: (appLifecycleState) {
        setAppLifecycleState(appLifecycleState);
      },
    );
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged = () {
      setBrightness(WidgetsBinding.instance.platformDispatcher.platformBrightness);
    };
    WidgetsBinding.instance.platformDispatcher.onLocaleChanged = () {
      setLocale(WidgetsBinding.instance.platformDispatcher.locale);
    };
    WidgetsBinding.instance.platformDispatcher.onTextScaleFactorChanged = () {
      setTextScaleFactor(WidgetsBinding.instance.platformDispatcher.textScaleFactor);
    };
    WidgetsBinding.instance.platformDispatcher.onMetricsChanged = () {
      // final displayConstraints = BoxConstraints.fromViewConstraints(
      //   WidgetsBinding.instance.platformDispatcher.implicitView?.physicalConstraints ?? ViewConstraints.tight(Size.zero),
      // );
      final displayConstraints = BoxConstraints.loose(
        WidgetsBinding.instance.platformDispatcher.implicitView?.physicalSize ?? Size.zero,
      );
      setDisplayConstraints(displayConstraints);
    };
    onDispose(() {
      appLifecycleListener.dispose();
      WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged = null;
      WidgetsBinding.instance.platformDispatcher.onLocaleChanged = null;
      WidgetsBinding.instance.platformDispatcher.onTextScaleFactorChanged = null;
      WidgetsBinding.instance.platformDispatcher.onMetricsChanged = null;
    });
  }

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
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    final textScaleFactor = WidgetsBinding.instance.platformDispatcher.textScaleFactor;
    if (debugLogDiagnostics) {
      developer.log("RuntimeInfoSignal refresh brightness $brightness, locale $locale, textScaleFactor $textScaleFactor");
    }
    value = peek().copyWith(brightness: brightness, locale: locale, textScaleFactor: textScaleFactor);
  }
}
