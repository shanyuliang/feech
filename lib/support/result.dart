import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

sealed class Result<T> {
  T? get dataOrNull;
}

@Freezed()
class Success<T> extends Result<T> with _$Success {
  Success._();

  const factory Success({
    required final T data,
  }) = _Success;

  @override
  T? get dataOrNull => data;
}

@Freezed()
class Failure<T> extends Result<T> with _$Failure {
  Failure._();

  const factory Failure({
    final Object? error,
    final String? message,
  }) = _Failure;

  @override
  T? get dataOrNull => null;
}

@Freezed()
class Cancellation<T> extends Result<T> with _$Cancellation {
  Cancellation._();

  const factory Cancellation({
    final String? message,
  }) = _Cancellation;

  @override
  T? get dataOrNull => null;
}
