import 'package:freezed_annotation/freezed_annotation.dart';

import 'stt_locale.dart';

part 'stt.freezed.dart';

@Freezed()
abstract class Stt with _$Stt {
  const factory Stt({required List<SttLocale> supportedLocales, required SttLocale? selectedLocale}) = _Stt;
}
