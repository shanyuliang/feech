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
    final initialState = container.read(appLoggingProvider(
        actionLoggingList: () => [
              ConsoleLogging(),
              CrashlyticsLogging(),
              NewRelicLogging(
                accessToken: 'AA5d973d22f76e3014f35df8fbfd0eb3394a744b0c-NRMA',
                eventType: 'Flutter Base',
                maxEventBufferTimeInSeconds: 60,
              ),
            ]));
    await initialState.initialise();
    initialState.logger.severe("severe message", Exception("severe error"));
  });
}
