import 'package:freezed_annotation/freezed_annotation.dart';

part 'stt_locale.freezed.dart';

@freezed
class const SttLocale({required final String localeId, required final String localeName}) with _$SttLocale {
  @override
  String toString() {
    return localeName;
  }
}
