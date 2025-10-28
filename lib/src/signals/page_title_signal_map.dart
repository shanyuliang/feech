import 'package:signals_flutter/signals_flutter.dart';

class PageTitleSignalMap extends MapSignal<String?, String?> {
  final bool debugLogDiagnostics;

  PageTitleSignalMap({this.debugLogDiagnostics = false}) : super({}, debugLabel: "PageTitleSignalMap");
}
