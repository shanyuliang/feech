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

  test('appAssetManifestProvider', () async {
    final container = createContainer();

    await container.read(appAssetManifestProvider(debugLogDiagnostics: true).future);
    container.read(appAssetManifestProvider(debugLogDiagnostics: true).notifier).getActionAssetName("assets/data/toilets_filtered.json");
    await Future.delayed(const Duration(seconds: 1));
    //await container.read(appAssetManifestProvider.future);
    //expect(initialState, equals(const UserLocation()));

  });
}
