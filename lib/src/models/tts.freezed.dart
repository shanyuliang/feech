// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Tts {


/// Create a copy of Tts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TtsCopyWith<Tts> get copyWith => _$TtsCopyWithImpl<Tts>(this as Tts, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Tts;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tts&&(identical(other.flutterTts, _this.flutterTts) || other.flutterTts == _this.flutterTts)&&const DeepCollectionEquality().equals(other.allLocaleVoices, _this.allLocaleVoices)&&(identical(other.selectedLocaleId, _this.selectedLocaleId) || other.selectedLocaleId == _this.selectedLocaleId)&&(identical(other.selectedVoiceId, _this.selectedVoiceId) || other.selectedVoiceId == _this.selectedVoiceId));
}


@override
int get hashCode {
  final _this = this as Tts;
  return Object.hash(runtimeType,_this.flutterTts,const DeepCollectionEquality().hash(_this.allLocaleVoices),_this.selectedLocaleId,_this.selectedVoiceId);
}

@override
String toString() {
  final _this = this as Tts;
  return 'Tts(flutterTts: ${_this.flutterTts}, allLocaleVoices: ${_this.allLocaleVoices}, selectedLocaleId: ${_this.selectedLocaleId}, selectedVoiceId: ${_this.selectedVoiceId})';
}


}

/// @nodoc
abstract mixin class $TtsCopyWith<$Res>  {
  factory $TtsCopyWith(Tts value, $Res Function(Tts) _then) = _$TtsCopyWithImpl;
@useResult
$Res call({
 FlutterTts flutterTts, List<TtsLocaleVoices> allLocaleVoices, String? selectedLocaleId, String? selectedVoiceId
});




}
/// @nodoc
class _$TtsCopyWithImpl<$Res>
    implements $TtsCopyWith<$Res> {
  _$TtsCopyWithImpl(this._self, this._then);

  final Tts _self;
  final $Res Function(Tts) _then;

/// Create a copy of Tts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flutterTts = null,Object? allLocaleVoices = null,Object? selectedLocaleId = freezed,Object? selectedVoiceId = freezed,}) {
  return _then(Tts(
flutterTts: null == flutterTts ? _self.flutterTts : flutterTts // ignore: cast_nullable_to_non_nullable
as FlutterTts,allLocaleVoices: null == allLocaleVoices ? _self.allLocaleVoices : allLocaleVoices // ignore: cast_nullable_to_non_nullable
as List<TtsLocaleVoices>,selectedLocaleId: freezed == selectedLocaleId ? _self.selectedLocaleId : selectedLocaleId // ignore: cast_nullable_to_non_nullable
as String?,selectedVoiceId: freezed == selectedVoiceId ? _self.selectedVoiceId : selectedVoiceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}



// dart format on
