import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../helpers/network_helper.dart';
import '../models/remote_themes.dart';
import '../support/network/app_client.dart';
import '../support/network/network_result.dart';
import '../support/result.dart';

class RemoteThemesSignal extends FutureSignal<RemoteThemes> {
  RemoteThemesSignal({bool debugLogDiagnostics = false})
    : super(() async {
        return RemoteThemes();
      }, options: AsyncSignalOptions(name: "RemoteThemesSignal"));
}

abstract class AbstractRemoteThemesRepository {
  Future<Result<RemoteThemes>> getRemoteThemes();
}

class AwsRemoteThemesRepository implements AbstractRemoteThemesRepository {
  late final NetworkHelper _networkHelper;
  final String Function(String)? corsProxy;
  final bool dummy;
  final bool debugLogDiagnostics;
  static const String apiBaseUrl = "https://www.woolworths.com.au/apis";
  static const String categoryProductsEndPoint = "/ui/browse/category";

  AwsRemoteThemesRepository({required Client client, this.corsProxy, this.dummy = false, this.debugLogDiagnostics = false}) {
    final appClient=AppClient(setUserAgent: true, timeoutOfRequest: (r) => const Duration(seconds: 10));
    _networkHelper = NetworkHelper(appClient);
  }

  @override
  Future<Result<RemoteThemes>> getRemoteThemes() async {
    final apiUrl = "$apiBaseUrl$categoryProductsEndPoint";
    final networkResult = await _networkHelper.postAsync<CategoryProductsRequest, CategoryProductsResponse, String>(
      url: corsProxy?.call(apiUrl) ?? apiUrl,
      headerMap: {cookieName: cookieValue},
      data: CategoryProductsRequest(categoryId: categoryId, pageNumber: pageNumber, pageSize: pageSize),
      requestJsonProcessor: CategoryProductsRequest.jsonProcessor,
      jsonProcessor: CategoryProductsResponse.jsonProcessor,
    );
    if (debugLogDiagnostics) {
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
