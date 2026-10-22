// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'primary_color_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrimaryColorCategory {


/// Create a copy of PrimaryColorCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrimaryColorCategoryCopyWith<PrimaryColorCategory> get copyWith => _$PrimaryColorCategoryCopyWithImpl<PrimaryColorCategory>(this as PrimaryColorCategory, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PrimaryColorCategory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrimaryColorCategory&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameAlias, _this.nameAlias) || other.nameAlias == _this.nameAlias)&&const DeepCollectionEquality().equals(other.colors, _this.colors));
}


@override
int get hashCode {
  final _this = this as PrimaryColorCategory;
  return Object.hash(runtimeType,_this.name,_this.nameAlias,const DeepCollectionEquality().hash(_this.colors));
}

@override
String toString() {
  final _this = this as PrimaryColorCategory;
  return 'PrimaryColorCategory(name: ${_this.name}, nameAlias: ${_this.nameAlias}, colors: ${_this.colors})';
}


}

/// @nodoc
abstract mixin class $PrimaryColorCategoryCopyWith<$Res>  {
  factory $PrimaryColorCategoryCopyWith(PrimaryColorCategory value, $Res Function(PrimaryColorCategory) _then) = _$PrimaryColorCategoryCopyWithImpl;
@useResult
$Res call({
 String name, String? nameAlias, List<PrimaryColor> colors
});




}
/// @nodoc
class _$PrimaryColorCategoryCopyWithImpl<$Res>
    implements $PrimaryColorCategoryCopyWith<$Res> {
  _$PrimaryColorCategoryCopyWithImpl(this._self, this._then);

  final PrimaryColorCategory _self;
  final $Res Function(PrimaryColorCategory) _then;

/// Create a copy of PrimaryColorCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? nameAlias = freezed,Object? colors = null,}) {
  return _then(PrimaryColorCategory(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameAlias: freezed == nameAlias ? _self.nameAlias : nameAlias // ignore: cast_nullable_to_non_nullable
as String?,colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as List<PrimaryColor>,
  ));
}

}



// dart format on
