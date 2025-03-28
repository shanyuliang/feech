// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_locale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppLocale {

 String get localeId; String get localeName;
/// Create a copy of AppLocale
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppLocaleCopyWith<AppLocale> get copyWith => _$AppLocaleCopyWithImpl<AppLocale>(this as AppLocale, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLocale&&(identical(other.localeId, localeId) || other.localeId == localeId)&&(identical(other.localeName, localeName) || other.localeName == localeName));
}


@override
int get hashCode => Object.hash(runtimeType,localeId,localeName);



}

/// @nodoc
abstract mixin class $AppLocaleCopyWith<$Res>  {
  factory $AppLocaleCopyWith(AppLocale value, $Res Function(AppLocale) _then) = _$AppLocaleCopyWithImpl;
@useResult
$Res call({
 String localeId, String localeName
});




}
/// @nodoc
class _$AppLocaleCopyWithImpl<$Res>
    implements $AppLocaleCopyWith<$Res> {
  _$AppLocaleCopyWithImpl(this._self, this._then);

  final AppLocale _self;
  final $Res Function(AppLocale) _then;

/// Create a copy of AppLocale
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


class _AppLocale extends AppLocale {
  const _AppLocale({required this.localeId, required this.localeName}): super._();
  

@override final  String localeId;
@override final  String localeName;

/// Create a copy of AppLocale
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppLocaleCopyWith<_AppLocale> get copyWith => __$AppLocaleCopyWithImpl<_AppLocale>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppLocale&&(identical(other.localeId, localeId) || other.localeId == localeId)&&(identical(other.localeName, localeName) || other.localeName == localeName));
}


@override
int get hashCode => Object.hash(runtimeType,localeId,localeName);



}

/// @nodoc
abstract mixin class _$AppLocaleCopyWith<$Res> implements $AppLocaleCopyWith<$Res> {
  factory _$AppLocaleCopyWith(_AppLocale value, $Res Function(_AppLocale) _then) = __$AppLocaleCopyWithImpl;
@override @useResult
$Res call({
 String localeId, String localeName
});




}
/// @nodoc
class __$AppLocaleCopyWithImpl<$Res>
    implements _$AppLocaleCopyWith<$Res> {
  __$AppLocaleCopyWithImpl(this._self, this._then);

  final _AppLocale _self;
  final $Res Function(_AppLocale) _then;

/// Create a copy of AppLocale
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localeId = null,Object? localeName = null,}) {
  return _then(_AppLocale(
localeId: null == localeId ? _self.localeId : localeId // ignore: cast_nullable_to_non_nullable
as String,localeName: null == localeName ? _self.localeName : localeName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
