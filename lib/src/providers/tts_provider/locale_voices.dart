import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_voices.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class LocaleVoices with _$LocaleVoices {
  const factory LocaleVoices({required final String localeId, required final List<String> voiceIds}) = _LocaleVoices;
}
