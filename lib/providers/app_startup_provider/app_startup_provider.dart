import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup_provider.g.dart';

@Riverpod(keepAlive: true)
class AppStartup extends _$AppStartup {
  /// [waitList] is a list of `provider.notifier` or `asyncProvider.future`
  @override
  Future<void> build({List<AlwaysAliveRefreshable> waitList = const []}) async {
    for (final alwaysAliveRefreshable in waitList) {
      await ref.watch(alwaysAliveRefreshable);
    }
  }
}
