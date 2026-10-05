import 'dart:developer' as developer;

import 'package:flutter/widgets.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../extensions/size_extension.dart';
import '../models/runtime_info.dart';

class RuntimeInfoSignal extends Signal<RuntimeInfo> {
  final bool debugLogDiagnostics;

  RuntimeInfoSignal({this.debugLogDiagnostics = false}) : super(_readRuntimeInfo(), options: SignalOptions(name: "RuntimeInfoSignal")) {
    final appLifecycleListener = AppLifecycleListener(
      onStateChange: (appLifecycleState) {
        setAppLifecycleState(appLifecycleState);
      },
    );
    final widgetsBinding = WidgetsBinding.instance;
    final platformDispatcher = widgetsBinding.platformDispatcher;
    platformDispatcher.onPlatformBrightnessChanged = () {
      widgetsBinding.handlePlatformBrightnessChanged();
      setBrightness(platformDispatcher.platformBrightness);
    };
    platformDispatcher.onLocaleChanged = () {
      setLocale(platformDispatcher.locale);
    };
    platformDispatcher.onTextScaleFactorChanged = () {
      widgetsBinding.handleTextScaleFactorChanged();
      setTextScaleFactor(platformDispatcher.textScaleFactor);
    };
    platformDispatcher.onMetricsChanged = () {
      widgetsBinding.handleMetricsChanged();
      final devicePixelRatio = platformDispatcher.implicitView?.devicePixelRatio ?? 1.0;
      final physicalDisplaySize = platformDispatcher.implicitView?.physicalSize ?? Size.zero;
      setDevicePixelRatioAndPhysicalDisplaySize(devicePixelRatio, physicalDisplaySize);
    };
    onDispose(() {
      appLifecycleListener.dispose();
      platformDispatcher.onPlatformBrightnessChanged = null;
      platformDispatcher.onLocaleChanged = null;
      platformDispatcher.onTextScaleFactorChanged = null;
      platformDispatcher.onMetricsChanged = null;
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
    final runtimeInfo = _readRuntimeInfo();

    if (debugLogDiagnostics) {
      developer.log(
        "RuntimeInfoSignal refresh appLifecycleState ${runtimeInfo.appLifecycleState}, brightness ${runtimeInfo.brightness}, locale ${runtimeInfo.locale}, textScaleFactor ${runtimeInfo.textScaleFactor}, devicePixelRatio ${runtimeInfo.devicePixelRatio}, physicalDisplaySize ${runtimeInfo.physicalDisplaySize}, logicalDisplaySize ${runtimeInfo.logicalDisplaySize}, displayWidthMode ${runtimeInfo.displayWidthMode}",
      );
    }
    value = runtimeInfo;
  }

  static RuntimeInfo _readRuntimeInfo() {
    final widgetsBinding = WidgetsBinding.instance;
    final platformDispatcher = widgetsBinding.platformDispatcher;
    final devicePixelRatio = platformDispatcher.implicitView?.devicePixelRatio ?? 1.0;
    final physicalDisplaySize = platformDispatcher.implicitView?.physicalSize ?? Size.zero;
    final logicalDisplaySize = physicalDisplaySize / devicePixelRatio;
    return RuntimeInfo(
      appLifecycleState: widgetsBinding.lifecycleState,
      brightness: platformDispatcher.platformBrightness,
      locale: platformDispatcher.locale,
      textScaleFactor: platformDispatcher.textScaleFactor,
      devicePixelRatio: devicePixelRatio,
      physicalDisplaySize: physicalDisplaySize,
      logicalDisplaySize: logicalDisplaySize,
      displayWidthMode: logicalDisplaySize.toDisplayWidthMode(),
    );
  }
}
