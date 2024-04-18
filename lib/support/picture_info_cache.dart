import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiver/collection.dart';

class PictureInfoCache {
  final LruMap<String, PictureInfo> lruMap = LruMap(maximumSize: 9999);

  static final PictureInfoCache _instance = PictureInfoCache._internal();

  factory PictureInfoCache() => _instance;

  PictureInfoCache._internal();

  void size(int size) {
    lruMap.maximumSize = size;
  }

  PictureInfo? get(String key) {
    return lruMap[key];
  }

  void set(String key, PictureInfo pictureInfo) {
    lruMap[key] = pictureInfo;
  }

  Future<PictureInfo> getOrSet(String key, Future<PictureInfo> Function() creator) async {
    var pictureInfo = lruMap[key];
    if (pictureInfo == null) {
      pictureInfo = await creator.call();
      lruMap[key] = pictureInfo;
    }
    return pictureInfo;
  }
}

final pictureInfoCache = PictureInfoCache();
