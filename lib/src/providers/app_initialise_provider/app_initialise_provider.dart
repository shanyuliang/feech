// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants.dart';

part 'app_initialise_provider.g.dart';

@Riverpod(keepAlive: true)
class AppInitialiseProvider extends _$AppInitialiseProvider {
  /// [initialiseList] is a list of `provider.notifier` or `asyncProvider.future`
  @override
  Future<void> build({List<Refreshable> initialiseList = const [], int minWaitDurationInMilliseconds = 0, bool debugLogDiagnostics = false}) async {
    final minWaitDuration = Duration(milliseconds: minWaitDurationInMilliseconds);
    if (debugLogDiagnostics) {
      developer.log("AppInitialiseProvider minWaitDuration $minWaitDuration", name: debugTag);
    }
    final waitForMinWaitDuration = Future.delayed(minWaitDuration, () {
      if (debugLogDiagnostics) {
        developer.log("AppInitialiseProvider minWaitDuration $minWaitDuration passed", name: debugTag);
      }
    });

    final initialisingProviders = Future.wait(
      initialiseList.map((element) {
        return Future(() {
          if (debugLogDiagnostics) {
            developer.log("AppInitialiseProvider initialise $element started", name: debugTag);
          }
        }).then((_) {
          ref.read<dynamic>(element).then(() {
            if (debugLogDiagnostics) {
              developer.log("AppInitialiseProvider initialise $element ended", name: debugTag);
            }
          });
        });
      }),
    );

    // final initialisingProviders = Future(() async {
    //   for (final alwaysAliveRefreshable in initialiseList) {
    //     if (debugLogDiagnostics) {
    //       developer.log("AppInitialiseProvider initialise $alwaysAliveRefreshable started", name: debugTag);
    //     }
    //     final a=await ref.read(alwaysAliveRefreshable);
    //     if (debugLogDiagnostics) {
    //       developer.log("AppInitialiseProvider initialise $alwaysAliveRefreshable ended", name: debugTag);
    //     }
    //   }
    // });
    await Future.wait([waitForMinWaitDuration, initialisingProviders]);
  }
}
