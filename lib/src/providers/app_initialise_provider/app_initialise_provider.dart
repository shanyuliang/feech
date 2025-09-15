// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';
import 'dart:developer' as developer;

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants.dart';

part 'app_initialise_provider.g.dart';

@Riverpod(keepAlive: true)
class AppInitialiseProvider extends _$AppInitialiseProvider {
  /// [initialiseList] is a list of `provider.notifier` or `asyncProvider.future`
  @override
  Future<void> build({
    List<ProviderListenable> initialiseList = const [],
    int minWaitDurationInMilliseconds = 0,
    bool inOrder = false,
    bool debugLogDiagnostics = false,
  }) async {
    final minWaitDuration = Duration(milliseconds: minWaitDurationInMilliseconds);
    if (debugLogDiagnostics) {
      developer.log("AppInitialiseProvider minWaitDuration $minWaitDuration", name: debugTag);
    }
    final waitForMinWaitDuration = Future.delayed(minWaitDuration, () {
      if (debugLogDiagnostics) {
        developer.log("AppInitialiseProvider minWaitDuration $minWaitDuration passed", name: debugTag);
      }
    });

    developer.log("AppInitialiseProvider initialisingProviders setup begin", name: debugTag);
    final initialisingProviders = inOrder
        ? Future(() async {
            for (final element in initialiseList) {
              if (debugLogDiagnostics) {
                developer.log("AppInitialiseProvider initialise $element started", name: debugTag);
              }
              await ref.read(element);
              if (debugLogDiagnostics) {
                developer.log("AppInitialiseProvider initialise $element ended", name: debugTag);
              }
            }
          })
        : Future.wait(
            initialiseList.map((element) {
              return Future(() async {
                if (debugLogDiagnostics) {
                  developer.log("AppInitialiseProvider initialise $element started", name: debugTag);
                }
                await ref.read(element);
                if (debugLogDiagnostics) {
                  developer.log("AppInitialiseProvider initialise $element ended", name: debugTag);
                }
              });
            }),
          );
    developer.log("AppInitialiseProvider initialisingProviders setup end", name: debugTag);

    await Future.wait([waitForMinWaitDuration, initialisingProviders]);
  }
}
