import 'package:signals_flutter/signals_flutter.dart';

import '../models/page_lifecycle_state.dart';

class PageLifecycleStateSignalMap extends MapSignal<String?, PageLifecycleState> {
  final bool debugLogDiagnostics;

  PageLifecycleStateSignalMap({this.debugLogDiagnostics = false}) : super({}, debugLabel: "PageLifecycleStateSignalMap");
}
