import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quiver/collection.dart';

class BitmapDescriptorCache {
  final LruMap<int, BitmapDescriptor> lruMap = LruMap(maximumSize: 9999);

  static final BitmapDescriptorCache _instance = BitmapDescriptorCache._internal();

  factory BitmapDescriptorCache() => _instance;

  BitmapDescriptorCache._internal();

  void size(int size) {
    lruMap.maximumSize = size;
  }

  BitmapDescriptor? get(String key, int width, int height) {
    return lruMap[Object.hash(key, width, height)];
  }

  void set(String key, int width, int height, BitmapDescriptor bitmapDescriptor) {
    lruMap[Object.hash(key, width, height)] = bitmapDescriptor;
  }
}

final bitmapDescriptorCache = BitmapDescriptorCache();
