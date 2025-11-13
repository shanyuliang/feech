import 'package:signals_flutter/signals_flutter.dart';

class PageTitleMapSignal extends MapSignal<String?, String?> {
  final bool debugLogDiagnostics;

  PageTitleMapSignal({this.debugLogDiagnostics = false}) : super({}, debugLabel: "PageTitleMapSignal");
}
