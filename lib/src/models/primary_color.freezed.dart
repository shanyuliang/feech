// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'primary_color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrimaryColor {


/// Create a copy of PrimaryColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrimaryColorCopyWith<PrimaryColor> get copyWith => _$PrimaryColorCopyWithImpl<PrimaryColor>(this as PrimaryColor, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PrimaryColor;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrimaryColor&&(identical(other.color, _this.color) || other.color == _this.color)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.nameAlias, _this.nameAlias) || other.nameAlias == _this.nameAlias));
}


@override
int get hashCode {
  final _this = this as PrimaryColor;
  return Object.hash(runtimeType,_this.color,_this.id,_this.name,_this.nameAlias);
}

@override
String toString() {
  final _this = this as PrimaryColor;
  return 'PrimaryColor(color: ${_this.color}, id: ${_this.id}, name: ${_this.name}, nameAlias: ${_this.nameAlias})';
}


}

/// @nodoc
abstract mixin class $PrimaryColorCopyWith<$Res>  {
  factory $PrimaryColorCopyWith(PrimaryColor value, $Res Function(PrimaryColor) _then) = _$PrimaryColorCopyWithImpl;
@useResult
$Res call({
@ColorStringConverter() Color color, String? id, String? name, String? nameAlias
});




}
/// @nodoc
class _$PrimaryColorCopyWithImpl<$Res>
    implements $PrimaryColorCopyWith<$Res> {
  _$PrimaryColorCopyWithImpl(this._self, this._then);

  final PrimaryColor _self;
  final $Res Function(PrimaryColor) _then;

/// Create a copy of PrimaryColor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = null,Object? id = freezed,Object? name = freezed,Object? nameAlias = freezed,}) {
  return _then(PrimaryColor(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,nameAlias: freezed == nameAlias ? _self.nameAlias : nameAlias // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}



// dart format on
