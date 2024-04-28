import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_web_view_provider.dart';

class AppWebViewAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final AppWebViewProvider provider;

  const AppWebViewAppBar({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canGoBack = ref.watch(provider.select((value) => value.canGoBack));
    final canGoForward = ref.watch(provider.select((value) => value.canGoForward));
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: canGoBack ? () async => await ref.read(provider.notifier).goBack() : null,
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_rounded),
          onPressed: canGoForward ? () async => await ref.read(provider.notifier).goForward() : null,
        ),
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () => ref.read(provider.notifier).reload(),
        ),
        const Spacer(),
        const IconButton(onPressed: null, icon: Icon(Icons.close_rounded)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
