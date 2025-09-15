import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/tts_provider.dart';

class TtsSettingsUI extends ConsumerStatefulWidget {
  const TtsSettingsUI({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TtsSettingsUIState();
}

class _TtsSettingsUIState extends ConsumerState<TtsSettingsUI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Settings - Text to Speech", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          _buildSelectedLocale(),
          _buildSelectedVoice(),
        ],
      ),
    );
  }

  Widget _buildSelectedLocale() {
    final selectedLocaleId = ref.watch(ttsProvider).value?.selectedLocaleId;
    return ListTile(
      leading: const Icon(Icons.language_outlined),
      title: Text(selectedLocaleId ?? ''),
      subtitle: const Text('Language'),
      trailing: const Icon(Icons.chevron_right_outlined),
      onTap: () async {
        final tts = ref.read(ttsProvider).value;
        if (tts != null) {
          final selectedLocaleId = await context.pushNamed<String>(
            "ttsSelectLocaleDialog",
            extra: tts.getSupportedLocales(),
          );
          if (selectedLocaleId != null) {
            ref.read(ttsProvider.notifier).setSelectedLocaleId(selectedLocaleId);
          }
        }
      },
    );
  }

  Widget _buildSelectedVoice() {
    final selectedVoiceId = ref.watch(ttsProvider).value?.selectedVoiceId;
    return ListTile(
      leading: const Icon(Icons.settings_voice_outlined),
      title: Text(selectedVoiceId ?? ''),
      subtitle: const Text('Voice'),
      trailing: const Icon(Icons.chevron_right_outlined),
      onTap: () async {
        final tts = ref.read(ttsProvider).value;
        if (tts != null) {
          final selectedVoiceId = await context.pushNamed<String>(
            "ttsSelectVoiceDialog",
            extra: tts.getSupportedVoices(tts.selectedLocaleId),
          );
          if (selectedVoiceId != null) {
            ref.read(ttsProvider.notifier).setSelectedVoiceId(selectedVoiceId);
          }
        }
      },
    );
  }
}
