import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../support/state_status.dart';

part 'app_permission_status_state.freezed.dart';

@Freezed()
class AppPermissionStatusState with _$AppPermissionStatusState {
  const AppPermissionStatusState._();

  const factory AppPermissionStatusState({
    required final Permission permission,
    final CombinedStatus? combinedStatus,
    final Object? error,
    @Default(StateStatus.initial) final StateStatus stateStatus,
  }) = _AppPermissionStatusState;
}

typedef CombinedStatus = ({
  PermissionStatus? permissionStatus,
  ServiceStatus? serviceStatus,
  bool? shouldShowRequestRationale,
});
