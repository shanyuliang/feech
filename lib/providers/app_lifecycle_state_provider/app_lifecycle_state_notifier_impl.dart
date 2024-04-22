/// This barrel file exports the specific implementation of app_lifecycle_state_notifier for the compiling target platform
library;
export 'app_lifecycle_state_notifier_stub.dart'
    if (dart.library.io) 'app_lifecycle_state_notifier_mobile.dart'
    if (dart.library.html) 'app_lifecycle_state_notifier_web.dart';
