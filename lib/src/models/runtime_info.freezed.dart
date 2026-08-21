// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'runtime_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RuntimeInfo {

 AppLifecycleState? get appLifecycleState; Brightness get brightness; Locale get locale; double get textScaleFactor; double get devicePixelRatio; BoxConstraints get physicalDisplayConstraints; BoxConstraints get logicalDisplayConstraints; DisplayWidthMode get displayWidthMode;
/// Create a copy of RuntimeInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RuntimeInfoCopyWith<RuntimeInfo> get copyWith => _$RuntimeInfoCopyWithImpl<RuntimeInfo>(this as RuntimeInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RuntimeInfo&&(identical(other.appLifecycleState, appLifecycleState) || other.appLifecycleState == appLifecycleState)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.textScaleFactor, textScaleFactor) || other.textScaleFactor == textScaleFactor)&&(identical(other.devicePixelRatio, devicePixelRatio) || other.devicePixelRatio == devicePixelRatio)&&(identical(other.physicalDisplayConstraints, physicalDisplayConstraints) || other.physicalDisplayConstraints == physicalDisplayConstraints)&&(identical(other.logicalDisplayConstraints, logicalDisplayConstraints) || other.logicalDisplayConstraints == logicalDisplayConstraints)&&(identical(other.displayWidthMode, displayWidthMode) || other.displayWidthMode == displayWidthMode));
}


@override
int get hashCode => Object.hash(runtimeType,appLifecycleState,brightness,locale,textScaleFactor,devicePixelRatio,physicalDisplayConstraints,logicalDisplayConstraints,displayWidthMode);

@override
String toString() {
  return 'RuntimeInfo(appLifecycleState: $appLifecycleState, brightness: $brightness, locale: $locale, textScaleFactor: $textScaleFactor, devicePixelRatio: $devicePixelRatio, physicalDisplayConstraints: $physicalDisplayConstraints, logicalDisplayConstraints: $logicalDisplayConstraints, displayWidthMode: $displayWidthMode)';
}


}

