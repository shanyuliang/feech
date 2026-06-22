/**
 * A utility class to serialize in-flight calls based on a key. If a call with the same key is already in-flight, it returns the existing Future instead of starting a new one.
 * Usage example:
 * final _inFlightCallSerializer = InFlightCallSerializer();
 * ...
 * ...
 * ...
 * final result = await _inFlightCallSerializer.run<String?>('getAccessToken', _fetchAccessToken);
 */
class InFlightCallSerializer {
  final Map<String, Future<dynamic>> _inFlightCalls = {};

  Future<T> run<T>(String key, Future<T> Function() task) {
    final existing = _inFlightCalls[key];
    if (existing != null) return existing as Future<T>;

    final future = task().whenComplete(() => _inFlightCalls.remove(key));
    _inFlightCalls[key] = future;
    return future;
  }
}
