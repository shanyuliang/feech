import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/app_lifecycle_state_provider/app_lifecycle_state_provider.dart';

abstract class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});

  Widget build(BuildContext context, WidgetRef ref);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BasePageState();

  String? getTitle() => null;

  void onInitialized(BuildContext context, WidgetRef ref) {}

  void onDisposed(BuildContext context, WidgetRef ref) {}

  void onAppResumed(BuildContext context, WidgetRef ref) {}

  void onAppPaused(BuildContext context, WidgetRef ref) {}

  void onAppDetached(BuildContext context, WidgetRef ref) {}
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
    return widget.build(context, ref);
  }

  @override
  void dispose() {
    widget.onDisposed(context, ref);
    super.dispose();
  }
}
