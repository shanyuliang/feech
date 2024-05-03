import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_locale.dart';

part 'stt.freezed.dart';

@Freezed()
class Stt with _$Stt {
  const factory Stt({
    required final List<AppLocale> supportedLocales,
    required final AppLocale? selectedLocale,
  }) = _Stt;

  const Stt._();
}
