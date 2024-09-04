import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../extensions/general_type_extension.dart';
import 'app_locale.dart';
import 'stt.dart';

part 'stt_provider.g.dart';

@Riverpod(keepAlive: true)
class SttProvider extends _$SttProvider {
  late final SharedPreferences _sharedPreferences;
  final _spKeyLastSttLocaleId = "last-stt-locale-id";

  @override
  Future<Stt> build() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final speech = SpeechToText();
    final locales = await speech.locales();
    final allLocales = locales
        .map((e) => AppLocale(localeId: e.localeId, localeName: e.name))
        .toList();
    final lastLocaleId = _sharedPreferences.getString(_spKeyLastSttLocaleId);
    final selectedLocale = lastLocaleId?.let((it) => allLocales
            .firstWhereOrNull((appLocale) => appLocale.localeId == it)) ??
        allLocales.firstOrNull;
    return Stt(
      supportedLocales: allLocales,
      selectedLocale: selectedLocale,
    );
  }

  void setSelectedLocale(AppLocale? appLocale) {
    update((previousState) {
      appLocale?.localeId.let((localeId) {
        _sharedPreferences.setString(_spKeyLastSttLocaleId, localeId);
      });
      return previousState.copyWith(selectedLocale: appLocale);
    });
  }
}
