import 'package:feech/feech.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('userLocationProvider', () async {
    final container = ProviderContainer.test();

    final initialState = container.read(userLocationProvider);
    expect(initialState, equals(const UserLocation()));

    await Future.delayed(const Duration(seconds: 1));

    final followingState = container.read(userLocationProvider);
    expect(followingState.error.runtimeType, MissingPluginException);
  });
}
