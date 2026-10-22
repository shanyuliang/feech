import 'package:collection/collection.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'tts_locale_voices.dart';

part 'tts.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class const Tts({
  required final FlutterTts flutterTts,
  required final List<TtsLocaleVoices> allLocaleVoices,
  final String? selectedLocaleId,
  final String? selectedVoiceId,
}) with _$Tts {
  List<String> getSupportedLocales() {
    return allLocaleVoices.map((e) => e.localeId).toList()..sort();
  }

  List<String> getSupportedVoices(String? localeId) {
    return (allLocaleVoices.firstWhereOrNull((element) => element.localeId == localeId)?.voiceIds ?? [])..sort();
  }
}
