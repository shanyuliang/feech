import 'dart:async';
import 'dart:developer' as developer;

import 'package:http/http.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../helpers/network_helper.dart';
import '../models/remote_themes.dart';
import '../support/network/network_result.dart';
import '../support/result.dart';

class RemoteThemesSignal extends FutureSignal<RemoteThemes?> {
  RemoteThemesSignal({required AbstractRemoteThemesRepository remoteThemesRepository, bool debugLogDiagnostics = false})
    : super(() async {
        final responseResult = await remoteThemesRepository.getRemoteThemes();
        switch (responseResult) {
          case Success(data: final data):
            final result = data;
            return result;
          case Failure(error: final _):
            return null;
          case Cancellation():
            return null;
        }
      }, options: AsyncSignalOptions(name: "RemoteThemesSignal"));
}

abstract class AbstractRemoteThemesRepository {
  Future<Result<RemoteThemes>> getRemoteThemes();
}

class AwsRemoteThemesRepository implements AbstractRemoteThemesRepository {
  late final NetworkHelper _networkHelper;
  final String _remoteThemesUrl;
  final String Function(String)? _corsProxy;
  final bool _dummy;
  final bool _debugLogDiagnostics;

  AwsRemoteThemesRepository({
    required Client client,
    required this._remoteThemesUrl,
    this._corsProxy,
    this._dummy = false,
    this._debugLogDiagnostics = false,
  }) {
    _networkHelper = NetworkHelper(client);
  }

  @override
  Future<Result<RemoteThemes>> getRemoteThemes() async {
    if (_dummy) {
      return Success(data: RemoteThemes());
    } else {
      final networkResult = await _networkHelper.getAsync<RemoteThemes, String>(
        url: _corsProxy?.call(_remoteThemesUrl) ?? _remoteThemesUrl,
        jsonProcessor: RemoteThemes.jsonProcessor,
      );
      if (_debugLogDiagnostics) {
        developer.log(networkResult.toString(), name: "AwsRemoteThemesRepository.getRemoteThemes");
      }
      return switch (networkResult) {
        NetworkResultGood(value: final value) => Success(data: value),
        NetworkResultCancelled() => Cancellation(),
        NetworkResultTimeout(timeout: var timeout) => Failure(error: TimeoutException(null, timeout)),
        NetworkResultMalformed(error: final error) => Failure(error: error),
        NetworkResultHttpError(error: final error) => Failure(error: error),
        NetworkResultHttpErrorMalformed(error: final error) => Failure(error: error),
        NetworkResultIoError(error: final error) => Failure(error: error),
      };
    }
  }
}
