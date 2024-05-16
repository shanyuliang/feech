import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../extensions/general_type_extension.dart';
import '../providers/app_lifecycle_state_provider/app_lifecycle_state_provider.dart';
import '../providers/page_lifecycle_state_provider/page_lifecycle_state.dart';
import '../providers/page_lifecycle_state_provider/page_lifecycle_state_provider.dart';

abstract class BasePage extends ConsumerStatefulWidget {
  final String? routeName;

  const BasePage({super.key, this.routeName});

  Widget build(BuildContext context, WidgetRef ref);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BasePageState();

  String? getTitle() => null;

  void onInitialized(BuildContext context, WidgetRef ref) {}

  void onDisposed(BuildContext context, WidgetRef ref) {}

  void onAppResumed(BuildContext context, WidgetRef ref) {}

  void onAppPaused(BuildContext context, WidgetRef ref) {}

  void onAppDetached(BuildContext context, WidgetRef ref) {}

  void onPageResumed(BuildContext context, WidgetRef ref) {}

  void onPagePaused(BuildContext context, WidgetRef ref) {}
}

class _BasePageState extends ConsumerState<BasePage> {
  @override
  void initState() {
    super.initState();
    widget.onInitialized(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      appLifecycleStateProvider,
      (previous, next) {
        switch (next) {
          case AppLifecycleState.resumed:
            widget.onAppResumed(context, ref);
            break;
          case AppLifecycleState.paused:
            widget.onAppPaused(context, ref);
            break;
          case AppLifecycleState.detached:
            widget.onAppDetached(context, ref);
            break;
          default:
            break;
        }
      },
    );
    widget.routeName?.let(
      (it) {
        ref.listen(
          pageLifecycleStateProvider(it),
          (previous, next) {
            switch (next) {
              case PageLifecycleState.resumed:
                _setPageTitle(title: widget.getTitle(), context: context);
                widget.onPageResumed(context, ref);
                break;
              case PageLifecycleState.paused:
                widget.onPagePaused(context, ref);
                break;
              default:
                break;
            }
          },
        );
      },
    );
    return Title(
      title: widget.getTitle() ?? widget.routeName ?? '',
      color: Theme.of(context).colorScheme.primary,
      child: widget.build(context, ref),
    );
  }

  @override
  void dispose() {
    widget.onDisposed(context, ref);
    super.dispose();
  }

  void _setPageTitle({String? title, required BuildContext context}) {
    SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
      label: title,
      primaryColor: Theme.of(context).primaryColor.value,
    ));
  }
}
