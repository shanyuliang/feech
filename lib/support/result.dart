sealed class Result<T> {
  T? get dataOrNull;
}

class Success<T> extends Result<T> {
  final T data;

  Success({required this.data});

  @override
  T? get dataOrNull => data;
}

class Failure<T> extends Result<T> {
  final Object? error;

  Failure({this.error});

  @override
  T? get dataOrNull => null;
}

class Cancellation<T> extends Result<T> {
  @override
  T? get dataOrNull => null;
}
