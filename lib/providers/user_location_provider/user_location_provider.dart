import 'dart:async';

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
  StreamSubscription<Position>? _positionStreamSubscription;

  @override
  UserLocationState build() {
    Future(() async {
      await _getLastKnownLocation();
      await getCurrentLocation();
    });
    ref.onDispose(() {
      _detachPositionStreamListener();
    });
    return const UserLocationState();
  }

  Future<UserLatLng?> _getLastKnownLocation() async {
    state = state.copyWith(stateStatus: StateStatus.updating);
    final positionResult = await suppressThrowableAsyncDefault<Result<Position>>(
      throwable: () async {
        return Success(data: await Geolocator.getLastKnownPosition());
      },
      whenError: (ex) async {
        return Failure(error: ex);
      },
    );
    final lastKnowLocation = positionResult.dataOrNull?.let((it) => UserLatLng(latitude: it.latitude, longitude: it.longitude));
    final stateStatus = switch (positionResult) { Success() => StateStatus.updated, _ => StateStatus.errorUpdating };
    state = state.copyWith(lastKnownLocation: lastKnowLocation, error: positionResult.errorOrNull, stateStatus: stateStatus);
    return lastKnowLocation;
  }

  Future<void> _detachPositionStreamListener() async {
    await _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
  }

  Future<UserLatLng?> getCurrentLocation() async {
    state = state.copyWith(stateStatus: StateStatus.updating);
    final positionResult = await suppressThrowableAsyncDefault<Result<Position>>(
      throwable: () async {
        return Success(data: await Geolocator.getCurrentPosition());
      },
      whenError: (ex) async {
        return Failure(error: ex);
      },
    );
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

  Future<void> startListeningLocationChange() async {
    state = state.copyWith(isListeningLocationChange: true);
    await _detachPositionStreamListener();

    _positionStreamSubscription = Geolocator.getPositionStream().listen((position) {
      final currentLocation = position.let((it) => UserLatLng(latitude: it.latitude, longitude: it.longitude));
      state = state.copyWith(
        lastKnownLocation: currentLocation,
        currentLocation: currentLocation,
        error: null,
        stateStatus: StateStatus.updated,
      );
    }, onError: (error, stackTrace) {
      state = state.copyWith(
        error: error,
        stateStatus: StateStatus.errorUpdating,
      );
    });
  }

  Future<void> stopListeningLocationChange() async {
    state = state.copyWith(isListeningLocationChange: false);
    _detachPositionStreamListener();
  }
}
