/// A utility class to run the task only once no matter how many times being called.
/// If the task is already running, it returns the existing Future instead of starting a new one.
/// Usage example:
/// final _onlyOnceExecutor = OnlyOnceExecutor();
/// ...
/// ...
/// ...
/// final result = await _onlyOnceExecutor.run<void>(_init);
class OnlyOnceExecutor {
  Future<dynamic>? _returningFuture;

  Future<T> run<T>(Future<T> Function() task) {
    if (_returningFuture != null) {
      return _returningFuture as Future<T>;
    }
    final future = task();
    _returningFuture = future;
    return future;
  }
}
