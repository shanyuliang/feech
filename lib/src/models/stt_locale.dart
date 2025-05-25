import 'package:freezed_annotation/freezed_annotation.dart';

part 'stt_locale.freezed.dart';

@Freezed()
abstract class SttLocale with _$SttLocale {
  const factory SttLocale({required final String localeId, required final String localeName}) = _SttLocale;

  const SttLocale._();

  @override
  String toString() {
    return localeName;
  }
}
