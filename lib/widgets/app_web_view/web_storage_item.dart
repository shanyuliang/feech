import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_storage_item.freezed.dart';

part 'web_storage_item.g.dart';

@Freezed()
class WebStorageItem with _$WebStorageItem {
  const WebStorageItem._();

  factory WebStorageItem.fromJson(Map<String, dynamic> json) => _$WebStorageItemFromJson(json);

  const factory WebStorageItem({
    required final String key,
    final dynamic value,
  }) = _WebStorageItem;
}
