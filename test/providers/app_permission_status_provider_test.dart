import 'package:feech/feech.dart';
import 'package:flutter/services.dart';
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
  TestWidgetsFlutterBinding.ensureInitialized();

  test('appPermissionStatusProvider', () async {
    final container = createContainer();
    final provider = appPermissionStatusProvider(Permission.camera);

    final initialState = container.read(provider);
    expect(initialState, equals(const AppPermissionStatusState(permission: Permission.camera)));

    await Future.delayed(const Duration(seconds: 1));

    final followingState = container.read(provider);
    expect(followingState.error.runtimeType, MissingPluginException);
  });
}
