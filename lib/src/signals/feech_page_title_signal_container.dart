import 'package:signals_flutter/signals_flutter.dart';

import '../models/page_title_signal_container_parameter.dart';
import 'page_title_signal.dart';

class FeechPageTitleSignalContainer {
  final bool debugLogDiagnostics;
  late final container = signalContainer<String?, PageTitleSignalContainerParameter>((parameter) {
    return PageTitleSignal(parameter.initialTitle, debugLogDiagnostics: debugLogDiagnostics);
  }, cache: true);

  FeechPageTitleSignalContainer({this.debugLogDiagnostics = false});

  Signal<String?> getPageTitleSignal(PageTitleSignalContainerParameter parameter) {
    return container(parameter);
  }
}
