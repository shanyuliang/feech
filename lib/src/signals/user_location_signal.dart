import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../extensions/general_type_extension.dart';
import '../models/user_location.dart';
import '../support/result.dart';
import '../support/state_status.dart';
import '../utilities/handy_util.dart';

class UserLocationSignal extends Signal<UserLocation> {
  StreamSubscription<Position>? _positionStreamSubscription;
  final bool debugLogDiagnostics;

  UserLocationSignal({this.debugLogDiagnostics = false}) : super(const UserLocation()) {
    Future(() async {
      await getLastKnownLocation();
      await getCurrentLocation();
    });
    onDispose(() {
      _detachPositionStreamListener();
    });
  }

  Future<UserLatLng?> getLastKnownLocation() async {
    value = peek().copyWith(stateStatus: StateStatus.updating);
    final positionResult = await suppressThrowableAsyncDefault<Result<Position>>(
      throwable: () async {
        return Success(data: await Geolocator.getLastKnownPosition());
      },
      whenError: (error, stackTrace) async {
        return Failure(error: error);
      },
    );
    final lastKnowLocation = positionResult.dataOrNull?.let((it) => UserLatLng(latitude: it.latitude, longitude: it.longitude));
    final stateStatus = switch (positionResult) {
      Success() => StateStatus.updated,
      _ => StateStatus.errorUpdating,
    };
    value = peek().copyWith(lastKnownLocation: lastKnowLocation, error: positionResult.errorOrNull, stateStatus: stateStatus);
    return lastKnowLocation;
  }

  Future<void> _detachPositionStreamListener() async {
    await _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
  }

  Future<UserLatLng?> getCurrentLocation() async {
    value = peek().copyWith(stateStatus: StateStatus.updating);
    final positionResult = await suppressThrowableAsyncDefault<Result<Position>>(
      throwable: () async {
        return Success(data: await Geolocator.getCurrentPosition());
      },
      whenError: (error, stackTrace) async {
        return Failure(error: error);
      },
    );
    final currentLocation = positionResult.dataOrNull?.let((it) => UserLatLng(latitude: it.latitude, longitude: it.longitude));
    final stateStatus = switch (positionResult) {
      Success() => StateStatus.updated,
      _ => StateStatus.errorUpdating,
    };
    value = peek().copyWith(
      lastKnownLocation: currentLocation,
      currentLocation: currentLocation,
      error: positionResult.errorOrNull,
      stateStatus: stateStatus,
    );
    return currentLocation;
  }

  Future<void> startListeningLocationChange() async {
    value = peek().copyWith(isListeningLocationChange: true);
    await _detachPositionStreamListener();

    _positionStreamSubscription = Geolocator.getPositionStream().listen(
      (position) {
        final currentLocation = position.let((it) => UserLatLng(latitude: it.latitude, longitude: it.longitude));
        value = peek().copyWith(lastKnownLocation: currentLocation, currentLocation: currentLocation, error: null, stateStatus: StateStatus.updated);
      },
      onError: (error, stackTrace) {
        value = peek().copyWith(error: error, stateStatus: StateStatus.errorUpdating);
      },
    );
  }

  Future<void> stopListeningLocationChange() async {
    value = peek().copyWith(isListeningLocationChange: false);
    _detachPositionStreamListener();
  }
}
