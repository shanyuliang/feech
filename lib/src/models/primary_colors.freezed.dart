// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'primary_colors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrimaryColors {


/// Create a copy of PrimaryColors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrimaryColorsCopyWith<PrimaryColors> get copyWith => _$PrimaryColorsCopyWithImpl<PrimaryColors>(this as PrimaryColors, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PrimaryColors;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrimaryColors&&const DeepCollectionEquality().equals(other.cultures, _this.cultures));
}


@override
int get hashCode {
  final _this = this as PrimaryColors;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.cultures));
}

@override
String toString() {
  final _this = this as PrimaryColors;
  return 'PrimaryColors(cultures: ${_this.cultures})';
}


}

/// @nodoc
abstract mixin class $PrimaryColorsCopyWith<$Res>  {
  factory $PrimaryColorsCopyWith(PrimaryColors value, $Res Function(PrimaryColors) _then) = _$PrimaryColorsCopyWithImpl;
@useResult
$Res call({
 List<PrimaryColorCulture> cultures
});




}
/// @nodoc
class _$PrimaryColorsCopyWithImpl<$Res>
    implements $PrimaryColorsCopyWith<$Res> {
  _$PrimaryColorsCopyWithImpl(this._self, this._then);

  final PrimaryColors _self;
  final $Res Function(PrimaryColors) _then;

/// Create a copy of PrimaryColors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cultures = null,}) {
  return _then(PrimaryColors(
cultures: null == cultures ? _self.cultures : cultures // ignore: cast_nullable_to_non_nullable
as List<PrimaryColorCulture>,
  ));
}

}



// dart format on
