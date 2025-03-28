import 'package:collection/collection.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'locale_voices.dart';

part 'tts.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Tts with _$Tts {
  const factory Tts({
    required final FlutterTts flutterTts,
    required final List<LocaleVoices> allLocaleVoices,
    required final String? selectedLocaleId,
    required final String? selectedVoiceId,
  }) = _Tts;

  const Tts._();

  List<String> getSupportedLocales() {
    return allLocaleVoices.map((e) => e.localeId).toList()..sort();
  }

  List<String> getSupportedVoices(String? localeId) {
    return (allLocaleVoices.firstWhereOrNull((element) => element.localeId == localeId)?.voiceIds ?? [])..sort();
  }
}
