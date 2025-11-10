import 'package:signals_flutter/signals_flutter.dart';

import '../models/page_lifecycle_state.dart';

class PageLifecycleStateMapSignal extends MapSignal<String?, PageLifecycleState> {
  final bool debugLogDiagnostics;

  PageLifecycleStateMapSignal({this.debugLogDiagnostics = false}) : super({}, debugLabel: "PageLifecycleStateSignalMap");
}
