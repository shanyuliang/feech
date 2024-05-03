import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants.dart';
import '../../extensions/general_type_extension.dart';
import '../shared_preferences_provider/shared_preferences_provider.dart';
import '../../models/locale_voices.dart';
import '../../models/tts.dart';

part 'tts_provider.g.dart';

@Riverpod(keepAlive: true)
class TtsProvider extends _$TtsProvider {
  @override
  Future<Tts> build() async {
    final flutterTts = FlutterTts();

    /// Get all supported locales and voices
    final voices = ((await flutterTts.getVoices) as List<Object?>)
        .map((e) => e as Map<Object?, Object?>)
        .map((e) => e.map((key, value) => MapEntry(key.toString(), value.toString())))
        .toList();
    final List<LocaleVoices> allLocaleVoices = [];
    for (final element in voices) {
      final localeId = element['locale']!;
      final voiceId = element['name']!;
      LocaleVoices? localeVoices = allLocaleVoices.firstWhereOrNull((e) => e.localeId == localeId);
      if (localeVoices == null) {
        localeVoices = LocaleVoices(localeId: localeId, voiceIds: [voiceId]);
        allLocaleVoices.add(localeVoices);
      } else {
        localeVoices.voiceIds.add(voiceId);
      }
    }

    /// Get last selected locale id and voice id
    final sharedPreferences = ref.read(sharedPreferencesProvider).requireValue;
    final lastLocaleId = sharedPreferences.getString(spKeyLastTtsLocaleId);
    final lastVoiceId = sharedPreferences.getString(spKeyLastTtsVoiceId);

    /// Get system default locale and voice
    String? selectedLocaleId = lastLocaleId;
    String? selectedVoiceId = lastVoiceId;
    if (selectedLocaleId == null) {
      try {
        final defaultVoice = ((await flutterTts.getDefaultVoice) as Map<Object?, Object?>)
            .map((key, value) => MapEntry(key.toString(), value.toString()));
        selectedLocaleId = defaultVoice['locale']!;
        selectedVoiceId = defaultVoice['name']!;
      } catch (ex) {
        debugPrint(ex.toString());
      }
    }

    return Tts(
      flutterTts: flutterTts,
      allLocaleVoices: allLocaleVoices,
      selectedLocaleId: selectedLocaleId,
      selectedVoiceId: selectedVoiceId,
    );
  }

  void setSelectedLocaleId(String? localeId) {
    update(
      (previousState) {
        final voiceId = localeId?.let((it) => previousState.getSupportedVoices(it).firstOrNull);
        localeId?.let((localeId) {
          ref.read(sharedPreferencesProvider).requireValue.setString(spKeyLastTtsLocaleId, localeId);
        });
        voiceId?.let((voiceId) {
          ref.read(sharedPreferencesProvider).requireValue.setString(spKeyLastTtsVoiceId, voiceId);
        });
        return previousState.copyWith(selectedLocaleId: localeId, selectedVoiceId: voiceId);
      },
    );
  }

  void setSelectedVoiceId(String? voiceId) {
    update(
      (previousState) {
        voiceId?.let((voiceId) {
          ref.read(sharedPreferencesProvider).requireValue.setString(spKeyLastTtsVoiceId, voiceId);
        });
        return previousState.copyWith(selectedVoiceId: voiceId);
      },
    );
  }
}