/// @nodoc
abstract mixin class $RuntimeInfoCopyWith<$Res>  {
  factory $RuntimeInfoCopyWith(RuntimeInfo value, $Res Function(RuntimeInfo) _then) = _$RuntimeInfoCopyWithImpl;
@useResult
$Res call({
 AppLifecycleState? appLifecycleState, Brightness brightness, Locale locale, double textScaleFactor, double devicePixelRatio, BoxConstraints physicalDisplayConstraints, BoxConstraints logicalDisplayConstraints, DisplayWidthMode displayWidthMode
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
@pragma('vm:prefer-inline') @override $Res call({Object? appLifecycleState = freezed,Object? brightness = null,Object? locale = null,Object? textScaleFactor = null,Object? devicePixelRatio = null,Object? physicalDisplayConstraints = null,Object? logicalDisplayConstraints = null,Object? displayWidthMode = null,}) {
  return _then(RuntimeInfo(
appLifecycleState: freezed == appLifecycleState ? _self.appLifecycleState : appLifecycleState // ignore: cast_nullable_to_non_nullable
as AppLifecycleState?,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as Brightness,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,textScaleFactor: null == textScaleFactor ? _self.textScaleFactor : textScaleFactor // ignore: cast_nullable_to_non_nullable
as double,devicePixelRatio: null == devicePixelRatio ? _self.devicePixelRatio : devicePixelRatio // ignore: cast_nullable_to_non_nullable
as double,physicalDisplayConstraints: null == physicalDisplayConstraints ? _self.physicalDisplayConstraints : physicalDisplayConstraints // ignore: cast_nullable_to_non_nullable
as BoxConstraints,logicalDisplayConstraints: null == logicalDisplayConstraints ? _self.logicalDisplayConstraints : logicalDisplayConstraints // ignore: cast_nullable_to_non_nullable
as BoxConstraints,displayWidthMode: null == displayWidthMode ? _self.displayWidthMode : displayWidthMode // ignore: cast_nullable_to_non_nullable
as DisplayWidthMode,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppLifecycleState? appLifecycleState,  Brightness brightness,  Locale locale,  double textScaleFactor,  double devicePixelRatio,  BoxConstraints physicalDisplayConstraints,  BoxConstraints logicalDisplayConstraints,  DisplayWidthMode displayWidthMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RuntimeInfo() when $default != null:
return $default(_that.appLifecycleState,_that.brightness,_that.locale,_that.textScaleFactor,_that.devicePixelRatio,_that.physicalDisplayConstraints,_that.logicalDisplayConstraints,_that.displayWidthMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppLifecycleState? appLifecycleState,  Brightness brightness,  Locale locale,  double textScaleFactor,  double devicePixelRatio,  BoxConstraints physicalDisplayConstraints,  BoxConstraints logicalDisplayConstraints,  DisplayWidthMode displayWidthMode)  $default,) {final _that = this;
switch (_that) {
case _RuntimeInfo():
return $default(_that.appLifecycleState,_that.brightness,_that.locale,_that.textScaleFactor,_that.devicePixelRatio,_that.physicalDisplayConstraints,_that.logicalDisplayConstraints,_that.displayWidthMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppLifecycleState? appLifecycleState,  Brightness brightness,  Locale locale,  double textScaleFactor,  double devicePixelRatio,  BoxConstraints physicalDisplayConstraints,  BoxConstraints logicalDisplayConstraints,  DisplayWidthMode displayWidthMode)?  $default,) {final _that = this;
switch (_that) {
case _RuntimeInfo() when $default != null:
return $default(_that.appLifecycleState,_that.brightness,_that.locale,_that.textScaleFactor,_that.devicePixelRatio,_that.physicalDisplayConstraints,_that.logicalDisplayConstraints,_that.displayWidthMode);case _:
  return null;

}
}

}

/// @nodoc


class _RuntimeInfo implements RuntimeInfo {
  const _RuntimeInfo({required this.appLifecycleState, required this.brightness, required this.locale, required this.textScaleFactor, required this.devicePixelRatio, required this.physicalDisplayConstraints, required this.logicalDisplayConstraints, required this.displayWidthMode});
  

@override final  AppLifecycleState? appLifecycleState;
@override final  Brightness brightness;
@override final  Locale locale;
@override final  double textScaleFactor;
@override final  double devicePixelRatio;
@override final  BoxConstraints physicalDisplayConstraints;
@override final  BoxConstraints logicalDisplayConstraints;
@override final  DisplayWidthMode displayWidthMode;

/// Create a copy of RuntimeInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RuntimeInfoCopyWith<_RuntimeInfo> get copyWith => __$RuntimeInfoCopyWithImpl<_RuntimeInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RuntimeInfo&&(identical(other.appLifecycleState, appLifecycleState) || other.appLifecycleState == appLifecycleState)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.textScaleFactor, textScaleFactor) || other.textScaleFactor == textScaleFactor)&&(identical(other.devicePixelRatio, devicePixelRatio) || other.devicePixelRatio == devicePixelRatio)&&(identical(other.physicalDisplayConstraints, physicalDisplayConstraints) || other.physicalDisplayConstraints == physicalDisplayConstraints)&&(identical(other.logicalDisplayConstraints, logicalDisplayConstraints) || other.logicalDisplayConstraints == logicalDisplayConstraints)&&(identical(other.displayWidthMode, displayWidthMode) || other.displayWidthMode == displayWidthMode));
}


@override
int get hashCode => Object.hash(runtimeType,appLifecycleState,brightness,locale,textScaleFactor,devicePixelRatio,physicalDisplayConstraints,logicalDisplayConstraints,displayWidthMode);

@override
String toString() {
  return 'RuntimeInfo(appLifecycleState: $appLifecycleState, brightness: $brightness, locale: $locale, textScaleFactor: $textScaleFactor, devicePixelRatio: $devicePixelRatio, physicalDisplayConstraints: $physicalDisplayConstraints, logicalDisplayConstraints: $logicalDisplayConstraints, displayWidthMode: $displayWidthMode)';
}


}

/// @nodoc
abstract mixin class _$RuntimeInfoCopyWith<$Res> implements $RuntimeInfoCopyWith<$Res> {
  factory _$RuntimeInfoCopyWith(_RuntimeInfo value, $Res Function(_RuntimeInfo) _then) = __$RuntimeInfoCopyWithImpl;
@override @useResult
$Res call({
 AppLifecycleState? appLifecycleState, Brightness brightness, Locale locale, double textScaleFactor, double devicePixelRatio, BoxConstraints physicalDisplayConstraints, BoxConstraints logicalDisplayConstraints, DisplayWidthMode displayWidthMode
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
@override @pragma('vm:prefer-inline') $Res call({Object? appLifecycleState = freezed,Object? brightness = null,Object? locale = null,Object? textScaleFactor = null,Object? devicePixelRatio = null,Object? physicalDisplayConstraints = null,Object? logicalDisplayConstraints = null,Object? displayWidthMode = null,}) {
  return _then(_RuntimeInfo(
appLifecycleState: freezed == appLifecycleState ? _self.appLifecycleState : appLifecycleState // ignore: cast_nullable_to_non_nullable
as AppLifecycleState?,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as Brightness,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,textScaleFactor: null == textScaleFactor ? _self.textScaleFactor : textScaleFactor // ignore: cast_nullable_to_non_nullable
as double,devicePixelRatio: null == devicePixelRatio ? _self.devicePixelRatio : devicePixelRatio // ignore: cast_nullable_to_non_nullable
as double,physicalDisplayConstraints: null == physicalDisplayConstraints ? _self.physicalDisplayConstraints : physicalDisplayConstraints // ignore: cast_nullable_to_non_nullable
as BoxConstraints,logicalDisplayConstraints: null == logicalDisplayConstraints ? _self.logicalDisplayConstraints : logicalDisplayConstraints // ignore: cast_nullable_to_non_nullable
as BoxConstraints,displayWidthMode: null == displayWidthMode ? _self.displayWidthMode : displayWidthMode // ignore: cast_nullable_to_non_nullable
as DisplayWidthMode,
  ));
}


}

// dart format on
