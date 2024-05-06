sealed class Result<T> {
  T? get dataOrNull;

  Object? get errorOrNull;
}

class Success<T> extends Result<T> {
  final T? data;

  Success({this.data});

  @override
  T? get dataOrNull => data;

  @override
  Object? get errorOrNull => null;
}

class Failure<T> extends Result<T> {
  final Object? error;

  Failure({this.error});

  @override
  T? get dataOrNull => null;

  @override
  Object? get errorOrNull => error;
}

class Cancellation<T> extends Result<T> {
  @override
  T? get dataOrNull => null;

  @override
  Object? get errorOrNull => null;
}
