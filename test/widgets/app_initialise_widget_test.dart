import 'package:feech/feech.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';

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
  final testLoggingProvider = loggingProvider(
      actionLoggingList: () => [
            ConsoleLogging(),
            CrashlyticsLogging(),
            NewRelicLogging(
              accessToken: 'AA5d973d22f76e3014f35df8fbfd0eb3394a744b0c-NRMA',
              eventType: 'Flutter Base',
              maxEventBufferTimeInSeconds: 60,
            ),
          ]);

  testWidgets('AppStartupWidget', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: AppInitialiseWidget(
          initialiseList: [
            appLifecycleStateProvider.notifier,
            appPermissionStatusProvider(Permission.location).notifier,
            appPermissionStatusProvider(Permission.notification).notifier,
            testLoggingProvider.future,
            userLocationProvider.notifier,
          ],
          loadedChild: const MaterialApp(home: Material(child: Text("Loaded"))),
          loadingChild: const MaterialApp(home: Material(child: Text("Loading"))),
          debugLogDiagnostics: true,
        ),
      ),
    );

    final loadingFinder = find.text('Loading');
    final loadedFinder = find.text('Loaded');

    await tester.pumpAndSettle();
    expect(loadingFinder, findsOneWidget);
    expect(loadedFinder, findsNothing);

    await tester.runAsync(
      () async {
        await Future.delayed(const Duration(seconds: 1));
        await tester.pumpAndSettle();
        expect(loadingFinder, findsNothing);
        expect(loadedFinder, findsOneWidget);
      },
    );
  });
}
