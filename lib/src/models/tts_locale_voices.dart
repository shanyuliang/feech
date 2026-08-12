import 'package:freezed_annotation/freezed_annotation.dart';

part 'tts_locale_voices.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class TtsLocaleVoices with _$TtsLocaleVoices {
  const factory TtsLocaleVoices({required String localeId, required List<String> voiceIds}) = _TtsLocaleVoices;
}
