import 'package:signals_flutter/signals_flutter.dart';

import '../models/page_lifecycle_state.dart';
import 'page_lifecycle_state_signal.dart';

class PageLifecycleStateSignalContainer extends SignalContainer<PageLifecycleState, String?, Signal<PageLifecycleState>> {
  final bool debugLogDiagnostics;

  PageLifecycleStateSignalContainer({this.debugLogDiagnostics = false})
    : super((routeName) {
        return PageLifecycleStateSignal();
      }, cache: true);
}
