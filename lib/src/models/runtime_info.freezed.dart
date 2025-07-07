// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'runtime_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RuntimeInfo {

 AppLifecycleState get appLifecycleState; Brightness get brightness; BoxConstraints get displayConstraints; DisplayWidthMode get displayWidthMode; Locale get locale; double get textScaleFactor;
/// Create a copy of RuntimeInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RuntimeInfoCopyWith<RuntimeInfo> get copyWith => _$RuntimeInfoCopyWithImpl<RuntimeInfo>(this as RuntimeInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RuntimeInfo&&(identical(other.appLifecycleState, appLifecycleState) || other.appLifecycleState == appLifecycleState)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.displayConstraints, displayConstraints) || other.displayConstraints == displayConstraints)&&(identical(other.displayWidthMode, displayWidthMode) || other.displayWidthMode == displayWidthMode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.textScaleFactor, textScaleFactor) || other.textScaleFactor == textScaleFactor));
}


@override
int get hashCode => Object.hash(runtimeType,appLifecycleState,brightness,displayConstraints,displayWidthMode,locale,textScaleFactor);

@override
String toString() {
  return 'RuntimeInfo(appLifecycleState: $appLifecycleState, brightness: $brightness, displayConstraints: $displayConstraints, displayWidthMode: $displayWidthMode, locale: $locale, textScaleFactor: $textScaleFactor)';
}


}

