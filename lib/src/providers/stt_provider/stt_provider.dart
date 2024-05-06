import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../constants.dart';
import '../../extensions/general_type_extension.dart';
import '../../models/app_locale.dart';
import '../../models/stt.dart';
import '../shared_preferences_provider/shared_preferences_provider.dart';

part 'stt_provider.g.dart';

@Riverpod(keepAlive: true)
class SttProvider extends _$SttProvider {
  @override
  Future<Stt> build() async {
    final speech = SpeechToText();
    final locales = await speech.locales();
    final allLocales = locales.map((e) => AppLocale(localeId: e.localeId, localeName: e.name)).toList();
    final sharedPreferences = ref.read(sharedPreferencesProvider).requireValue;
    final lastLocaleId = sharedPreferences.getString(spKeyLastSttLocaleId);
    final selectedLocale =
        lastLocaleId?.let((it) => allLocales.firstWhereOrNull((appLocale) => appLocale.localeId == it)) ?? allLocales.firstOrNull;
    return Stt(
      supportedLocales: allLocales,
      selectedLocale: selectedLocale,
    );
  }

  void setSelectedLocale(AppLocale? appLocale) {
    update((previousState) {
      appLocale?.localeId.let((localeId) {
        ref.read(sharedPreferencesProvider).requireValue.setString(spKeyLastSttLocaleId, localeId);
      });
      return previousState.copyWith(selectedLocale: appLocale);
    });
  }
}
