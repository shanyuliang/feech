import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../constants.dart';
import '../../extensions/base_request_extension.dart';
import '../../extensions/base_response_extension.dart';
import '../../extensions/uint8list_extension.dart';
import '../../extensions/x509certificate_extension.dart';
import 'http_header_key.dart';
import 'http_header_value.dart';
import 'http_method.dart';

final class AppClient extends BaseClient {
  final Client _innerClient;
  final bool debugLogDiagnostics;
  final bool isJsonAppClient;
  final List<String>? validSpkiPins;
  final FutureOr<void> Function(Request request)? updateOriginalRequest;
  final FutureOr<void> Function(Request request)? beforeSendingRequest;
  final FutureOr<void> Function(Response response)? afterReceivingResponse;
  final bool Function(Response response, int retriedCount)? retryWhen;
  final bool Function(Object error, StackTrace stackTrace, int retriedCount)? retryWhenError;
  final FutureOr<void> Function(Request request, Response? response, int retryCount)? onRetry;
  final Duration Function(Request request)? timeoutOfRequest;

  AppClient({
    this.debugLogDiagnostics = false,
    this.isJsonAppClient = false,
    this.validSpkiPins,
    this.updateOriginalRequest,
    this.beforeSendingRequest,
    this.afterReceivingResponse,
    this.retryWhen,
    this.retryWhenError,
    this.onRetry,
    this.timeoutOfRequest,
  }) : _innerClient = _createInnerClient();

