import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/app_lifecycle_state_provider/app_lifecycle_state_provider.dart';

abstract class BaseWidget extends ConsumerStatefulWidget {
  const BaseWidget({super.key});

  Widget build(BuildContext context, WidgetRef ref);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseWidgetState();

  String? getTitle() => null;

  void onUIInitialized(BuildContext context, WidgetRef ref) {}

  void onUIDisposed(BuildContext context, WidgetRef ref) {}

  void onAppResumed(BuildContext context, WidgetRef ref) {}

  void onAppPaused(BuildContext context, WidgetRef ref) {}

  void onAppDetached(BuildContext context, WidgetRef ref) {}
}

class _BaseWidgetState extends ConsumerState<BaseWidget> {
  @override
  void initState() {
    super.initState();
    widget.onUIInitialized(context, ref);
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
    widget.onUIDisposed(context, ref);
    super.dispose();
  }
}
