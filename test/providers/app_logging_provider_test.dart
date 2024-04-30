import 'package:feech/feech.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('appLoggingProvider', () async {
    final container = createContainer();
    final testLoggingProvider = appLoggingProvider(
        actionLoggingList: () => [
              ConsoleLogging(),
              CrashlyticsLogging(),
              NewRelicLogging(
                accessToken: 'AA5d973d22f76e3014f35df8fbfd0eb3394a744b0c-NRMA',
                eventType: 'Flutter Base',
                maxEventBufferTimeInSeconds: 60,
              ),
            ]);

    container.read(testLoggingProvider);

    await Future.delayed(const Duration(seconds: 1));

    final followingState = container.read(testLoggingProvider);

    followingState.logging.logger.info("info message");
    followingState.logging.logger.severe("severe message", Exception("severe error"));
    followingState.logging.logger.shout("fatal message", Exception("fatal error"));
  });
}
