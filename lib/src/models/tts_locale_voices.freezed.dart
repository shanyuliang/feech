// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tts_locale_voices.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TtsLocaleVoices {

 String get localeId; List<String> get voiceIds;
/// Create a copy of TtsLocaleVoices
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TtsLocaleVoicesCopyWith<TtsLocaleVoices> get copyWith => _$TtsLocaleVoicesCopyWithImpl<TtsLocaleVoices>(this as TtsLocaleVoices, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TtsLocaleVoices&&(identical(other.localeId, localeId) || other.localeId == localeId)&&const DeepCollectionEquality().equals(other.voiceIds, voiceIds));
}


@override
int get hashCode => Object.hash(runtimeType,localeId,const DeepCollectionEquality().hash(voiceIds));

@override
String toString() {
  return 'TtsLocaleVoices(localeId: $localeId, voiceIds: $voiceIds)';
}


}

/// @nodoc
abstract mixin class $TtsLocaleVoicesCopyWith<$Res>  {
  factory $TtsLocaleVoicesCopyWith(TtsLocaleVoices value, $Res Function(TtsLocaleVoices) _then) = _$TtsLocaleVoicesCopyWithImpl;
@useResult
$Res call({
 String localeId, List<String> voiceIds
});




}
/// @nodoc
class _$TtsLocaleVoicesCopyWithImpl<$Res>
    implements $TtsLocaleVoicesCopyWith<$Res> {
  _$TtsLocaleVoicesCopyWithImpl(this._self, this._then);

  final TtsLocaleVoices _self;
  final $Res Function(TtsLocaleVoices) _then;

/// Create a copy of TtsLocaleVoices
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


class _TtsLocaleVoices implements TtsLocaleVoices {
  const _TtsLocaleVoices({required this.localeId, required this.voiceIds});
  

@override final  String localeId;
@override final  List<String> voiceIds;

/// Create a copy of TtsLocaleVoices
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TtsLocaleVoicesCopyWith<_TtsLocaleVoices> get copyWith => __$TtsLocaleVoicesCopyWithImpl<_TtsLocaleVoices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TtsLocaleVoices&&(identical(other.localeId, localeId) || other.localeId == localeId)&&const DeepCollectionEquality().equals(other.voiceIds, voiceIds));
}


@override
int get hashCode => Object.hash(runtimeType,localeId,const DeepCollectionEquality().hash(voiceIds));

@override
String toString() {
  return 'TtsLocaleVoices(localeId: $localeId, voiceIds: $voiceIds)';
}


}

/// @nodoc
abstract mixin class _$TtsLocaleVoicesCopyWith<$Res> implements $TtsLocaleVoicesCopyWith<$Res> {
  factory _$TtsLocaleVoicesCopyWith(_TtsLocaleVoices value, $Res Function(_TtsLocaleVoices) _then) = __$TtsLocaleVoicesCopyWithImpl;
@override @useResult
$Res call({
 String localeId, List<String> voiceIds
});




}
/// @nodoc
class __$TtsLocaleVoicesCopyWithImpl<$Res>
    implements _$TtsLocaleVoicesCopyWith<$Res> {
  __$TtsLocaleVoicesCopyWithImpl(this._self, this._then);

  final _TtsLocaleVoices _self;
  final $Res Function(_TtsLocaleVoices) _then;

/// Create a copy of TtsLocaleVoices
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localeId = null,Object? voiceIds = null,}) {
  return _then(_TtsLocaleVoices(
localeId: null == localeId ? _self.localeId : localeId // ignore: cast_nullable_to_non_nullable
as String,voiceIds: null == voiceIds ? _self.voiceIds : voiceIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
