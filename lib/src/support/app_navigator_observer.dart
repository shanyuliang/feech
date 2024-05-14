import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../constants.dart';

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) async {
    super.didPush(route, previousRoute);
    developer.log("Navigator didPush route ${route.settings} previousRoute ${previousRoute?.settings}", name: debugTag);
  }

  @override
  void didPop(Route route, Route? previousRoute) async {
    super.didPop(route, previousRoute);
    developer.log("Navigator didPop route ${route.settings} previousRoute ${previousRoute?.settings}", name: debugTag);
  }

  @override
  void didRemove(Route route, Route? previousRoute) async {
    super.didRemove(route, previousRoute);
    developer.log("Navigator didRemove route ${route.settings} previousRoute ${previousRoute?.settings}", name: debugTag);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    developer.log("Navigator didReplace newRoute ${newRoute?.settings} oldRoute ${oldRoute?.settings}", name: debugTag);
  }
}
