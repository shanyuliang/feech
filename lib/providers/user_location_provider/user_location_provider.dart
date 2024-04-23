import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../extensions/general_type_extension.dart';
import '../../support/result.dart';
import '../../support/state_status.dart';
import '../../utilities/handy_util.dart';
import 'user_location_state.dart';

part 'user_location_provider.g.dart';

@Riverpod(keepAlive: true)
class UserLocation extends _$UserLocation {
  @override
  UserLocationState build() {
    Future(() {
      _getLastKnownLocation();
    });
    return const UserLocationState();
  }

  Future<UserLatLng?> _getLastKnownLocation() async {
    state = state.copyWith(stateStatus: StateStatus.updating);
    final positionResult = await suppressThrowable<Result<Position>>(
      throwable: () async {
        return Success(data: await Geolocator.getLastKnownPosition());
      },
      whenError: (ex) {
        return Failure(error: ex);
      },
    )!;
    final lastKnowLocation = positionResult.dataOrNull?.let((it) => UserLatLng(latitude: it.latitude, longitude: it.longitude));
    final stateStatus = switch (positionResult) { Success() => StateStatus.updated, _ => StateStatus.errorUpdating };
    state = state.copyWith(lastKnownLocation: lastKnowLocation, error: positionResult.errorOrNull, stateStatus: stateStatus);
    return lastKnowLocation;
  }

  Future<UserLatLng?> getCurrentLocation() async {
    state = state.copyWith(stateStatus: StateStatus.updating);
    final positionResult = await suppressThrowable<Result<Position>>(
      throwable: () async {
        return Success(data: await Geolocator.getCurrentPosition());
      },
      whenError: (ex) {
        return Failure(error: ex);
      },
    )!;
    final currentLocation = positionResult.dataOrNull?.let((it) => UserLatLng(latitude: it.latitude, longitude: it.longitude));
    final stateStatus = switch (positionResult) { Success() => StateStatus.updated, _ => StateStatus.errorUpdating };
    state = state.copyWith(
      lastKnownLocation: currentLocation,
      currentLocation: currentLocation,
      error: positionResult.errorOrNull,
      stateStatus: stateStatus,
    );
    return currentLocation;
  }
}
