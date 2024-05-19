import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/app_initialise_provider/app_initialise_provider.dart';

class AppInitialiseWidget extends ConsumerStatefulWidget {
  /// [initialiseList] is a list of `provider.notifier` or `asyncProvider.future`
  final List<AlwaysAliveRefreshable> initialiseList;
  final int minWaitDurationInMilliseconds;
  final Widget loadedChild;
  final Widget loadingChild;

  const AppInitialiseWidget({
    super.key,
    required this.initialiseList,
    required this.loadedChild,
    required this.loadingChild,
    this.minWaitDurationInMilliseconds = 0,
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
        ))
        .maybeWhen(
          data: (_) => widget.loadedChild,
          orElse: () => widget.loadingChild,
        );
  }
}
