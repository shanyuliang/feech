// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/widgets.dart';

import 'app_lifecycle_state_notifier.dart';

class AppLifecycleStateNotifierWeb extends AppLifecycleStateNotifier {
  AppLifecycleStateNotifierWeb() : super(null) {
    window.addEventListener('focus', onFocus);
    window.addEventListener('blur', onBlur);
  }

  void onFocus(Event e) {
    didChangeAppLifecycleState(AppLifecycleState.resumed);
  }

  void onBlur(Event e) {
    didChangeAppLifecycleState(AppLifecycleState.paused);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    this.state = state;
  }

  @override
  void dispose() {
    window.removeEventListener('focus', onFocus);
    window.removeEventListener('blur', onBlur);
    super.dispose();
  }
}

AppLifecycleStateNotifier getAppLifecycleStateNotifier() => AppLifecycleStateNotifierWeb();
