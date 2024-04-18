import 'dart:async';

/// A function that produces a value for [key], for when a [Cache] needs to
/// populate an entry.
///
/// The loader function should either return a value synchronously or a
/// [Future] which completes with the value asynchronously.
typedef Loader<K, V> = FutureOr<V> Function(K key);

/// A semi-persistent mapping of keys to values.
///
/// All access to a Cache is asynchronous because implementations may store
/// their entries in remote systems, isolates, or otherwise have to do async IO
/// to read and write.
abstract class Cache<K, V> {
  /// Returns the value associated with [key].
  ///
  /// If [ifAbsent] is specified and no value is associated with the key, a
  /// mapping is added and the value is returned. Otherwise, returns null.
  Future<V?> get(K key, {Loader<K, V>? ifAbsent});

  /// Sets the value associated with [key]. The Future completes when the
  /// operation is complete.
  Future<void> set(K key, V value);

  /// Removes the value associated with [key]. The Future completes when the
  /// operation is complete.
  Future<void> invalidate(K key);
}
