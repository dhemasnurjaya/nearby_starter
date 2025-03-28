import 'package:nearby_starter/core/error/exceptions.dart';

/// Cache base class
abstract class Cache<K, V> {
  /// Add a value to the cache.
  Future<void> write(K key, V value);

  /// Read a value from the cache, throws [CacheException]
  /// if the value is not found.
  Future<V> read(K key);

  /// List all values in the cache.
  Future<List<V>> values();

  /// List all keys in the cache.
  Future<List<K>> keys();

  /// Remove a value from the cache, throws [CacheException]
  /// if the value is not found.
  Future<V> delete(K key);

  /// Clear the cache.
  Future<void> clear();
}

/// Memory cache implementation using a Map.
class MemoryCache<K, V> implements Cache<K, V> {
  final Map<K, V> _cache;

  MemoryCache({Map<K, V>? mapImpl}) : _cache = mapImpl ?? <K, V>{};

  @override
  Future<void> write(K key, V value) async {
    _cache[key] = value;
  }

  @override
  Future<V> read(K key) async {
    final data = _cache[key];
    if (data == null) {
      throw CacheException();
    }
    return data;
  }

  @override
  Future<List<V>> values() async {
    return _cache.values.toList();
  }

  @override
  Future<List<K>> keys() async {
    return _cache.keys.toList();
  }

  @override
  Future<V> delete(K key) async {
    final result = _cache.remove(key);
    if (result == null) {
      throw CacheException();
    }
    return result;
  }

  @override
  Future<void> clear() async {
    return _cache.clear();
  }
}
