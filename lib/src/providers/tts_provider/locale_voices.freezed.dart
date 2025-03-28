// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_voices.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocaleVoices {

 String get localeId; List<String> get voiceIds;
/// Create a copy of LocaleVoices
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocaleVoicesCopyWith<LocaleVoices> get copyWith => _$LocaleVoicesCopyWithImpl<LocaleVoices>(this as LocaleVoices, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocaleVoices&&(identical(other.localeId, localeId) || other.localeId == localeId)&&const DeepCollectionEquality().equals(other.voiceIds, voiceIds));
}


@override
int get hashCode => Object.hash(runtimeType,localeId,const DeepCollectionEquality().hash(voiceIds));

@override
String toString() {
  return 'LocaleVoices(localeId: $localeId, voiceIds: $voiceIds)';
}


}

/// @nodoc
abstract mixin class $LocaleVoicesCopyWith<$Res>  {
  factory $LocaleVoicesCopyWith(LocaleVoices value, $Res Function(LocaleVoices) _then) = _$LocaleVoicesCopyWithImpl;
@useResult
$Res call({
 String localeId, List<String> voiceIds
});




}
/// @nodoc
class _$LocaleVoicesCopyWithImpl<$Res>
    implements $LocaleVoicesCopyWith<$Res> {
  _$LocaleVoicesCopyWithImpl(this._self, this._then);

  final LocaleVoices _self;
  final $Res Function(LocaleVoices) _then;

/// Create a copy of LocaleVoices
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localeId = null,Object? voiceIds = null,}) {
  return _then(_self.copyWith(
localeId: null == localeId ? _self.localeId : localeId // ignore: cast_nullable_to_non_nullable
as String,voiceIds: null == voiceIds ? _self.voiceIds : voiceIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc


class _LocaleVoices implements LocaleVoices {
  const _LocaleVoices({required this.localeId, required this.voiceIds});
  

@override final  String localeId;
@override final  List<String> voiceIds;

/// Create a copy of LocaleVoices
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocaleVoicesCopyWith<_LocaleVoices> get copyWith => __$LocaleVoicesCopyWithImpl<_LocaleVoices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocaleVoices&&(identical(other.localeId, localeId) || other.localeId == localeId)&&const DeepCollectionEquality().equals(other.voiceIds, voiceIds));
}


@override
int get hashCode => Object.hash(runtimeType,localeId,const DeepCollectionEquality().hash(voiceIds));

@override
String toString() {
  return 'LocaleVoices(localeId: $localeId, voiceIds: $voiceIds)';
}


}

/// @nodoc
abstract mixin class _$LocaleVoicesCopyWith<$Res> implements $LocaleVoicesCopyWith<$Res> {
  factory _$LocaleVoicesCopyWith(_LocaleVoices value, $Res Function(_LocaleVoices) _then) = __$LocaleVoicesCopyWithImpl;
@override @useResult
$Res call({
 String localeId, List<String> voiceIds
});




}
/// @nodoc
class __$LocaleVoicesCopyWithImpl<$Res>
    implements _$LocaleVoicesCopyWith<$Res> {
  __$LocaleVoicesCopyWithImpl(this._self, this._then);

  final _LocaleVoices _self;
  final $Res Function(_LocaleVoices) _then;

/// Create a copy of LocaleVoices
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localeId = null,Object? voiceIds = null,}) {
  return _then(_LocaleVoices(
localeId: null == localeId ? _self.localeId : localeId // ignore: cast_nullable_to_non_nullable
as String,voiceIds: null == voiceIds ? _self.voiceIds : voiceIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
