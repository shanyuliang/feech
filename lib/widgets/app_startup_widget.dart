import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/app_startup_provider/app_startup_provider.dart';

class AppStartupWidget extends ConsumerStatefulWidget {
  final Widget loadedChild;
  final Widget loadingChild;
  final AppStartupProvider _appStartupProvider;

  AppStartupWidget({
    super.key,
    required List<AlwaysAliveRefreshable> waitList,
    required this.loadedChild,
    required this.loadingChild,
  }) : _appStartupProvider = appStartupProvider(waitList: waitList);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppStartupWidgetState();
}

class _AppStartupWidgetState extends ConsumerState<AppStartupWidget> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(widget._appStartupProvider).maybeWhen(
          data: (_) => widget.loadedChild,
          orElse: () => widget.loadingChild,
        );
  }
}
