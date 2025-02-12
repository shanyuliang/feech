import 'http_status.dart';

abstract class NetworkResult<G, E> {
  NetworkResult._();

  G? getGoodValueOrNull();

  E? getErrorValueOrNull();

  Exception? getExceptionOrNull();

  String? getErrorMessageOrNull();

  factory NetworkResult.good(G? value, HttpStatus httpStatus) => NetworkResultGood<G, E>._internal(value, httpStatus);

  factory NetworkResult.malformed(String value, HttpStatus httpStatus, Exception exception) =>
      NetworkResultMalformed<G, E>._internal(value, httpStatus, exception);

  factory NetworkResult.httpError(E? value, HttpStatus httpStatus) => NetworkResultHttpError<G, E>._internal(value, httpStatus);

  factory NetworkResult.httpErrorMalformed(String value, HttpStatus httpStatus, Exception exception) =>
      NetworkResultHttpErrorMalformed<G, E>._internal(value, httpStatus, exception);

  factory NetworkResult.ioError(Exception exception) => NetworkResultIoError<G, E>._internal(exception);

  factory NetworkResult.timeout(Duration? timeout) => NetworkResultTimeout<G, E>._internal(timeout);

  factory NetworkResult.cancelled() => NetworkResultCancelled<G, E>._internal();
}

class NetworkResultGood<G, E> extends NetworkResult<G, E> {
  final G? value;
  final HttpStatus httpStatus;

  NetworkResultGood._internal(this.value, this.httpStatus) : super._();

  @override
  String toString() => "{NetworkResultGood={httpStatus=$httpStatus},value=$value}";

  @override
  String? getErrorMessageOrNull() => null;

  @override
  E? getErrorValueOrNull() => null;

  @override
  Exception? getExceptionOrNull() => null;

  @override
  G? getGoodValueOrNull() => value;
}

class NetworkResultHttpError<G, E> extends NetworkResult<G, E> {
  final E? value;
  final HttpStatus httpStatus;

  NetworkResultHttpError._internal(this.value, this.httpStatus) : super._();

  @override
  String toString() => "{NetworkResultHttpError={httpStatus=$httpStatus,value=$value}}";

  @override
  String? getErrorMessageOrNull() => httpStatus.message;

  @override
  E? getErrorValueOrNull() => value;

  @override
  Exception? getExceptionOrNull() => null;

  @override
  G? getGoodValueOrNull() => null;
}

class NetworkResultMalformed<G, E> extends NetworkResult<G, E> {
  final String value;
  final HttpStatus httpStatus;
  final Exception exception;

  NetworkResultMalformed._internal(this.value, this.httpStatus, this.exception) : super._();

  @override
  String toString() => "{NetworkResultMalformed={httpStatus=$httpStatus,exception=$exception,value=$value}}";

  @override
  String? getErrorMessageOrNull() => null;

  @override
  E? getErrorValueOrNull() => null;

  @override
  Exception? getExceptionOrNull() => exception;

  @override
  G? getGoodValueOrNull() => null;
}

class NetworkResultHttpErrorMalformed<G, E> extends NetworkResult<G, E> {
  final String value;
  final HttpStatus httpStatus;
  final Exception exception;

  NetworkResultHttpErrorMalformed._internal(this.value, this.httpStatus, this.exception) : super._();

  @override
  String toString() => "{NetworkResultHttpErrorMalformed={httpStatus=$httpStatus,exception=$exception,value=$value}}";

  @override
  String? getErrorMessageOrNull() => httpStatus.message;

  @override
  E? getErrorValueOrNull() => null;

  @override
  Exception? getExceptionOrNull() => exception;

  @override
  G? getGoodValueOrNull() => null;
}

class NetworkResultIoError<G, E> extends NetworkResult<G, E> {
  final Exception exception;

  NetworkResultIoError._internal(this.exception) : super._();

  @override
  String toString() => "{NetworkResultIoError={exception=$exception}";

  @override
  String? getErrorMessageOrNull() => null;

  @override
  E? getErrorValueOrNull() => null;

  @override
  Exception? getExceptionOrNull() => exception;

  @override
  G? getGoodValueOrNull() => null;
}

class NetworkResultTimeout<G, E> extends NetworkResult<G, E> {
  final Duration? timeout;

  NetworkResultTimeout._internal(this.timeout) : super._();

  @override
  String toString() => "{NetworkResultTimeout={timeout=${timeout.toString()}}";

  @override
  String? getErrorMessageOrNull() => "Network operation timeout ${timeout.toString()}";

  @override
  E? getErrorValueOrNull() => null;

  @override
  Exception? getExceptionOrNull() => null;

  @override
  G? getGoodValueOrNull() => null;
}

class NetworkResultCancelled<G, E> extends NetworkResult<G, E> {
  NetworkResultCancelled._internal() : super._();

  @override
  String toString() => "{NetworkResultCancelled}";

  @override
  String? getErrorMessageOrNull() => "Network operation cancelled";

  @override
  E? getErrorValueOrNull() => null;

  @override
  Exception? getExceptionOrNull() => null;

  @override
  G? getGoodValueOrNull() => null;
}
