import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AppLifecycleStateNotifier extends StateNotifier<AppLifecycleState?> with WidgetsBindingObserver {
  AppLifecycleStateNotifier(super.state);
}
