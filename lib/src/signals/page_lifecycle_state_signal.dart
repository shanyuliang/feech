import 'package:signals_flutter/signals_flutter.dart';

import '../models/page_lifecycle_state.dart';

class PageLifecycleStateSignal extends Signal<PageLifecycleState> {
  final bool debugLogDiagnostics;

  PageLifecycleStateSignal({PageLifecycleState initialLifecycleState = PageLifecycleState.detached, this.debugLogDiagnostics = false})
    : super(initialLifecycleState);
}
