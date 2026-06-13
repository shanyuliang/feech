/**
 * A utility class to serialize in-flight calls based on a key. If a call with the same key is already in-flight, it returns the existing Future instead of starting a new one.
 * Usage example:
 * final _inFlightCallSerializer = InFlightCallSerializer();
 * final result = await _inFlightCallSerializer.run<String?>('getAccessToken', _fetchAccessToken);
 */
class InFlightCallSerializer {
  final Map<String, Future<Object?>> _inFlightCalls = <String, Future<Object?>>{};

  Future<T> run<T>(String key, Future<T> Function() task) {
    final inFlight = _inFlightCalls[key];
    if (inFlight != null) {
      return inFlight as Future<T>;
    }

    final future = task();
    _inFlightCalls[key] = future as Future<Object?>;

    return future.whenComplete(() {
      if (identical(_inFlightCalls[key], future)) {
        _inFlightCalls.remove(key);
      }
    });
  }
}
