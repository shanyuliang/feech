import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../support/state_status.dart';

part 'app_permission_status.freezed.dart';

@freezed
class const AppPermissionStatus({
  required final Permission permission,
  final CombinedStatus? combinedStatus,
  final Object? error,
  final StateStatus stateStatus = StateStatus.initial,
}) with _$AppPermissionStatus;

typedef CombinedStatus = ({PermissionStatus? permissionStatus, ServiceStatus? serviceStatus, bool? shouldShowRequestRationale});
