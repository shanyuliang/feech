// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lifecycle_state_provider_web.g.dart';

@Riverpod(keepAlive: true)
class AppLifecycleStateProvider extends _$AppLifecycleStateProvider {
  @override
  AppLifecycleState build() {
    void onFocus(Event e) {
      state = AppLifecycleState.resumed;
    }

    void onBlur(Event e) {
      state = AppLifecycleState.paused;
    }

    window.addEventListener('focus', onFocus);
    window.addEventListener('blur', onBlur);
    ref.onDispose(() {
      window.removeEventListener('focus', onFocus);
      window.removeEventListener('blur', onBlur);
    });
    return AppLifecycleState.resumed;
  }
}
