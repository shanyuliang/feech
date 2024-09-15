import 'http_status.dart';

sealed class NetworkResult<G, E> {}

class NetworkResultGood<G, _> extends NetworkResult<G, _> {
  final G? value;
  final HttpStatus httpStatus;

  NetworkResultGood(this.value, this.httpStatus);

  @override
  String toString() =>
      "NetworkResultGood [httpStatus=$httpStatus,value=$value]";
}

class NetworkResultMalformed<_, __> extends NetworkResult<_, __> {
  final String? stringValue;
  final HttpStatus httpStatus;
  final Object? error;

  NetworkResultMalformed(this.stringValue, this.httpStatus, this.error);

  @override
  String toString() =>
      "NetworkResultMalformed [httpStatus=$httpStatus,stringValue=$stringValue,error=$error]";
}

class NetworkResultHttpError<_, E> extends NetworkResult<_, E> {
  final E? error;
  final HttpStatus httpStatus;

  NetworkResultHttpError(this.error, this.httpStatus);

  @override
  String toString() =>
      "NetworkResultHttpError [httpStatus=$httpStatus,error=$error]";
}

class NetworkResultHttpErrorMalformed<_, __> extends NetworkResult<_, __> {
  final String? stringValue;
  final HttpStatus httpStatus;
  final Object? error;

  NetworkResultHttpErrorMalformed(
      this.stringValue, this.httpStatus, this.error);

  @override
  String toString() =>
      "NetworkResultHttpErrorMalformed [httpStatus=$httpStatus,stringValue=$stringValue,error=$error]";
}

class NetworkResultIoError<_, __> extends NetworkResult<_, __> {
  final Object? error;

  NetworkResultIoError(this.error);

  @override
  String toString() => "NetworkResultIoError [error=$error]";
}

class NetworkResultTimeout<_, __> extends NetworkResult<_, __> {
  final Duration? timeout;

  NetworkResultTimeout(this.timeout);

  @override
  String toString() => "NetworkResultTimeout [timeout=$timeout]";
}

class NetworkResultCancelled<_, __> extends NetworkResult<_, __> {
  NetworkResultCancelled();

  @override
  String toString() => "NetworkResultCancelled";
}
