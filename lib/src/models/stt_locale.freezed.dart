// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [SttLocale].
extension SttLocalePatterns on SttLocale {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SttLocale value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SttLocale() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SttLocale value)  $default,){
final _that = this;
switch (_that) {
case _SttLocale():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SttLocale value)?  $default,){
final _that = this;
switch (_that) {
case _SttLocale() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localeId,  String localeName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SttLocale() when $default != null:
return $default(_that.localeId,_that.localeName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localeId,  String localeName)  $default,) {final _that = this;
switch (_that) {
case _SttLocale():
return $default(_that.localeId,_that.localeName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localeId,  String localeName)?  $default,) {final _that = this;
switch (_that) {
case _SttLocale() when $default != null:
return $default(_that.localeId,_that.localeName);case _:
  return null;

}
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
