import 'package:feech/feech.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('appLoggingProvider', () async {
    final container = ProviderContainer.test();
    final testLoggingProvider = loggingProvider(
      actionLoggingList: () => [
        ConsoleLogging(),
        CrashlyticsLogging(),
        NewRelicLogging(accessToken: 'AA5d973d22f76e3014f35df8fbfd0eb3394a744b0c-NRMA', eventType: 'Flutter Base', maxEventBufferTimeInSeconds: 60),
      ],
    );

    final logging = await container.read(testLoggingProvider.future);

    logging.logger.info("info message");
    logging.logger.severe("severe message", Exception("severe error"));
    logging.logger.shout("fatal message", Exception("fatal error"));
  });
}
