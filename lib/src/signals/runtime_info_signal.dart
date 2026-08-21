import 'dart:developer' as developer;

import 'package:flutter/widgets.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../extensions/size_extension.dart';
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
          devicePixelRatio: WidgetsBinding.instance.platformDispatcher.implicitView?.devicePixelRatio ?? 1.0,
          physicalDisplaySize: WidgetsBinding.instance.platformDispatcher.implicitView?.physicalSize ?? Size.zero,
          logicalDisplaySize:
              (WidgetsBinding.instance.platformDispatcher.implicitView?.physicalSize ?? Size.zero) /
              (WidgetsBinding.instance.platformDispatcher.implicitView?.devicePixelRatio ?? 1.0),
          displayWidthMode:
              ((WidgetsBinding.instance.platformDispatcher.implicitView?.physicalSize ?? Size.zero) /
                      (WidgetsBinding.instance.platformDispatcher.implicitView?.devicePixelRatio ?? 1.0))
                  .toDisplayWidthMode(),
        ),
        options: SignalOptions(name: "RuntimeInfoSignal"),
      ) {
    final appLifecycleListener = AppLifecycleListener(
      onStateChange: (appLifecycleState) {
        setAppLifecycleState(appLifecycleState);
      },
    );
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
      setBrightness(WidgetsBinding.instance.platformDispatcher.platformBrightness);
    };
    WidgetsBinding.instance.platformDispatcher.onLocaleChanged = () {
      setLocale(WidgetsBinding.instance.platformDispatcher.locale);
    };
    WidgetsBinding.instance.platformDispatcher.onTextScaleFactorChanged = () {
      WidgetsBinding.instance.handleTextScaleFactorChanged();
      setTextScaleFactor(WidgetsBinding.instance.platformDispatcher.textScaleFactor);
    };
    WidgetsBinding.instance.platformDispatcher.onMetricsChanged = () {
      WidgetsBinding.instance.handleMetricsChanged();
      final devicePixelRatio = WidgetsBinding.instance.platformDispatcher.implicitView?.devicePixelRatio ?? 1.0;
      final physicalDisplaySize = WidgetsBinding.instance.platformDispatcher.implicitView?.physicalSize ?? Size.zero;
      setDevicePixelRatioAndPhysicalDisplaySize(devicePixelRatio, physicalDisplaySize);
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

  void setDevicePixelRatioAndPhysicalDisplaySize(double devicePixelRatio, Size physicalDisplaySize) {
    final logicalDisplaySize = physicalDisplaySize / devicePixelRatio;
    final displayWidthMode = logicalDisplaySize.toDisplayWidthMode();
    if (debugLogDiagnostics) {
      developer.log("RuntimeInfoSignal setDevicePixelRatio $devicePixelRatio");
      developer.log("RuntimeInfoSignal setPhysicalDisplaySize $physicalDisplaySize");
      developer.log("RuntimeInfoSignal setLogicalDisplaySize $logicalDisplaySize");
      developer.log("RuntimeInfoSignal setDisplayWidthMode $displayWidthMode");
    }
    value = peek().copyWith(
      devicePixelRatio: devicePixelRatio,
      physicalDisplaySize: physicalDisplaySize,
      logicalDisplaySize: logicalDisplaySize,
      displayWidthMode: displayWidthMode,
    );
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