  static Client _createInnerClient() {
    if (kIsWeb) {
      return Client();
    } else {
      return EnhancedIOClient();
    }
  }

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) => _sendUnstreamed(HttpMethod.head.methodName, url, headers);

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) => _sendUnstreamed(HttpMethod.get.methodName, url, headers);

  @override
  Future<Response> post(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _sendUnstreamed(HttpMethod.post.methodName, url, headers, body, encoding);

  @override
  Future<Response> put(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _sendUnstreamed(HttpMethod.put.methodName, url, headers, body, encoding);

  @override
  Future<Response> patch(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _sendUnstreamed(HttpMethod.patch.methodName, url, headers, body, encoding);

  @override
  Future<Response> delete(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _sendUnstreamed(HttpMethod.delete.methodName, url, headers, body, encoding);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return _innerClient.send(request);
  }

  @override
  void close() => _innerClient.close();

  Future<Response> _sendUnstreamed(String method, Uri url, Map<String, String>? headers, [Object? body, Encoding? encoding]) async {
    var count = 0;
    var request = await _createRequest(method, url, headers, body, encoding);
    Response? response;
    while (true) {
      try {
        await _beforeSendingRequest(request);
        final streamedResponse = await send(request).timeout(timeoutOfRequest?.call(request) ?? const Duration(seconds: 999999));
        if (streamedResponse is EnhancedIOStreamedResponse) {
          final validCertificate = streamedResponse._inner?.certificate?.validateSpkiPin(validSpkiPins) ?? false;
          if (!validCertificate) {
            final serverSpkiPin = streamedResponse._inner?.certificate?.der.asCertificateDerGetSpkiPin();
            throw ClientException(
              'Invalid server certificate\n${streamedResponse._inner?.certificate?.pem}\nServer SPKI pin is [$serverSpkiPin]\nExpect one of [${validSpkiPins?.join(",")}]',
              request.url,
            );
          }
        }
        response = await Response.fromStream(streamedResponse);
      } catch (error, stackTrace) {
        if (!(retryWhenError?.call(error, stackTrace, count) ?? false)) rethrow;
      }
      if (response != null) {
        await _afterReceivingResponse(response);
        if (!(retryWhen?.call(response, count) ?? false)) return response;
      }
      request = await _createRequest(method, url, headers, body, encoding);
      count++;
      await onRetry?.call(request, response, count);
    }
  }

  Future<Request> _createRequest(String method, Uri url, Map<String, String>? headers, [Object? body, Encoding? encoding]) async {
    final request = Request(method, url);
    if (headers != null) request.headers.addAll(headers);
    if (encoding != null) request.encoding = encoding;
    if (body != null) {
      if (body is String) {
        request.body = body;
      } else if (body is List) {
        request.bodyBytes = body.cast<int>();
      } else if (body is Map) {
        request.bodyFields = body.cast<String, String>();
      } else {
        throw ArgumentError('Invalid request body "$body".');
      }
    }
    await _updateOriginalRequest(request);
    return request;
  }

  FutureOr<void> _updateOriginalRequest(Request request) async {
    if (isJsonAppClient) {
      request.headers[HttpHeaderKey.contentType.keyName] = HttpHeaderValue.contentTypeJson.value;
      request.headers[HttpHeaderKey.accept.keyName] = HttpHeaderValue.acceptJson.value;
    }
    await updateOriginalRequest?.call(request);
    if (debugLogDiagnostics) {
      developer.log("AppClient after updating REQUEST ${request.toLoggingString()}", name: debugTag);
    }
  }

  FutureOr<void> _beforeSendingRequest(Request request) async {
    await beforeSendingRequest?.call(request);
    if (debugLogDiagnostics) {
      developer.log("AppClient before sending REQUEST ${request.toLoggingString()}", name: debugTag);
    }
  }

  FutureOr<void> _afterReceivingResponse(Response response) async {
    await afterReceivingResponse?.call(response);
    if (debugLogDiagnostics) {
      developer.log("AppClient after receiving RESPONSE ${response.toLoggingString()}", name: debugTag);
    }
  }
}

class EnhancedIOStreamedResponse extends StreamedResponse {
  final HttpClientResponse? _inner;

  EnhancedIOStreamedResponse(
    super.stream,
    super.statusCode, {
    super.contentLength,
    super.request,
    super.headers,
    super.isRedirect,
    super.persistentConnection,
    super.reasonPhrase,
    HttpClientResponse? inner,
  }) : _inner = inner;

  Future<Socket> detachSocket() async => _inner!.detachSocket();
}

BaseClient createClient() {
  if (const bool.fromEnvironment('no_default_http_client')) {
    throw StateError(
      'no_default_http_client was defined but runWithClient '
      'was not used to configure a Client implementation.',
    );
  }
  return EnhancedIOClient();
}

class EnhancedIOClient extends BaseClient {
  /// The underlying `dart:io` HTTP client.
  HttpClient? _inner;

  EnhancedIOClient([HttpClient? inner]) : _inner = inner ?? HttpClient();

  /// Sends an HTTP request and asynchronously returns the response.
  @override
  Future<EnhancedIOStreamedResponse> send(BaseRequest request) async {
    if (_inner == null) {
      throw ClientException('HTTP request failed. Client is already closed.', request.url);
    }

    var stream = request.finalize();

    try {
      var ioRequest = (await _inner!.openUrl(request.method, request.url))
        ..followRedirects = request.followRedirects
        ..maxRedirects = request.maxRedirects
        ..contentLength = (request.contentLength ?? -1)
        ..persistentConnection = request.persistentConnection;
      request.headers.forEach((name, value) {
        ioRequest.headers.set(name, value);
      });

      var response = await stream.pipe(ioRequest) as HttpClientResponse;
      var headers = <String, String>{};
      response.headers.forEach((key, values) {
        headers[key] = values.join(',');
      });

      return EnhancedIOStreamedResponse(
        response.handleError((Object error) {
          final httpException = error as HttpException;
          throw ClientException(httpException.message, httpException.uri);
        }, test: (error) => error is HttpException),
        response.statusCode,
        contentLength: response.contentLength == -1 ? null : response.contentLength,
        request: request,
        headers: headers,
        isRedirect: response.isRedirect,
        persistentConnection: response.persistentConnection,
        reasonPhrase: response.reasonPhrase,
        inner: response,
      );
    } on SocketException catch (error) {
      throw _EnhancedClientSocketException(error, request.url);
    } on HttpException catch (error) {
      throw ClientException(error.message, error.uri);
    }
  }

  /// Closes the client.
  ///
  /// Terminates all active connections. If a client remains unclosed, the Dart
  /// process may not terminate.
  @override
  void close() {
    if (_inner != null) {
      _inner!.close(force: true);
      _inner = null;
    }
  }
}

class _EnhancedClientSocketException extends ClientException implements SocketException {
  final SocketException cause;

  _EnhancedClientSocketException(SocketException e, Uri uri) : cause = e, super(e.message, uri);

  @override
  InternetAddress? get address => cause.address;

  @override
  OSError? get osError => cause.osError;

  @override
  int? get port => cause.port;

  @override
  String toString() => 'EnhancedClientException with $cause, uri=$uri';
}
