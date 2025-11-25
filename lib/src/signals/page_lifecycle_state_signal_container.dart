import 'package:signals_flutter/signals_flutter.dart';

import '../models/page_lifecycle_state.dart';
import '../models/page_parameter.dart';
import 'page_lifecycle_state_signal.dart';

class PageLifecycleStateSignalContainer extends SignalContainer<PageLifecycleState, PageParameter, PageLifecycleStateSignal> {
  final bool debugLogDiagnostics;

  PageLifecycleStateSignalContainer({this.debugLogDiagnostics = false})
    : super((parameter) {
        return PageLifecycleStateSignal(parameter.initialLifecycleState);
      }, cache: true);
}
