import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_web_view_state_provider.dart';

class AppWebViewTitleBar extends ConsumerWidget {
  final AppWebViewStateProviderProvider provider;

  const AppWebViewTitleBar({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expandTitleBar = ref.watch(provider.select((value) => value.expandTitleBar));
    return InkWell(
      onTap: () {
        ref.read(provider.notifier).toggleTitleBarExpansion();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 0.0, right: 8.0, bottom: 8.0),
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 120),
          firstChild: _AppWebViewTitleBarOneLine(
            provider: provider,
          ),
          secondChild: _AppWebViewTitleBarEditor(
            provider: provider,
          ),
          crossFadeState: expandTitleBar ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ),
      ),
    );
  }
}

class _AppWebViewTitleBarOneLine extends ConsumerWidget {
  final AppWebViewStateProviderProvider provider;

  const _AppWebViewTitleBarOneLine({required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUrl = (ref.watch(provider.select((value) => value.currentUrl))) ?? "";
    final title = (ref.watch(provider.select((value) => value.title))) ?? "";
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          currentUrl,
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _AppWebViewTitleBarMultiLine extends ConsumerWidget {
  final AppWebViewStateProviderProvider provider;

  const _AppWebViewTitleBarMultiLine({required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUrl = (ref.watch(provider.select((value) => value.currentUrl))) ?? "";
    final title = (ref.watch(provider.select((value) => value.title))) ?? "";
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
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                currentUrl,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.copy_rounded)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.edit_rounded)),
      ],
    );
  }
}

class _AppWebViewTitleBarEditor extends ConsumerWidget {
  final AppWebViewStateProviderProvider provider;

  const _AppWebViewTitleBarEditor({required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = (ref.watch(provider.select((value) => value.title))) ?? "";
    final urlEditorController = ref.watch(provider.select((value) => value.urlEditorController));
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
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
            TextButton(
              onPressed: () async => await ref.read(provider.notifier).goBack(),
              child: const Text("GO"),
            ),
          ],
        ),
      ],
    );
  }
}
