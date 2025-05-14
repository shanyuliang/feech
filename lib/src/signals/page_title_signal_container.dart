import 'package:signals_flutter/signals_flutter.dart';

import 'page_title_signal.dart';

class PageTitleSignalContainer extends SignalContainer<String?, String?, Signal<String?>> {
  final bool debugLogDiagnostics;

  PageTitleSignalContainer({this.debugLogDiagnostics = false})
    : super((routeName) {
        return PageTitleSignal();
      }, cache: true);
}
