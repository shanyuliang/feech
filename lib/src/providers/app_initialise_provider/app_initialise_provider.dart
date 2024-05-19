// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_initialise_provider.g.dart';

@Riverpod(keepAlive: true)
class AppInitialiseProvider extends _$AppInitialiseProvider {
  /// [initialiseList] is a list of `provider.notifier` or `asyncProvider.future`
  @override
  Future<void> build({
    List<AlwaysAliveRefreshable> initialiseList = const [],
    int minWaitDurationInMilliseconds = 0,
  }) async {
    final minWaitDuration = Future.delayed(Duration(milliseconds: minWaitDurationInMilliseconds));
    final initialisingProviders = Future(() async {
      for (final alwaysAliveRefreshable in initialiseList) {
        await ref.read(alwaysAliveRefreshable);
      }
    });
    await Future.wait([minWaitDuration, initialisingProviders]);
  }
}
