// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_initialise_provider.g.dart';

@Riverpod(keepAlive: true)
class AppInitialiseProvider extends _$AppInitialiseProvider {
  /// [initialiseList] is a list of `AsyncNotifierProvider`
  @override
  Future<void> build({
    List<Object> initialiseListNew = const [],
    List<AsyncNotifierProvider> initialiseList = const [],
    int minWaitDurationInMilliseconds = 0,
  }) async {
    final minWaitDuration = Future.delayed(Duration(milliseconds: minWaitDurationInMilliseconds));
    final initialisingProviders = Future(() async {
      for (final asyncNotifierProvider in initialiseList) {
        await ref.read(asyncNotifierProvider.future);
      }
    });
    final initialisingProvidersNew = Future(() async {
      for (final theProvider in initialiseListNew) {
        if (theProvider is AsyncNotifierProvider) {
          await ref.read(theProvider.future);
        } else if (theProvider is NotifierProvider) {
          ref.read(theProvider);
        }
      }
    });
    await Future.wait([minWaitDuration, initialisingProviders, initialisingProvidersNew]);
  }
}
