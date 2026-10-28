import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_storage_item.freezed.dart';

part 'web_storage_item.g.dart';

@freezed
@JsonSerializable()
class const WebStorageItem({required final String key, final dynamic value}) with _$WebStorageItem {
  factory WebStorageItem.fromJson(Map<String, dynamic> json) => _$WebStorageItemFromJson(json);

  Map<String, dynamic> toJson() => _$WebStorageItemToJson(this);
}
