import 'package:signals_flutter/signals_flutter.dart';

class PageTitleSignal extends Signal<String?> {
  final bool debugLogDiagnostics;

  PageTitleSignal({this.debugLogDiagnostics = false}) : super(null);
}
