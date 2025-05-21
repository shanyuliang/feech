import 'package:signals_flutter/signals_flutter.dart';

import '../models/page_lifecycle_state.dart';
import 'page_lifecycle_state_signal.dart';

class PageLifecycleStateSignalContainer2 extends SignalContainer<PageLifecycleState, String?, Signal<PageLifecycleState>> {
  final bool debugLogDiagnostics;

  PageLifecycleStateSignalContainer2({this.debugLogDiagnostics = false})
    : super((routeName) {
        return PageLifecycleStateSignal(initialLifecycleState: PageLifecycleState.detached);
      }, cache: true);
}
