import 'package:signals_flutter/signals_flutter.dart';

class PageTitleSignal extends Signal<String?> {
  final bool debugLogDiagnostics;

  PageTitleSignal(super.value, {this.debugLogDiagnostics = false}) : super(debugLabel: "PageTitleSignal");
}
