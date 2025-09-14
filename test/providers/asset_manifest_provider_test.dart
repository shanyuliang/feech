import 'package:feech/feech.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('assetManifestProvider', () async {
    final container = ProviderContainer.test();

    await container.read(assetManifestProvider(debugLogDiagnostics: true).future);
    container.read(assetManifestProvider(debugLogDiagnostics: true).notifier).getActionAssetName("assets/data/toilets_filtered.json");
    await Future.delayed(const Duration(seconds: 1));
    //await container.read(appAssetManifestProvider.future);
    //expect(initialState, equals(const UserLocation()));
  });
}
