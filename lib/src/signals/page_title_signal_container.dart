import 'package:signals_flutter/signals_flutter.dart';

import '../models/page_parameter.dart';
import 'page_title_signal.dart';

class PageTitleSignalContainer extends SignalContainer<String?, PageParameter, PageTitleSignal> {
  final bool debugLogDiagnostics;

  PageTitleSignalContainer({this.debugLogDiagnostics = false})
    : super((parameter) {
        return PageTitleSignal(parameter.initialTitle);
      }, cache: true);
}
