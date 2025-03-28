// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_storage_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WebStorageItem {

 String get key; dynamic get value;
/// Create a copy of WebStorageItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebStorageItemCopyWith<WebStorageItem> get copyWith => _$WebStorageItemCopyWithImpl<WebStorageItem>(this as WebStorageItem, _$identity);

  /// Serializes this WebStorageItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebStorageItem&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'WebStorageItem(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $WebStorageItemCopyWith<$Res>  {
  factory $WebStorageItemCopyWith(WebStorageItem value, $Res Function(WebStorageItem) _then) = _$WebStorageItemCopyWithImpl;
@useResult
$Res call({
 String key, dynamic value
});




}
/// @nodoc
class _$WebStorageItemCopyWithImpl<$Res>
    implements $WebStorageItemCopyWith<$Res> {
  _$WebStorageItemCopyWithImpl(this._self, this._then);

  final WebStorageItem _self;
  final $Res Function(WebStorageItem) _then;

/// Create a copy of WebStorageItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? value = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WebStorageItem extends WebStorageItem {
  const _WebStorageItem({required this.key, this.value}): super._();
  factory _WebStorageItem.fromJson(Map<String, dynamic> json) => _$WebStorageItemFromJson(json);

@override final  String key;
@override final  dynamic value;

/// Create a copy of WebStorageItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebStorageItemCopyWith<_WebStorageItem> get copyWith => __$WebStorageItemCopyWithImpl<_WebStorageItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebStorageItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebStorageItem&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'WebStorageItem(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$WebStorageItemCopyWith<$Res> implements $WebStorageItemCopyWith<$Res> {
  factory _$WebStorageItemCopyWith(_WebStorageItem value, $Res Function(_WebStorageItem) _then) = __$WebStorageItemCopyWithImpl;
@override @useResult
$Res call({
 String key, dynamic value
});




}
/// @nodoc
class __$WebStorageItemCopyWithImpl<$Res>
    implements _$WebStorageItemCopyWith<$Res> {
  __$WebStorageItemCopyWithImpl(this._self, this._then);

  final _WebStorageItem _self;
  final $Res Function(_WebStorageItem) _then;

/// Create a copy of WebStorageItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = freezed,}) {
  return _then(_WebStorageItem(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
