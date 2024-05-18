import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/app_initialise_provider/app_initialise_provider.dart';

class AppInitialiseWidget extends ConsumerStatefulWidget {
  final List<AsyncNotifierProvider> initialiseList;
  final Widget loadedChild;
  final Widget loadingChild;

  const AppInitialiseWidget({
    super.key,
    required this.initialiseList,
    required this.loadedChild,
    required this.loadingChild,
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
          minWaitDurationInMilliseconds: 3000,
        ))
        .maybeWhen(
          data: (_) => widget.loadedChild,
          orElse: () => widget.loadingChild,
        );
  }
}
