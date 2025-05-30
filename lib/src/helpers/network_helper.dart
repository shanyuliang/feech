import 'dart:async';
import 'dart:typed_data';

import 'package:http/http.dart';

import '../extensions/general_type_extension.dart';
import '../support/cancellation_exception.dart';
import '../support/json_converter_ex.dart';
import '../support/network/http_method.dart';
import '../support/network/http_status.dart';
import '../support/network/network_result.dart';

class NetworkHelper {
  final Map<String, Completer> _runningCompleterMap = {};
  final Client _client;

  NetworkHelper(this._client);

  Future<NetworkResult<G, E>> _createNetworkResultFromResponse<G, E>(
    Response response,
    JsonConverterEx<G, String>? jsonProcessor,
    JsonConverterEx<E, String>? errorJsonProcessor,
  ) async {
    NetworkResult<G, E> networkResult;
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      if (G == Uint8List) {
        networkResult = NetworkResultGood(response.bodyBytes as G, HttpStatus.fromResponse(response));
      } else if (G == String) {
        networkResult = NetworkResultGood(response.body as G, HttpStatus.fromResponse(response));
      } else if (jsonProcessor != null) {
        try {
          final object = await jsonProcessor.fromJsonEx(response.body);
          networkResult = NetworkResultGood(object, HttpStatus.fromResponse(response));
        } catch (ex) {
          final exception = (ex is Exception) ? ex : Exception(ex.toString());
          networkResult = NetworkResultMalformed(response.body, HttpStatus.fromResponse(response), exception);
        }
      } else {
        networkResult = NetworkResultGood(response.body as G, HttpStatus.fromResponse(response));
      }
    } else {
      if (errorJsonProcessor != null) {
        try {
          final object = await errorJsonProcessor.fromJsonEx(response.body);
          networkResult = NetworkResultHttpError(object, HttpStatus.fromResponse(response));
        } catch (ex) {
          final exception = (ex is Exception) ? ex : Exception(ex.toString());
          networkResult = NetworkResultHttpErrorMalformed(response.body, HttpStatus.fromResponse(response), exception);
        }
      } else {
        networkResult = NetworkResultHttpError(response.body as E, HttpStatus.fromResponse(response));
      }
    }
    return networkResult;
  }

  Future<NetworkResult<G, E>> _doAsync<P, G, E>({
    required HttpMethod httpMethod,
    required Uri url,
    Map<String, String>? headerMap,
    P? data,
    JsonConverterEx<P, String>? requestJsonProcessor,
    JsonConverterEx<G, String>? jsonProcessor,
    JsonConverterEx<E, String>? errorJsonProcessor,
    String? tag,
  }) async {
    NetworkResult<G, E> networkResult;
    Completer<Response> completer = Completer();
    _runningCompleterMap[tag ?? url.toString()] = completer;
    headerMap ??= {};
    // if (token != null) {
    //   headerMap["Authorization"] = "Bearer $token";
    // } else if (username != null && password != null) {
    //   final credentials = "$username:$password";
    //   final encodedCredentials = utf8.fuse(base64).encode(credentials);
    //   headerMap["Authorization"] = "Basic $encodedCredentials";
    // }
    final body = await data?.let((it) => requestJsonProcessor?.toJsonEx(it));
    try {
      final futureResponse = switch (httpMethod) {
        HttpMethod.head => _client.head(url, headers: headerMap),
        HttpMethod.get => _client.get(url, headers: headerMap),
        HttpMethod.post => _client.post(url, headers: headerMap, body: body),
        HttpMethod.put => _client.put(url, headers: headerMap, body: body),
        HttpMethod.patch => _client.patch(url, headers: headerMap, body: body),
        HttpMethod.delete => _client.delete(url, headers: headerMap),
      };
      futureResponse.then(
        (response) {
          if (!completer.isCompleted) {
            completer.complete(response);
          }
        },
        onError: (error) {
          if (!completer.isCompleted) {
            completer.completeError(error);
          }
          return null;
        },
      );
      final response = await completer.future;
      networkResult = await _createNetworkResultFromResponse(response, jsonProcessor, errorJsonProcessor);
    } on TimeoutException catch (e) {
      networkResult = NetworkResultTimeout(e.duration);
    } on CancellationException {
      networkResult = NetworkResultCancelled();
    } catch (e) {
      networkResult = NetworkResultIoError(e as Exception);
    } finally {
      _runningCompleterMap.remove(tag ?? url.toString());
    }
    return networkResult;
  }

  Future<NetworkResult<G, E>> headAsync<G, E>({required String url, Map<String, String>? headerMap, String? tag}) {
    return _doAsync(httpMethod: HttpMethod.head, url: Uri.parse(url), headerMap: headerMap, tag: tag);
  }

  Future<NetworkResult<G, E>> getAsync<G, E>({
    required String url,
    Map<String, String>? headerMap,
    JsonConverterEx<G, String>? jsonProcessor,
    JsonConverterEx<E, String>? errorJsonProcessor,
    String? tag,
  }) {
    return _doAsync(
      httpMethod: HttpMethod.get,
      url: Uri.parse(url),
      headerMap: headerMap,
      jsonProcessor: jsonProcessor,
      errorJsonProcessor: errorJsonProcessor,
      tag: tag,
    );
  }

  Future<NetworkResult<G, E>> postAsync<P, G, E>({
    required String url,
    Map<String, String>? headerMap,
    P? data,
    JsonConverterEx<P, String>? requestJsonProcessor,
    JsonConverterEx<G, String>? jsonProcessor,
    JsonConverterEx<E, String>? errorJsonProcessor,
    String? tag,
  }) {
    return _doAsync(
      httpMethod: HttpMethod.post,
      url: Uri.parse(url),
      headerMap: headerMap,
      data: data,
      requestJsonProcessor: requestJsonProcessor,
      jsonProcessor: jsonProcessor,
      errorJsonProcessor: errorJsonProcessor,
      tag: tag,
    );
  }

  Future<NetworkResult<G, E>> putAsync<P, G, E>({
    required String url,
    Map<String, String>? headerMap,
    P? data,
    JsonConverterEx<P, String>? requestJsonProcessor,
    JsonConverterEx<G, String>? jsonProcessor,
    JsonConverterEx<E, String>? errorJsonProcessor,
    String? tag,
  }) {
    return _doAsync(
      httpMethod: HttpMethod.put,
      url: Uri.parse(url),
      headerMap: headerMap,
      data: data,
      requestJsonProcessor: requestJsonProcessor,
      jsonProcessor: jsonProcessor,
      errorJsonProcessor: errorJsonProcessor,
      tag: tag,
    );
  }

  Future<NetworkResult<G, E>> patchAsync<P, G, E>({
    required String url,
    Map<String, String>? headerMap,
    P? data,
    JsonConverterEx<P, String>? requestJsonProcessor,
    JsonConverterEx<G, String>? jsonProcessor,
    JsonConverterEx<E, String>? errorJsonProcessor,
    String? tag,
  }) {
    return _doAsync(
      httpMethod: HttpMethod.patch,
      url: Uri.parse(url),
      headerMap: headerMap,
      data: data,
      requestJsonProcessor: requestJsonProcessor,
      jsonProcessor: jsonProcessor,
      errorJsonProcessor: errorJsonProcessor,
      tag: tag,
    );
  }

  Future<NetworkResult<G, E>> deleteAsync<G, E>({
    required String url,
    Map<String, String>? headerMap,
    JsonConverterEx<G, String>? jsonProcessor,
    JsonConverterEx<E, String>? errorJsonProcessor,
    String? tag,
  }) {
    return _doAsync(
      httpMethod: HttpMethod.delete,
      url: Uri.parse(url),
      headerMap: headerMap,
      jsonProcessor: jsonProcessor,
      errorJsonProcessor: errorJsonProcessor,
      tag: tag,
    );
  }

  void cancel(String tag) {
    final completer = _runningCompleterMap[tag];
    if (completer != null && !completer.isCompleted) {
      completer.completeError(const CancellationException());
    }
  }
}
