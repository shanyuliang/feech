import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

sealed class Result<T> {}

@Freezed()
class Success<T> extends Result<T> with _$Success {
  const factory Success({
    required final T data,
  }) = _Success;
}

@Freezed()
class Failure extends Result with _$Failure {
  const factory Failure({
    final Object? error,
    final String? message,
  }) = _Failure;
}

@Freezed()
class Cancellation extends Result with _$Cancellation {
  const factory Cancellation({
    final String? message,
  }) = _Cancellation;
}
