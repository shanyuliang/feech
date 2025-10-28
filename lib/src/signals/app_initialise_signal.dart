import 'dart:developer' as developer;

import 'package:signals_flutter/signals_flutter.dart';

import '../constants.dart';

class AppInitialiseSignal extends FutureSignal<bool> {
  AppInitialiseSignal({
    List<FutureSignal> initialiseList = const [],
    int minWaitDurationInMilliseconds = 0,
    bool inOrder = false,
    bool debugLogDiagnostics = false,
  }) : super(() async {
         final minWaitDuration = Duration(milliseconds: minWaitDurationInMilliseconds);
         if (debugLogDiagnostics) {
           developer.log("AppInitialiseSignal minWaitDuration $minWaitDuration", name: debugTag);
         }
         final waitForMinWaitDuration = Future.delayed(minWaitDuration, () {
           if (debugLogDiagnostics) {
             developer.log("AppInitialiseSignal minWaitDuration $minWaitDuration passed", name: debugTag);
           }
         });

         final initialisingProviders = inOrder
             ? Future(() async {
                 for (final element in initialiseList) {
                   if (debugLogDiagnostics) {
                     developer.log("AppInitialiseSignal initialise $element started", name: debugTag);
                   }
                   await element.future;
                   if (debugLogDiagnostics) {
                     developer.log("AppInitialiseSignal initialise $element ended", name: debugTag);
                   }
                 }
               })
             : Future.wait(
                 initialiseList.map((element) {
                   return Future(() async {
                     if (debugLogDiagnostics) {
                       developer.log("AppInitialiseSignal initialise $element started", name: debugTag);
                     }
                     await element.future;
                     if (debugLogDiagnostics) {
                       developer.log("AppInitialiseSignal initialise $element ended", name: debugTag);
                     }
                   });
                 }),
               );

         await Future.wait([waitForMinWaitDuration, initialisingProviders]);
         return true;
       }, debugLabel: "AppInitialiseSignal");
}
