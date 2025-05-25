import 'package:freezed_annotation/freezed_annotation.dart';

part 'tts_locale_voices.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class TtsLocaleVoices with _$TtsLocaleVoices {
  const factory TtsLocaleVoices({required final String localeId, required final List<String> voiceIds}) = _TtsLocaleVoices;
}
