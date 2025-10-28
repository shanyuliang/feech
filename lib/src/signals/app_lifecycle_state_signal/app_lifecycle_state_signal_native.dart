import 'package:flutter/widgets.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AppLifecycleStateSignal extends Signal<AppLifecycleState> {
  final bool debugLogDiagnostics;

  AppLifecycleStateSignal({this.debugLogDiagnostics = false}) : super(AppLifecycleState.resumed, debugLabel: "AppLifecycleStateSignal") {
    final appLifecycleListener = AppLifecycleListener(
      onStateChange: (appLifecycleState) {
        value = appLifecycleState;
      },
    );
    onDispose(appLifecycleListener.dispose);
  }
}