/// @nodoc
abstract mixin class $RuntimeInfoCopyWith<$Res>  {
  factory $RuntimeInfoCopyWith(RuntimeInfo value, $Res Function(RuntimeInfo) _then) = _$RuntimeInfoCopyWithImpl;
@useResult
$Res call({
 AppLifecycleState appLifecycleState, Brightness brightness, BoxConstraints displayConstraints, DisplayWidthMode displayWidthMode, Locale locale, double textScaleFactor
});




}
/// @nodoc
class _$RuntimeInfoCopyWithImpl<$Res>
    implements $RuntimeInfoCopyWith<$Res> {
  _$RuntimeInfoCopyWithImpl(this._self, this._then);

  final RuntimeInfo _self;
  final $Res Function(RuntimeInfo) _then;

/// Create a copy of RuntimeInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appLifecycleState = null,Object? brightness = null,Object? displayConstraints = null,Object? displayWidthMode = null,Object? locale = null,Object? textScaleFactor = null,}) {
  return _then(_self.copyWith(
appLifecycleState: null == appLifecycleState ? _self.appLifecycleState : appLifecycleState // ignore: cast_nullable_to_non_nullable
as AppLifecycleState,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as Brightness,displayConstraints: null == displayConstraints ? _self.displayConstraints : displayConstraints // ignore: cast_nullable_to_non_nullable
as BoxConstraints,displayWidthMode: null == displayWidthMode ? _self.displayWidthMode : displayWidthMode // ignore: cast_nullable_to_non_nullable
as DisplayWidthMode,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,textScaleFactor: null == textScaleFactor ? _self.textScaleFactor : textScaleFactor // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [RuntimeInfo].
extension RuntimeInfoPatterns on RuntimeInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RuntimeInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RuntimeInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RuntimeInfo value)  $default,){
final _that = this;
switch (_that) {
case _RuntimeInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RuntimeInfo value)?  $default,){
final _that = this;
switch (_that) {
case _RuntimeInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppLifecycleState appLifecycleState,  Brightness brightness,  BoxConstraints displayConstraints,  DisplayWidthMode displayWidthMode,  Locale locale,  double textScaleFactor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RuntimeInfo() when $default != null:
return $default(_that.appLifecycleState,_that.brightness,_that.displayConstraints,_that.displayWidthMode,_that.locale,_that.textScaleFactor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppLifecycleState appLifecycleState,  Brightness brightness,  BoxConstraints displayConstraints,  DisplayWidthMode displayWidthMode,  Locale locale,  double textScaleFactor)  $default,) {final _that = this;
switch (_that) {
case _RuntimeInfo():
return $default(_that.appLifecycleState,_that.brightness,_that.displayConstraints,_that.displayWidthMode,_that.locale,_that.textScaleFactor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppLifecycleState appLifecycleState,  Brightness brightness,  BoxConstraints displayConstraints,  DisplayWidthMode displayWidthMode,  Locale locale,  double textScaleFactor)?  $default,) {final _that = this;
switch (_that) {
case _RuntimeInfo() when $default != null:
return $default(_that.appLifecycleState,_that.brightness,_that.displayConstraints,_that.displayWidthMode,_that.locale,_that.textScaleFactor);case _:
  return null;

}
}

}

/// @nodoc


class _RuntimeInfo implements RuntimeInfo {
  const _RuntimeInfo({required this.appLifecycleState, required this.brightness, required this.displayConstraints, required this.displayWidthMode, required this.locale, required this.textScaleFactor});
  

@override final  AppLifecycleState appLifecycleState;
@override final  Brightness brightness;
@override final  BoxConstraints displayConstraints;
@override final  DisplayWidthMode displayWidthMode;
@override final  Locale locale;
@override final  double textScaleFactor;

/// Create a copy of RuntimeInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RuntimeInfoCopyWith<_RuntimeInfo> get copyWith => __$RuntimeInfoCopyWithImpl<_RuntimeInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RuntimeInfo&&(identical(other.appLifecycleState, appLifecycleState) || other.appLifecycleState == appLifecycleState)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.displayConstraints, displayConstraints) || other.displayConstraints == displayConstraints)&&(identical(other.displayWidthMode, displayWidthMode) || other.displayWidthMode == displayWidthMode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.textScaleFactor, textScaleFactor) || other.textScaleFactor == textScaleFactor));
}


@override
int get hashCode => Object.hash(runtimeType,appLifecycleState,brightness,displayConstraints,displayWidthMode,locale,textScaleFactor);

@override
String toString() {
  return 'RuntimeInfo(appLifecycleState: $appLifecycleState, brightness: $brightness, displayConstraints: $displayConstraints, displayWidthMode: $displayWidthMode, locale: $locale, textScaleFactor: $textScaleFactor)';
}


}

/// @nodoc
abstract mixin class _$RuntimeInfoCopyWith<$Res> implements $RuntimeInfoCopyWith<$Res> {
  factory _$RuntimeInfoCopyWith(_RuntimeInfo value, $Res Function(_RuntimeInfo) _then) = __$RuntimeInfoCopyWithImpl;
@override @useResult
$Res call({
 AppLifecycleState appLifecycleState, Brightness brightness, BoxConstraints displayConstraints, DisplayWidthMode displayWidthMode, Locale locale, double textScaleFactor
});




}
/// @nodoc
class __$RuntimeInfoCopyWithImpl<$Res>
    implements _$RuntimeInfoCopyWith<$Res> {
  __$RuntimeInfoCopyWithImpl(this._self, this._then);

  final _RuntimeInfo _self;
  final $Res Function(_RuntimeInfo) _then;

/// Create a copy of RuntimeInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appLifecycleState = null,Object? brightness = null,Object? displayConstraints = null,Object? displayWidthMode = null,Object? locale = null,Object? textScaleFactor = null,}) {
  return _then(_RuntimeInfo(
appLifecycleState: null == appLifecycleState ? _self.appLifecycleState : appLifecycleState // ignore: cast_nullable_to_non_nullable
as AppLifecycleState,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as Brightness,displayConstraints: null == displayConstraints ? _self.displayConstraints : displayConstraints // ignore: cast_nullable_to_non_nullable
as BoxConstraints,displayWidthMode: null == displayWidthMode ? _self.displayWidthMode : displayWidthMode // ignore: cast_nullable_to_non_nullable
as DisplayWidthMode,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,textScaleFactor: null == textScaleFactor ? _self.textScaleFactor : textScaleFactor // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
