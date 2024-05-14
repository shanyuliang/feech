import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../constants.dart';
import '../extensions/general_type_extension.dart';

class AppNavigatorObserver extends NavigatorObserver {
  final void Function(Route route)? onRouteResumed;
  final void Function(Route route)? onRoutePaused;
  final bool debugLogDiagnostics;

  AppNavigatorObserver({this.onRouteResumed, this.onRoutePaused, this.debugLogDiagnostics = false});

  @override
  void didPush(Route route, Route? previousRoute) async {
    super.didPush(route, previousRoute);
    onRouteResumed?.call(route);
    previousRoute?.let((it) {
      onRoutePaused?.call(it);
    });
    if (debugLogDiagnostics) {
      developer.log("Navigator didPush route ${route.settings} previousRoute ${previousRoute?.settings}", name: debugTag);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) async {
    super.didPop(route, previousRoute);
    onRoutePaused?.call(route);
    previousRoute?.let((it) {
      onRouteResumed?.call(it);
    });
    if (debugLogDiagnostics) {
      developer.log("Navigator didPop route ${route.settings} previousRoute ${previousRoute?.settings}", name: debugTag);
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) async {
    super.didRemove(route, previousRoute);
    onRoutePaused?.call(route);
    previousRoute?.let((it) {
      onRouteResumed?.call(it);
    });
    if (debugLogDiagnostics) {
      developer.log("Navigator didRemove route ${route.settings} previousRoute ${previousRoute?.settings}", name: debugTag);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    newRoute?.let((it) {
      onRouteResumed?.call(it);
    });
    oldRoute?.let((it) {
      onRoutePaused?.call(it);
    });
    if (debugLogDiagnostics) {
      developer.log("Navigator didReplace newRoute ${newRoute?.settings} oldRoute ${oldRoute?.settings}", name: debugTag);
    }
  }
}
