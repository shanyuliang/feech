import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_web_view_state_provider.dart';

class AppWebViewProgressBar extends ConsumerWidget implements PreferredSizeWidget {
  final AppWebViewStateProviderProvider provider;

  const AppWebViewProgressBar({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = (ref.watch(provider.select((value) => value.progress))) ?? 100;
    return Visibility(
      visible: progress < 100,
      child: LinearProgressIndicator(value: progress / 100),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(4.0);
}
