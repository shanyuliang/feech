// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Stt {

 List<SttLocale> get supportedLocales; SttLocale? get selectedLocale;
/// Create a copy of Stt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SttCopyWith<Stt> get copyWith => _$SttCopyWithImpl<Stt>(this as Stt, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Stt&&const DeepCollectionEquality().equals(other.supportedLocales, supportedLocales)&&(identical(other.selectedLocale, selectedLocale) || other.selectedLocale == selectedLocale));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(supportedLocales),selectedLocale);

@override
String toString() {
  return 'Stt(supportedLocales: $supportedLocales, selectedLocale: $selectedLocale)';
}


}

/// @nodoc
abstract mixin class $SttCopyWith<$Res>  {
  factory $SttCopyWith(Stt value, $Res Function(Stt) _then) = _$SttCopyWithImpl;
@useResult
$Res call({
 List<SttLocale> supportedLocales, SttLocale? selectedLocale
});


$SttLocaleCopyWith<$Res>? get selectedLocale;

}
/// @nodoc
class _$SttCopyWithImpl<$Res>
    implements $SttCopyWith<$Res> {
  _$SttCopyWithImpl(this._self, this._then);

  final Stt _self;
  final $Res Function(Stt) _then;

/// Create a copy of Stt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? supportedLocales = null,Object? selectedLocale = freezed,}) {
  return _then(_self.copyWith(
supportedLocales: null == supportedLocales ? _self.supportedLocales : supportedLocales // ignore: cast_nullable_to_non_nullable
as List<SttLocale>,selectedLocale: freezed == selectedLocale ? _self.selectedLocale : selectedLocale // ignore: cast_nullable_to_non_nullable
as SttLocale?,
  ));
}
/// Create a copy of Stt
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SttLocaleCopyWith<$Res>? get selectedLocale {
    if (_self.selectedLocale == null) {
    return null;
  }

  return $SttLocaleCopyWith<$Res>(_self.selectedLocale!, (value) {
    return _then(_self.copyWith(selectedLocale: value));
  });
}
}


/// Adds pattern-matching-related methods to [Stt].
extension SttPatterns on Stt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Stt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Stt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Stt value)  $default,){
final _that = this;
switch (_that) {
case _Stt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Stt value)?  $default,){
final _that = this;
switch (_that) {
case _Stt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SttLocale> supportedLocales,  SttLocale? selectedLocale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Stt() when $default != null:
return $default(_that.supportedLocales,_that.selectedLocale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SttLocale> supportedLocales,  SttLocale? selectedLocale)  $default,) {final _that = this;
switch (_that) {
case _Stt():
return $default(_that.supportedLocales,_that.selectedLocale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SttLocale> supportedLocales,  SttLocale? selectedLocale)?  $default,) {final _that = this;
switch (_that) {
case _Stt() when $default != null:
return $default(_that.supportedLocales,_that.selectedLocale);case _:
  return null;

}
}

}

/// @nodoc


class _Stt implements Stt {
  const _Stt({required final  List<SttLocale> supportedLocales, required this.selectedLocale}): _supportedLocales = supportedLocales;
  

 final  List<SttLocale> _supportedLocales;
@override List<SttLocale> get supportedLocales {
  if (_supportedLocales is EqualUnmodifiableListView) return _supportedLocales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedLocales);
}

@override final  SttLocale? selectedLocale;

/// Create a copy of Stt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SttCopyWith<_Stt> get copyWith => __$SttCopyWithImpl<_Stt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stt&&const DeepCollectionEquality().equals(other._supportedLocales, _supportedLocales)&&(identical(other.selectedLocale, selectedLocale) || other.selectedLocale == selectedLocale));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_supportedLocales),selectedLocale);

@override
String toString() {
  return 'Stt(supportedLocales: $supportedLocales, selectedLocale: $selectedLocale)';
}


}

/// @nodoc
abstract mixin class _$SttCopyWith<$Res> implements $SttCopyWith<$Res> {
  factory _$SttCopyWith(_Stt value, $Res Function(_Stt) _then) = __$SttCopyWithImpl;
@override @useResult
$Res call({
 List<SttLocale> supportedLocales, SttLocale? selectedLocale
});


@override $SttLocaleCopyWith<$Res>? get selectedLocale;

}
/// @nodoc
class __$SttCopyWithImpl<$Res>
    implements _$SttCopyWith<$Res> {
  __$SttCopyWithImpl(this._self, this._then);

  final _Stt _self;
  final $Res Function(_Stt) _then;

/// Create a copy of Stt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? supportedLocales = null,Object? selectedLocale = freezed,}) {
  return _then(_Stt(
supportedLocales: null == supportedLocales ? _self._supportedLocales : supportedLocales // ignore: cast_nullable_to_non_nullable
as List<SttLocale>,selectedLocale: freezed == selectedLocale ? _self.selectedLocale : selectedLocale // ignore: cast_nullable_to_non_nullable
as SttLocale?,
  ));
}

/// Create a copy of Stt
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SttLocaleCopyWith<$Res>? get selectedLocale {
    if (_self.selectedLocale == null) {
    return null;
  }

  return $SttLocaleCopyWith<$Res>(_self.selectedLocale!, (value) {
    return _then(_self.copyWith(selectedLocale: value));
  });
}
}

// dart format on
