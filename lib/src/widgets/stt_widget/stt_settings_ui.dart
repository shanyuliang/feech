import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/general_type_extension.dart';
import '../../providers/stt_provider/app_locale.dart';
import '../../providers/stt_provider/stt_provider.dart';

class SttSettingsUI extends ConsumerStatefulWidget {
  const SttSettingsUI({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SttSettingsUIState();
}

class _SttSettingsUIState extends ConsumerState<SttSettingsUI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Settings - Speech to Text", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          _buildSelectedLocale(),
        ],
      ),
    );
  }

  Widget _buildSelectedLocale() {
    final selectedLocale = ref.watch(sttProvider).value?.selectedLocale;
    return ListTile(
      leading: const Icon(Icons.language_outlined),
      title: Text(selectedLocale?.localeName ?? ''),
      subtitle: const Text('Language'),
      trailing: const Icon(Icons.chevron_right_outlined),
      onTap: () {
        ref.read(sttProvider.future).then((stt) async {
          if (mounted) {
            final selectedLocale = await context.pushNamed<AppLocale>("sttSelectLocaleDialog", extra: stt.supportedLocales);
            selectedLocale?.let((selectedLocale) {
              ref.read(sttProvider.notifier).setSelectedLocale(selectedLocale);
            });
          }
        });
      },
    );
  }
}
