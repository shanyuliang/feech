import 'package:feech/feech.dart';
import 'package:flutter/services.dart';
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

  test('userLocationProvider', () async {
    final container = createContainer();

    final initialState = container.read(userLocationProvider);
    expect(initialState, equals(const UserLocationState()));

    await Future.delayed(const Duration(seconds: 1));

    final followingState = container.read(userLocationProvider);
    expect(followingState.error.runtimeType, MissingPluginException);
  });
}
