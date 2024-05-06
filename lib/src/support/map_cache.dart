import 'dart:async';
import 'dart:collection';

import 'cache.dart';
import 'lru_map.dart';

/// A [Cache] that's backed by a [Map].
class MapCache<K, V> implements Cache<K, V> {
  /// Creates a new [MapCache], optionally using [map] as the backing [Map].
  MapCache({Map<K, V>? map}) : _map = map ?? HashMap<K, V>();

  /// Creates a new [MapCache], using [LruMap] as the backing [Map].
  ///
  /// When [maximumSize] is specified, the cache is limited to the specified
  /// number of pairs, otherwise it is limited to 100.
  factory MapCache.lru({int? maximumSize, Future<void> Function({required K key, required V value})? onEvicted}) {
    return MapCache<K, V>(map: LruMap(maximumSize: maximumSize, onEvicted: onEvicted));
  }

  final Map<K, V> _map;

  /// Map of outstanding ifAbsent calls used to prevent concurrent loads of the
  /// same key.
  final _outstanding = <K, FutureOr<V>>{};

  @override
  Future<V?> get(K key, {Loader<K, V>? ifAbsent}) async {
    if (_map.containsKey(key)) {
      return _map[key];
    }
    // If this key is already loading then return the existing future.
    if (_outstanding.containsKey(key)) {
      return _outstanding[key];
    }
    if (ifAbsent != null) {
      var futureOr = ifAbsent(key);
      _outstanding[key] = futureOr;
      V v;
      try {
        v = await futureOr;
      } finally {
        // Always remove key from [_outstanding] to prevent returning the
        // failed result again.
        _outstanding.remove(key);
      }
      _map[key] = v;
      return v;
    }
    return null;
  }

  @override
  Future<void> set(K key, V value) async {
    _map[key] = value;
  }

  @override
  Future<void> invalidate(K key) async {
    _map.remove(key);
  }
}
