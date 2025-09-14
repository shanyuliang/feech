import 'package:feech/feech.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('appInitialiseProvider', () async {
    final container = ProviderContainer.test(observers: [AppProviderObserver()]);
    final testLoggingProvider = loggingProvider(
      actionLoggingList: () => [
        ConsoleLogging(),
        CrashlyticsLogging(),
        NewRelicLogging(accessToken: 'AA5d973d22f76e3014f35df8fbfd0eb3394a744b0c-NRMA', eventType: 'Flutter Base', maxEventBufferTimeInSeconds: 60),
      ],
    );

    final testAppInitialiseProvider = appInitialiseProvider(
      initialiseList: [
        appLifecycleStateProvider.notifier,
        appPermissionStatusProvider(Permission.location).notifier,
        appPermissionStatusProvider(Permission.notification).notifier,
        testLoggingProvider.future,
        userLocationProvider.notifier,
      ],
    );
    await container.read(testAppInitialiseProvider.future);

    final logging = container.read(testLoggingProvider).requireValue;

    logging.logger.info("info message");
    logging.logger.severe("severe message", Exception("severe error"));
    logging.logger.shout("fatal message", Exception("fatal error"));
  });
}
