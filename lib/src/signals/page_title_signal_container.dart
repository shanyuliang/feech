import 'package:signals_flutter/signals_flutter.dart';

import '../models/page_title_signal_container_parameter.dart';
import 'page_title_signal.dart';

class PageTitleSignalContainer extends SignalContainer<String?, PageTitleSignalContainerParameter, PageTitleSignal> {
  final bool debugLogDiagnostics;

  PageTitleSignalContainer({this.debugLogDiagnostics = false})
    : super((parameter) {
        return PageTitleSignal(parameter.initialTitle);
      }, cache: true);
}
