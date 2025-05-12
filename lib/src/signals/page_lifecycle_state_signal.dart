import 'package:signals_flutter/signals_flutter.dart';

import '../models/page_lifecycle_state.dart';

class PageLifecycleStateSignal extends SignalContainer<PageLifecycleState, String?, Signal<PageLifecycleState>> {
  final bool debugLogDiagnostics;

  PageLifecycleStateSignal({String? routeName,this.debugLogDiagnostics = false})
    : super((routeName) {
        return signal(PageLifecycleState.detached);
      }, cache: true);
}
