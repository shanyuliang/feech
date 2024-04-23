import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../support/result.dart';
import '../../support/state_status.dart';
import '../../utilities/handy_util.dart';
import 'app_permission_status_state.dart';

part 'app_permission_status_provider.g.dart';

@Riverpod(keepAlive: true)
class AppPermissionStatus extends _$AppPermissionStatus {
  @override
  AppPermissionStatusState build(Permission permission) {
    Future(() {
      _getStatus();
    });
    return AppPermissionStatusState(permission: permission);
  }

  Future<CombinedStatus?> _getStatus() async {
    state = state.copyWith(stateStatus: StateStatus.updating);
    final combinedStatusResult = await suppressThrowableAsyncDefault<Result<CombinedStatus>>(
      throwable: () async {
        final permissionStatus = await state.permission.status;
        final serviceStatus =
            (state.permission is PermissionWithService) ? await (state.permission as PermissionWithService).serviceStatus : null;
        return Success(data: (permissionStatus: permissionStatus, serviceStatus: serviceStatus));
      },
      whenError: (ex) async {
        return Failure(error: ex);
      },
    );
    final combinedStatus = combinedStatusResult.dataOrNull;
    final stateStatus = switch (combinedStatusResult) { Success() => StateStatus.updated, _ => StateStatus.errorUpdating };
    state = state.copyWith(
      combinedStatus: combinedStatus,
      error: combinedStatusResult.errorOrNull,
      stateStatus: stateStatus,
    );
    return combinedStatus;
  }

  Future<CombinedStatus?> askPermission() async {
    state = state.copyWith(stateStatus: StateStatus.updating);
    final combinedStatusResult = await suppressThrowableAsyncDefault<Result<CombinedStatus>>(
      throwable: () async {
        final permissionStatus = await state.permission.request();
        final serviceStatus =
            (state.permission is PermissionWithService) ? await (state.permission as PermissionWithService).serviceStatus : null;
        return Success(data: (permissionStatus: permissionStatus, serviceStatus: serviceStatus));
      },
      whenError: (ex) async {
        return Failure(error: ex);
      },
    );
    final combinedStatus = combinedStatusResult.dataOrNull;
    final stateStatus = switch (combinedStatusResult) { Success() => StateStatus.updated, _ => StateStatus.errorUpdating };
    state = state.copyWith(
      combinedStatus: combinedStatus,
      error: combinedStatusResult.errorOrNull,
      stateStatus: stateStatus,
    );
    return combinedStatus;
  }

  Future<CombinedStatus?> gotoAppSettings() async {
    await openAppSettings();
    return _getStatus();
  }
}
