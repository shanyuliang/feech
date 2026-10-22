// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tts_locale_voices.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TtsLocaleVoices {


/// Create a copy of TtsLocaleVoices
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TtsLocaleVoicesCopyWith<TtsLocaleVoices> get copyWith => _$TtsLocaleVoicesCopyWithImpl<TtsLocaleVoices>(this as TtsLocaleVoices, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TtsLocaleVoices;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TtsLocaleVoices&&(identical(other.localeId, _this.localeId) || other.localeId == _this.localeId)&&const DeepCollectionEquality().equals(other.voiceIds, _this.voiceIds));
}


@override
int get hashCode {
  final _this = this as TtsLocaleVoices;
  return Object.hash(runtimeType,_this.localeId,const DeepCollectionEquality().hash(_this.voiceIds));
}

@override
String toString() {
  final _this = this as TtsLocaleVoices;
  return 'TtsLocaleVoices(localeId: ${_this.localeId}, voiceIds: ${_this.voiceIds})';
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
  return _then(TtsLocaleVoices(
localeId: null == localeId ? _self.localeId : localeId // ignore: cast_nullable_to_non_nullable
as String,voiceIds: null == voiceIds ? _self.voiceIds : voiceIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}



// dart format on
