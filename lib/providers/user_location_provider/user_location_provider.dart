import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_location_state.dart';

part 'user_location_provider.g.dart';

@Riverpod(keepAlive: true)
class UserLocation extends _$UserLocation {
  @override
  Future<UserLocationState> build() async {
    return UserLocationState();
  }
}
