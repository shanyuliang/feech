import 'package:feech/feech.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('appPermissionStatusProvider', () async {
    final container = ProviderContainer.test();
    final provider = appPermissionStatusProvider(Permission.camera);

    final initialState = container.read(provider);
    expect(initialState, equals(const AppPermissionStatus(permission: Permission.camera)));

    await Future.delayed(const Duration(seconds: 1));

    final followingState = container.read(provider);
    expect(followingState.error.runtimeType, MissingPluginException);
  });
}
