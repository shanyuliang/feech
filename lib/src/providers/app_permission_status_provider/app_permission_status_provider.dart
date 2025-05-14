import 'dart:ui';

import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../support/result.dart';
import '../../support/state_status.dart';
import '../../utilities/handy_util.dart';
import '../app_lifecycle_state_provider/app_lifecycle_state_provider.dart';
import '../../models/app_permission_status.dart';

part 'app_permission_status_provider.g.dart';

@Riverpod(keepAlive: true)
class AppPermissionStatusProvider extends _$AppPermissionStatusProvider {
  @override
  AppPermissionStatus build(Permission permission) {
    Future(() {
      _getStatus();
    });
    ref.listen(appLifecycleStateProvider, (previous, next) {
      if (next == AppLifecycleState.resumed) {
        _getStatus();
      }
    });
    return AppPermissionStatus(permission: permission);
  }

  Future<CombinedStatus?> _getStatus() async {
    state = state.copyWith(stateStatus: StateStatus.updating);
    final combinedStatusResult = await suppressThrowableAsyncDefault<Result<CombinedStatus>>(
      throwable: () async {
        final permissionStatus = await state.permission.status;
        final serviceStatus =
            (state.permission is PermissionWithService) ? await (state.permission as PermissionWithService).serviceStatus : null;
        final shouldShowRequestRationale = await state.permission.shouldShowRequestRationale;
        return Success(data: (
          permissionStatus: permissionStatus,
          serviceStatus: serviceStatus,
          shouldShowRequestRationale: shouldShowRequestRationale,
        ));
      },
      whenError: (error, stackTrace) async {
        return Failure(error: error);
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
        final shouldShowRequestRationale = await state.permission.shouldShowRequestRationale;
        return Success(data: (
          permissionStatus: permissionStatus,
          serviceStatus: serviceStatus,
          shouldShowRequestRationale: shouldShowRequestRationale,
        ));
      },
      whenError: (error, stackTrace) async {
        return Failure(error: error);
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

  Future<bool> gotoAppSettings() async {
    return openAppSettings();
  }
}
