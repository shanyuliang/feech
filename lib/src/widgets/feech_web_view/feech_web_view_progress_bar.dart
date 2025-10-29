import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'feech_web_view_signal.dart';

class FeechWebViewProgressBar extends StatelessWidget implements PreferredSizeWidget {
  final FeechWebViewSignal signal;

  const FeechWebViewProgressBar({super.key, required this.signal});

  @override
  Widget build(BuildContext context) {
    final progress = signal.select((state) => state.value.progress).value ?? 100;
    return Visibility(
      visible: progress < 100,
      child: LinearProgressIndicator(value: progress / 100),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(4.0);
}
