import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_provider.g.dart';

@Riverpod(keepAlive: true)
class SharedPreferencesProvider extends _$SharedPreferencesProvider {
  @override
  Future<SharedPreferences> build() async {
    return SharedPreferences.getInstance();
  }
}
