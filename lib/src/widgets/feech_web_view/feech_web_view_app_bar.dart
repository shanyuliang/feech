import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'feech_web_view_signal.dart';

class FeechWebViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final FeechWebViewSignal signal;

  const FeechWebViewAppBar({super.key, required this.signal});

  @override
  Widget build(BuildContext context) {
    return Watch((ctx) {
      final canGoBack = signal.select((state) => state.value.canGoBack).value;
      final canGoForward = signal.select((state) => state.value.canGoForward).value;
      return AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: const Icon(Icons.arrow_back_rounded), onPressed: canGoBack ? () async => await signal.goBack() : null),
          IconButton(icon: const Icon(Icons.arrow_forward_rounded), onPressed: canGoForward ? () async => await signal.goForward() : null),
          IconButton(icon: const Icon(Icons.refresh_rounded), onPressed: () => signal.reload()),
          const Spacer(),
          const IconButton(onPressed: null, icon: Icon(Icons.close_rounded)),
        ],
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
