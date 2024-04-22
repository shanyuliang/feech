import 'app_lifecycle_state_notifier.dart';

class AppLifecycleStateNotifierStub extends AppLifecycleStateNotifier {
  AppLifecycleStateNotifierStub(super.state) {
    throw UnsupportedError("Platform not supported");
  }
}

AppLifecycleStateNotifier getAppLifecycleStateNotifier() => AppLifecycleStateNotifierStub(null);
