// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stt_locale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SttLocale {

 String get localeId; String get localeName;
/// Create a copy of SttLocale
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SttLocaleCopyWith<SttLocale> get copyWith => _$SttLocaleCopyWithImpl<SttLocale>(this as SttLocale, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SttLocale&&(identical(other.localeId, localeId) || other.localeId == localeId)&&(identical(other.localeName, localeName) || other.localeName == localeName));
}


@override
int get hashCode => Object.hash(runtimeType,localeId,localeName);



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
  return _then(_self.copyWith(
localeId: null == localeId ? _self.localeId : localeId // ignore: cast_nullable_to_non_nullable
as String,localeName: null == localeName ? _self.localeName : localeName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _SttLocale extends SttLocale {
  const _SttLocale({required this.localeId, required this.localeName}): super._();
  

@override final  String localeId;
@override final  String localeName;

/// Create a copy of SttLocale
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SttLocaleCopyWith<_SttLocale> get copyWith => __$SttLocaleCopyWithImpl<_SttLocale>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SttLocale&&(identical(other.localeId, localeId) || other.localeId == localeId)&&(identical(other.localeName, localeName) || other.localeName == localeName));
}


@override
int get hashCode => Object.hash(runtimeType,localeId,localeName);



}

/// @nodoc
abstract mixin class _$SttLocaleCopyWith<$Res> implements $SttLocaleCopyWith<$Res> {
  factory _$SttLocaleCopyWith(_SttLocale value, $Res Function(_SttLocale) _then) = __$SttLocaleCopyWithImpl;
@override @useResult
$Res call({
 String localeId, String localeName
});




}
/// @nodoc
class __$SttLocaleCopyWithImpl<$Res>
    implements _$SttLocaleCopyWith<$Res> {
  __$SttLocaleCopyWithImpl(this._self, this._then);

  final _SttLocale _self;
  final $Res Function(_SttLocale) _then;

/// Create a copy of SttLocale
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localeId = null,Object? localeName = null,}) {
  return _then(_SttLocale(
localeId: null == localeId ? _self.localeId : localeId // ignore: cast_nullable_to_non_nullable
as String,localeName: null == localeName ? _self.localeName : localeName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
