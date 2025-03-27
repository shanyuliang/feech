import 'dart:js_interop';

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web/web.dart';

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

    window.addEventListener('focus', onFocus.toJS);
    window.addEventListener('blur', onBlur.toJS);
    ref.onDispose(() {
      window.removeEventListener('focus', onFocus.toJS);
      window.removeEventListener('blur', onBlur.toJS);
    });
    return AppLifecycleState.resumed;
  }
}
