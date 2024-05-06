import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lifecycle_state_provider_native.g.dart';

@Riverpod(keepAlive: true)
class AppLifecycleStateProvider extends _$AppLifecycleStateProvider {
  @override
  AppLifecycleState build() {
    final appLifecycleListener = AppLifecycleListener(onStateChange: (appLifecycleState) {
      state = appLifecycleState;
    });
    ref.onDispose(appLifecycleListener.dispose);
    return AppLifecycleState.resumed;
  }
}
