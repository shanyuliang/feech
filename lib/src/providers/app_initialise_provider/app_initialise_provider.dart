import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_initialise_provider.g.dart';

@Riverpod(keepAlive: true)
class AppInitialiseProvider extends _$AppInitialiseProvider {
  /// [initialiseList] is a list of `AsyncNotifierProvider`
  @override
  Future<void> build({List<AsyncNotifierProvider> initialiseList = const [], int minWaitDurationInMilliseconds = 0}) async {
    final minWaitDuration = Future.delayed(Duration(milliseconds: minWaitDurationInMilliseconds));
    final initialisingProviders = Future(() async {
      for (final asyncNotifierProvider in initialiseList) {
        await ref.read(asyncNotifierProvider.future);
      }
    });
    await Future.wait([minWaitDuration, initialisingProviders]);
  }
}
