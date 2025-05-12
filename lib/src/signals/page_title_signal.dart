import 'package:signals_flutter/signals_flutter.dart';

class PageTitleSignal extends SignalContainer<String?, String?, Signal<String?>> {
  final bool debugLogDiagnostics;

  PageTitleSignal({this.debugLogDiagnostics = false})
    : super((routeName) {
        return signal(null);
      }, cache: true);
}
