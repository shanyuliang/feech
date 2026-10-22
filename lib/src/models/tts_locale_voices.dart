import 'package:freezed_annotation/freezed_annotation.dart';

part 'tts_locale_voices.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class const TtsLocaleVoices({required final String localeId, required final List<String> voiceIds}) with _$TtsLocaleVoices;
