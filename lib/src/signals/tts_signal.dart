import 'dart:async';
import 'dart:developer' as developer;

import 'package:collection/collection.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../constants.dart';
import '../extensions/general_type_extension.dart';
import '../models/tts.dart';
import '../models/tts_locale_voices.dart';

class TtsSignal extends FutureSignal<Tts> {
  FutureOr<void> Function(String?)? onSelectedTtsLocaleIdChanged;
  FutureOr<void> Function(String?)? onSelectedTtsVoiceIdChanged;
  final bool debugLogDiagnostics;

  TtsSignal({
    String? selectedTtsLocaleId,
    String? selectedTtsVoiceId,
    this.onSelectedTtsLocaleIdChanged,
    this.onSelectedTtsVoiceIdChanged,
    this.debugLogDiagnostics = false,
  }) : super(() async {
         final flutterTts = FlutterTts();

         /// Get all supported locales and voices
         final voices = ((await flutterTts.getVoices) as List<Object?>)
             .map((e) => e as Map<Object?, Object?>)
             .map((e) => e.map((key, value) => MapEntry(key.toString(), value.toString())))
             .toList();
         final List<TtsLocaleVoices> allLocaleVoices = [];
         for (final element in voices) {
           final localeId = element['locale']!;
           final voiceId = element['name']!;
           var localeVoices = allLocaleVoices.firstWhereOrNull((e) => e.localeId == localeId);
           if (localeVoices == null) {
             localeVoices = TtsLocaleVoices(localeId: localeId, voiceIds: [voiceId]);
             allLocaleVoices.add(localeVoices);
           } else {
             localeVoices.voiceIds.add(voiceId);
           }
         }

         /// Get system default locale and voice
         String? selectedLocaleId = selectedTtsLocaleId;
         String? selectedVoiceId = selectedTtsVoiceId;
         if (selectedLocaleId == null) {
           try {
             final defaultVoice = ((await flutterTts.getDefaultVoice) as Map<Object?, Object?>).map(
               (key, value) => MapEntry(key.toString(), value.toString()),
             );
             selectedLocaleId = defaultVoice['locale']!;
             selectedVoiceId = defaultVoice['name']!;
           } catch (ex) {
             if (debugLogDiagnostics) {
               developer.log("TtsSignal $ex", name: debugTag);
             }
           }
         }

         return Tts(flutterTts: flutterTts, allLocaleVoices: allLocaleVoices, selectedLocaleId: selectedLocaleId, selectedVoiceId: selectedVoiceId);
       });

  FutureOr<void> setSelectedTtsLocaleId(String? localeId) async {
    await onSelectedTtsLocaleIdChanged?.call(localeId);
    final voiceId = localeId?.let((it) => requireValue.getSupportedVoices(it).firstOrNull);
    await onSelectedTtsVoiceIdChanged?.call(voiceId);
    value = AsyncData(peek().requireValue.copyWith(selectedLocaleId: localeId, selectedVoiceId: voiceId));
  }

  FutureOr<void> setSelectedTtsVoiceId(String? voiceId) async {
    await onSelectedTtsVoiceIdChanged?.call(voiceId);
    value = AsyncData(peek().requireValue.copyWith(selectedVoiceId: voiceId));
  }
}
