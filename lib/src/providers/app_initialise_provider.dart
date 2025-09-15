// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/misc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants.dart';

part 'app_initialise_provider.g.dart';

@Riverpod(keepAlive: true)
class AppInitialiseProvider extends _$AppInitialiseProvider {
  @override
  Future<void> build({
    List<ProviderBase> initialiseList = const [],
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
                developer.log("AppInitialiseProvider initialise $element [${element.runtimeType}] started", name: debugTag);
              }
              switch (element) {
                case $AsyncNotifierProvider anp:
                  developer.log("AppInitialiseProvider $element [${element.runtimeType}] is an AsyncNotifierProvider", name: debugTag);
                  await ref.read(anp.future);
                  break;
                case $NotifierProvider np:
                  developer.log("AppInitialiseProvider $element [${element.runtimeType}] is a NotifierProvider", name: debugTag);
                  ref.read(np);
                  break;
                default:
                  developer.log("AppInitialiseProvider $element [${element.runtimeType}] is an unknown provider", name: debugTag);
                  break;
              }
              if (debugLogDiagnostics) {
                developer.log("AppInitialiseProvider initialise $element [${element.runtimeType}] ended", name: debugTag);
              }
            }
          })
        : Future.wait(
            initialiseList.map((element) {
              return Future(() async {
                if (debugLogDiagnostics) {
                  developer.log("AppInitialiseProvider initialise $element [${element.runtimeType}] started", name: debugTag);
                }
                switch (element) {
                  case $AsyncNotifierProvider anp:
                    developer.log("AppInitialiseProvider $element [${element.runtimeType}] is an AsyncNotifierProvider", name: debugTag);
                    await ref.read(anp.future);
                    break;
                  case $NotifierProvider np:
                    developer.log("AppInitialiseProvider $element [${element.runtimeType}] is a NotifierProvider", name: debugTag);
                    ref.read(np);
                    break;
                  default:
                    developer.log("AppInitialiseProvider $element [${element.runtimeType}] is an unknown provider", name: debugTag);
                    break;
                }
                if (debugLogDiagnostics) {
                  developer.log("AppInitialiseProvider initialise $element [${element.runtimeType}] ended", name: debugTag);
                }
              });
            }),
          );
    developer.log("AppInitialiseProvider initialisingProviders setup end", name: debugTag);

    await Future.wait([waitForMinWaitDuration, initialisingProviders]);
  }
}
