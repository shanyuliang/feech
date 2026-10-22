// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stt_locale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SttLocale {


/// Create a copy of SttLocale
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SttLocaleCopyWith<SttLocale> get copyWith => _$SttLocaleCopyWithImpl<SttLocale>(this as SttLocale, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SttLocale;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SttLocale&&(identical(other.localeId, _this.localeId) || other.localeId == _this.localeId)&&(identical(other.localeName, _this.localeName) || other.localeName == _this.localeName));
}


@override
int get hashCode {
  final _this = this as SttLocale;
  return Object.hash(runtimeType,_this.localeId,_this.localeName);
}



}

/// @nodoc
abstract mixin class $SttLocaleCopyWith<$Res>  {
  factory $SttLocaleCopyWith(SttLocale value, $Res Function(SttLocale) _then) = _$SttLocaleCopyWithImpl;
@useResult
$Res call({
 String localeId, String localeName
});




}
/// @nodoc
class _$SttLocaleCopyWithImpl<$Res>
    implements $SttLocaleCopyWith<$Res> {
  _$SttLocaleCopyWithImpl(this._self, this._then);

  final SttLocale _self;
  final $Res Function(SttLocale) _then;

/// Create a copy of SttLocale
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localeId = null,Object? localeName = null,}) {
  return _then(SttLocale(
localeId: null == localeId ? _self.localeId : localeId // ignore: cast_nullable_to_non_nullable
as String,localeName: null == localeName ? _self.localeName : localeName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



// dart format on
