import 'package:flutter/widgets.dart';

import 'app_lifecycle_state_notifier.dart';

class AppLifecycleStateNotifierMobile extends AppLifecycleStateNotifier {
  AppLifecycleStateNotifierMobile() : super(null) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    this.state = state;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

AppLifecycleStateNotifier getAppLifecycleStateNotifier() => AppLifecycleStateNotifierMobile();
