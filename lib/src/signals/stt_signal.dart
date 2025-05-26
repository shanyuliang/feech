import 'dart:async';

import 'package:collection/collection.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../extensions/general_type_extension.dart';
import '../models/stt.dart';
import '../models/stt_locale.dart';

class SttSignal extends FutureSignal<Stt> {
  FutureOr<void> Function(String?)? onSelectedSttLocaleIdChanged;

  SttSignal({String? selectedSttLocaleId, this.onSelectedSttLocaleIdChanged, bool debugLogDiagnostics = false})
    : super(() async {
        final locales = await SpeechToText().locales();
        final allLocales = locales.map((e) => SttLocale(localeId: e.localeId, localeName: e.name)).toList();
        final selectedLocale =
            selectedSttLocaleId?.let((it) => allLocales.firstWhereOrNull((sttLocale) => sttLocale.localeId == it)) ?? allLocales.firstOrNull;
        return Stt(supportedLocales: allLocales, selectedLocale: selectedLocale);
      });

  FutureOr<void> setSelectedSttLocale(SttLocale? sttLocale) async {
    await onSelectedSttLocaleIdChanged?.call(sttLocale?.localeId);
    value = AsyncData(requireValue.copyWith(selectedLocale: sttLocale));
  }
}
