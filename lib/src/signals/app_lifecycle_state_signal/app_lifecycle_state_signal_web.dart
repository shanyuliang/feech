import 'dart:js_interop';

import 'package:flutter/widgets.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:web/web.dart';

class AppLifecycleStateSignal extends Signal<AppLifecycleState> {
  final bool debugLogDiagnostics;

  AppLifecycleStateSignal({this.debugLogDiagnostics = false}) : super(AppLifecycleState.resumed) {
    void onFocus(Event e) {
      value = AppLifecycleState.resumed;
    }

    void onBlur(Event e) {
      value = AppLifecycleState.paused;
    }

    window.addEventListener('focus', onFocus.toJS);
    window.addEventListener('blur', onBlur.toJS);
    onDispose(() {
      window.removeEventListener('focus', onFocus.toJS);
      window.removeEventListener('blur', onBlur.toJS);
    });
  }
}
