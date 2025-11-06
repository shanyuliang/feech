import 'http_status.dart';

sealed class NetworkResult<G, E> {}

class NetworkResultGood<G, E> extends NetworkResult<G, E> {
  final G? value;
  final HttpStatus httpStatus;

  NetworkResultGood(this.value, this.httpStatus);

  @override
  String toString() =>
      "NetworkResultGood [httpStatus=$httpStatus,value=$value]";
}

class NetworkResultMalformed<G, E> extends NetworkResult<G, E> {
  final String? stringValue;
  final HttpStatus httpStatus;
  final Object? error;

  NetworkResultMalformed(this.stringValue, this.httpStatus, this.error);

  @override
  String toString() =>
      "NetworkResultMalformed [httpStatus=$httpStatus,error=$error,stringValue=$stringValue]";
}

class NetworkResultHttpError<G, E> extends NetworkResult<G, E> {
  final E? error;
  final HttpStatus httpStatus;

  NetworkResultHttpError(this.error, this.httpStatus);

  @override
  String toString() =>
      "NetworkResultHttpError [httpStatus=$httpStatus,error=$error]";
}

class NetworkResultHttpErrorMalformed<G, E> extends NetworkResult<G, E> {
  final String? stringValue;
  final HttpStatus httpStatus;
  final Object? error;

  NetworkResultHttpErrorMalformed(
      this.stringValue, this.httpStatus, this.error);

  @override
  String toString() =>
      "NetworkResultHttpErrorMalformed [httpStatus=$httpStatus,error=$error,stringValue=$stringValue]";
}

class NetworkResultIoError<G, E> extends NetworkResult<G, E> {
  final Object? error;

  NetworkResultIoError(this.error);

  @override
  String toString() => "NetworkResultIoError [error=$error]";
}

class NetworkResultTimeout<G, E> extends NetworkResult<G, E> {
  final Duration? timeout;

  NetworkResultTimeout(this.timeout);

  @override
  String toString() => "NetworkResultTimeout [timeout=$timeout]";
}

class NetworkResultCancelled<G, E> extends NetworkResult<G, E> {
  NetworkResultCancelled();

  @override
  String toString() => "NetworkResultCancelled";
}
