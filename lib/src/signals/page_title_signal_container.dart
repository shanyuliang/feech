import 'package:signals_flutter/signals_flutter.dart';

import '../models/page_title_signal_container_parameter.dart';
import 'page_title_signal.dart';

class PageTitleSignalContainer extends SignalContainer<String?, PageTitleSignalContainerParameter, Signal<String?>> {
  final bool debugLogDiagnostics;

  PageTitleSignalContainer({this.debugLogDiagnostics = false})
    : super((pageTitleSignalContainerParameter) {
        return PageTitleSignal(initialTitle: pageTitleSignalContainerParameter.initialTitle);
      }, cache: true);
}
