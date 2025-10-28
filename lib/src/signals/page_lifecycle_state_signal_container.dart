import 'package:signals_flutter/signals_flutter.dart';

import '../models/page_lifecycle_state.dart';
import '../models/page_lifecycle_state_signal_container_parameter.dart';
import 'page_lifecycle_state_signal.dart';

class PageLifecycleStateSignalContainer
    extends SignalContainer<PageLifecycleState, PageLifecycleStateSignalContainerParameter, Signal<PageLifecycleState>> {
  final bool debugLogDiagnostics;

  PageLifecycleStateSignalContainer({this.debugLogDiagnostics = false})
    : super((pageLifecycleStateSignalContainerParameter) {
        return PageLifecycleStateSignal(pageLifecycleStateSignalContainerParameter.initialLifecycleState);
      }, cache: true);
}
