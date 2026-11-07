import 'package:signals_flutter/signals_flutter.dart';

import '../models/remote_themes.dart';

class RemoteThemesSignal extends FutureSignal<RemoteThemes> {
  RemoteThemesSignal({bool debugLogDiagnostics = false})
    : super(() async {
        return RemoteThemes();
      }, options: AsyncSignalOptions(name: "RemoteThemesSignal"));
}
