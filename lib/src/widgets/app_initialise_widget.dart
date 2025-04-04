import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/app_initialise_provider/app_initialise_provider.dart';

class AppInitialiseWidget extends ConsumerStatefulWidget {
  /// [initialiseList] is a list of `provider.notifier` or `asyncProvider.future`
  final List<Refreshable> initialiseList;
  final int minWaitDurationInMilliseconds;
  final bool debugLogDiagnostics;
  final Widget Function(BuildContext context) loadedChild;
  final Widget Function(BuildContext context)? loadingChild;
  final Widget Function(BuildContext context)? loadErrorChild;
  final VoidCallback? onLoading;
  final VoidCallback? onLoadError;
  final VoidCallback? onLoaded;

  const AppInitialiseWidget({
    super.key,
    required this.initialiseList,
    required this.loadedChild,
    this.loadingChild,
    this.loadErrorChild,
    this.minWaitDurationInMilliseconds = 0,
    this.onLoading,
    this.onLoadError,
    this.onLoaded,
    this.debugLogDiagnostics = false,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppInitialiseWidgetState();
}

class _AppInitialiseWidgetState extends ConsumerState<AppInitialiseWidget> {
  @override
  Widget build(BuildContext context) {
    return ref
        .watch(appInitialiseProvider(
      initialiseList: widget.initialiseList,
      minWaitDurationInMilliseconds: widget.minWaitDurationInMilliseconds,
      debugLogDiagnostics: widget.debugLogDiagnostics,
    ))
        .when(
      data: (_) {
        widget.onLoaded?.call();
        return widget.loadedChild.call(context);
      },
      error: (_, __) {
        widget.onLoadError?.call();
        return widget.loadErrorChild?.call(context) ?? const SizedBox.shrink();
      },
      loading: () {
        widget.onLoading?.call();
        return widget.loadingChild?.call(context) ?? const SizedBox.shrink();
      },
    );
  }
}
