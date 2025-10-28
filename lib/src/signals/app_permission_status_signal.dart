import 'dart:ui';

import 'package:permission_handler/permission_handler.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../models/app_permission_status.dart';
import '../support/result.dart';
import '../support/state_status.dart';
import '../utilities/handy_util.dart';
import 'app_lifecycle_state_signal/app_lifecycle_state_signal.dart';

typedef CombinedAppPermissionStatusSignalParameter = ({Permission permission, AppLifecycleStateSignal appLifecycleStateSignal});

class AppPermissionStatusSignal extends Signal<AppPermissionStatus> {
  final bool debugLogDiagnostics;

  AppPermissionStatusSignal({
    required CombinedAppPermissionStatusSignalParameter combinedAppPermissionStatusSignalParameter,
    this.debugLogDiagnostics = false,
  }) : super(AppPermissionStatus(permission: combinedAppPermissionStatusSignalParameter.permission), debugLabel: "AppPermissionStatusSignal") {
    Future(() {
      _getStatus();
    });
    effect(() {
      final appLifecycleState = combinedAppPermissionStatusSignalParameter.appLifecycleStateSignal.value;
      if (appLifecycleState == AppLifecycleState.resumed) {
        _getStatus();
      }
    });
  }

  Future<CombinedStatus?> _getStatus() async {
    final currentValue = peek();
    value = currentValue.copyWith(stateStatus: StateStatus.updating);
    final combinedStatusResult = await suppressThrowableAsyncDefault<Result<CombinedStatus>>(
      throwable: () async {
        final permissionStatus = await currentValue.permission.status;
        final serviceStatus = (currentValue.permission is PermissionWithService)
            ? await (currentValue.permission as PermissionWithService).serviceStatus
            : null;
        final shouldShowRequestRationale = await currentValue.permission.shouldShowRequestRationale;
        return Success(
          data: (permissionStatus: permissionStatus, serviceStatus: serviceStatus, shouldShowRequestRationale: shouldShowRequestRationale),
        );
      },
      whenError: (error, stackTrace) async {
        return Failure(error: error);
      },
    );
    final combinedStatus = combinedStatusResult.dataOrNull;
    final stateStatus = switch (combinedStatusResult) {
      Success() => StateStatus.updated,
      _ => StateStatus.errorUpdating,
    };
    value = peek().copyWith(combinedStatus: combinedStatus, error: combinedStatusResult.errorOrNull, stateStatus: stateStatus);
    return combinedStatus;
  }

  Future<CombinedStatus?> askPermission() async {
    final currentValue = peek();
    value = currentValue.copyWith(stateStatus: StateStatus.updating);
    final combinedStatusResult = await suppressThrowableAsyncDefault<Result<CombinedStatus>>(
      throwable: () async {
        final permissionStatus = await currentValue.permission.request();
        final serviceStatus = (currentValue.permission is PermissionWithService)
            ? await (currentValue.permission as PermissionWithService).serviceStatus
            : null;
        final shouldShowRequestRationale = await currentValue.permission.shouldShowRequestRationale;
        return Success(
          data: (permissionStatus: permissionStatus, serviceStatus: serviceStatus, shouldShowRequestRationale: shouldShowRequestRationale),
        );
      },
      whenError: (error, stackTrace) async {
        return Failure(error: error);
      },
    );
    final combinedStatus = combinedStatusResult.dataOrNull;
    final stateStatus = switch (combinedStatusResult) {
      Success() => StateStatus.updated,
      _ => StateStatus.errorUpdating,
    };
    value = peek().copyWith(combinedStatus: combinedStatus, error: combinedStatusResult.errorOrNull, stateStatus: stateStatus);
    return combinedStatus;
  }

  Future<bool> gotoAppSettings() async {
    return openAppSettings();
  }
}
