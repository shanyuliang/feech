import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../support/state_status.dart';

part 'app_permission_status.freezed.dart';

@Freezed()
abstract class AppPermissionStatus with _$AppPermissionStatus {
  const factory AppPermissionStatus({
    required Permission permission,
    CombinedStatus? combinedStatus,
    Object? error,
    @Default(StateStatus.initial) StateStatus stateStatus,
  }) = _AppPermissionStatus;
}

typedef CombinedStatus = ({PermissionStatus? permissionStatus, ServiceStatus? serviceStatus, bool? shouldShowRequestRationale});
