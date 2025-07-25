// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Tts {

 FlutterTts get flutterTts; List<TtsLocaleVoices> get allLocaleVoices; String? get selectedLocaleId; String? get selectedVoiceId;
/// Create a copy of Tts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TtsCopyWith<Tts> get copyWith => _$TtsCopyWithImpl<Tts>(this as Tts, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tts&&(identical(other.flutterTts, flutterTts) || other.flutterTts == flutterTts)&&const DeepCollectionEquality().equals(other.allLocaleVoices, allLocaleVoices)&&(identical(other.selectedLocaleId, selectedLocaleId) || other.selectedLocaleId == selectedLocaleId)&&(identical(other.selectedVoiceId, selectedVoiceId) || other.selectedVoiceId == selectedVoiceId));
}


@override
int get hashCode => Object.hash(runtimeType,flutterTts,const DeepCollectionEquality().hash(allLocaleVoices),selectedLocaleId,selectedVoiceId);

@override
String toString() {
  return 'Tts(flutterTts: $flutterTts, allLocaleVoices: $allLocaleVoices, selectedLocaleId: $selectedLocaleId, selectedVoiceId: $selectedVoiceId)';
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
  return _then(_self.copyWith(
flutterTts: null == flutterTts ? _self.flutterTts : flutterTts // ignore: cast_nullable_to_non_nullable
as FlutterTts,allLocaleVoices: null == allLocaleVoices ? _self.allLocaleVoices : allLocaleVoices // ignore: cast_nullable_to_non_nullable
as List<TtsLocaleVoices>,selectedLocaleId: freezed == selectedLocaleId ? _self.selectedLocaleId : selectedLocaleId // ignore: cast_nullable_to_non_nullable
as String?,selectedVoiceId: freezed == selectedVoiceId ? _self.selectedVoiceId : selectedVoiceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Tts].
extension TtsPatterns on Tts {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tts() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tts value)  $default,){
final _that = this;
switch (_that) {
case _Tts():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tts value)?  $default,){
final _that = this;
switch (_that) {
case _Tts() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FlutterTts flutterTts,  List<TtsLocaleVoices> allLocaleVoices,  String? selectedLocaleId,  String? selectedVoiceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tts() when $default != null:
return $default(_that.flutterTts,_that.allLocaleVoices,_that.selectedLocaleId,_that.selectedVoiceId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FlutterTts flutterTts,  List<TtsLocaleVoices> allLocaleVoices,  String? selectedLocaleId,  String? selectedVoiceId)  $default,) {final _that = this;
switch (_that) {
case _Tts():
return $default(_that.flutterTts,_that.allLocaleVoices,_that.selectedLocaleId,_that.selectedVoiceId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FlutterTts flutterTts,  List<TtsLocaleVoices> allLocaleVoices,  String? selectedLocaleId,  String? selectedVoiceId)?  $default,) {final _that = this;
switch (_that) {
case _Tts() when $default != null:
return $default(_that.flutterTts,_that.allLocaleVoices,_that.selectedLocaleId,_that.selectedVoiceId);case _:
  return null;

}
}

}

/// @nodoc


class _Tts extends Tts {
  const _Tts({required this.flutterTts, required this.allLocaleVoices, required this.selectedLocaleId, required this.selectedVoiceId}): super._();
  

@override final  FlutterTts flutterTts;
@override final  List<TtsLocaleVoices> allLocaleVoices;
@override final  String? selectedLocaleId;
@override final  String? selectedVoiceId;

/// Create a copy of Tts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TtsCopyWith<_Tts> get copyWith => __$TtsCopyWithImpl<_Tts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tts&&(identical(other.flutterTts, flutterTts) || other.flutterTts == flutterTts)&&const DeepCollectionEquality().equals(other.allLocaleVoices, allLocaleVoices)&&(identical(other.selectedLocaleId, selectedLocaleId) || other.selectedLocaleId == selectedLocaleId)&&(identical(other.selectedVoiceId, selectedVoiceId) || other.selectedVoiceId == selectedVoiceId));
}


@override
int get hashCode => Object.hash(runtimeType,flutterTts,const DeepCollectionEquality().hash(allLocaleVoices),selectedLocaleId,selectedVoiceId);

@override
String toString() {
  return 'Tts(flutterTts: $flutterTts, allLocaleVoices: $allLocaleVoices, selectedLocaleId: $selectedLocaleId, selectedVoiceId: $selectedVoiceId)';
}


}

/// @nodoc
abstract mixin class _$TtsCopyWith<$Res> implements $TtsCopyWith<$Res> {
  factory _$TtsCopyWith(_Tts value, $Res Function(_Tts) _then) = __$TtsCopyWithImpl;
@override @useResult
$Res call({
 FlutterTts flutterTts, List<TtsLocaleVoices> allLocaleVoices, String? selectedLocaleId, String? selectedVoiceId
});




}
/// @nodoc
class __$TtsCopyWithImpl<$Res>
    implements _$TtsCopyWith<$Res> {
  __$TtsCopyWithImpl(this._self, this._then);

  final _Tts _self;
  final $Res Function(_Tts) _then;

/// Create a copy of Tts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flutterTts = null,Object? allLocaleVoices = null,Object? selectedLocaleId = freezed,Object? selectedVoiceId = freezed,}) {
  return _then(_Tts(
flutterTts: null == flutterTts ? _self.flutterTts : flutterTts // ignore: cast_nullable_to_non_nullable
as FlutterTts,allLocaleVoices: null == allLocaleVoices ? _self.allLocaleVoices : allLocaleVoices // ignore: cast_nullable_to_non_nullable
as List<TtsLocaleVoices>,selectedLocaleId: freezed == selectedLocaleId ? _self.selectedLocaleId : selectedLocaleId // ignore: cast_nullable_to_non_nullable
as String?,selectedVoiceId: freezed == selectedVoiceId ? _self.selectedVoiceId : selectedVoiceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
