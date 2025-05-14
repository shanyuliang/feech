import 'package:signals_flutter/signals_flutter.dart';

import '../models/app_permission_status.dart';
import 'app_permission_status_signal.dart';

class AppPermissionStatusSignalContainer
    extends SignalContainer<AppPermissionStatus, CombinedAppPermissionStatusSignalParameter, Signal<AppPermissionStatus>> {
  final bool debugLogDiagnostics;

  AppPermissionStatusSignalContainer({this.debugLogDiagnostics = false})
    : super((combinedAppPermissionStatusSignalParameter) {
        return AppPermissionStatusSignal(combinedAppPermissionStatusSignalParameter: combinedAppPermissionStatusSignalParameter);
      }, cache: true);
}
