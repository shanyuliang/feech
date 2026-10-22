import 'package:freezed_annotation/freezed_annotation.dart';

import 'stt_locale.dart';

part 'stt.freezed.dart';

@freezed
class const Stt({required final List<SttLocale> supportedLocales, final SttLocale? selectedLocale}) with _$Stt;
