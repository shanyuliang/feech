import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_lifecycle_state_notifier.dart';
import 'app_lifecycle_state_notifier_impl.dart';

/// Provide app lifecycle state.
///
/// Please note before the first time the notifier receives binding's update, the state will be null.
/// Please note you won't be notified of the very first `resumed` app state since this provider is not initialized at that time.
/// If you do need to do something when the app is launched the first time, you may do it by using a app-stateful-widget and
/// override the initState callback method.
final appLifecycleStateProvider =
    StateNotifierProvider<AppLifecycleStateNotifier, AppLifecycleState?>((ref) => getAppLifecycleStateNotifier());
