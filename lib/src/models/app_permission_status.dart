import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../support/state_status.dart';

part 'app_permission_status.freezed.dart';

@Freezed()
abstract class AppPermissionStatus with _$AppPermissionStatus {
  const factory AppPermissionStatus({
    required final Permission permission,
    final CombinedStatus? combinedStatus,
    final Object? error,
    @Default(StateStatus.initial) final StateStatus stateStatus,
  }) = _AppPermissionStatus;
}

typedef CombinedStatus = ({PermissionStatus? permissionStatus, ServiceStatus? serviceStatus, bool? shouldShowRequestRationale});
