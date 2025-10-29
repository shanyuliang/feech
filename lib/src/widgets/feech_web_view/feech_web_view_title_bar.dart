import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'feech_web_view_signal.dart';

class FeechWebViewTitleBar extends StatelessWidget {
  final FeechWebViewSignal signal;

  const FeechWebViewTitleBar({super.key, required this.signal});

  @override
  Widget build(BuildContext context) {
    final expandTitleBar = signal.select((state) => state.value.expandTitleBar).value;
    return InkWell(
      onTap: () {
        signal.toggleTitleBarExpansion();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 0.0, right: 8.0, bottom: 8.0),
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 120),
          firstChild: _FeechWebViewTitleBarOneLine(signal: signal),
          secondChild: _FeechWebViewTitleBarEditor(signal: signal),
          crossFadeState: expandTitleBar ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ),
      ),
    );
  }
}

class _FeechWebViewTitleBarOneLine extends StatelessWidget {
  final FeechWebViewSignal signal;

  const _FeechWebViewTitleBarOneLine({required this.signal});

  @override
  Widget build(BuildContext context) {
    final currentUrl = signal.select((state) => state.value.currentUrl).value ?? "";
    final title = signal.select((state) => state.value.title).value ?? "";
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
        Text(currentUrl, style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}

class _FeechWebViewTitleBarMultiLine extends StatelessWidget {
  final FeechWebViewSignal signal;

  const _FeechWebViewTitleBarMultiLine({required this.signal});

  @override
  Widget build(BuildContext context) {
    final currentUrl = signal.select((state) => state.value.currentUrl).value ?? "";
    final title = signal.select((state) => state.value.title).value ?? "";
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleSmall),
              Text(currentUrl, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.copy_rounded)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.edit_rounded)),
      ],
    );
  }
}

class _FeechWebViewTitleBarEditor extends StatelessWidget {
  final FeechWebViewSignal signal;

  const _FeechWebViewTitleBarEditor({required this.signal});

  @override
  Widget build(BuildContext context) {
    final title = signal.select((state) => state.value.title).value ?? "";
    final urlEditorController = signal.select((state) => state.value.urlEditorController).value;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.go,
                controller: urlEditorController,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                ),
              ),
            ),
            TextButton(onPressed: () async => await signal.goBack(), child: const Text("GO")),
          ],
        ),
      ],
    );
  }
}
