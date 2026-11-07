// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_color_scheme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteColorScheme {


/// Create a copy of RemoteColorScheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteColorSchemeCopyWith<RemoteColorScheme> get copyWith => _$RemoteColorSchemeCopyWithImpl<RemoteColorScheme>(this as RemoteColorScheme, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RemoteColorScheme;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteColorScheme&&(identical(other.brightness, _this.brightness) || other.brightness == _this.brightness)&&(identical(other.primary, _this.primary) || other.primary == _this.primary)&&(identical(other.onPrimary, _this.onPrimary) || other.onPrimary == _this.onPrimary)&&(identical(other.secondary, _this.secondary) || other.secondary == _this.secondary)&&(identical(other.onSecondary, _this.onSecondary) || other.onSecondary == _this.onSecondary)&&(identical(other.surface, _this.surface) || other.surface == _this.surface)&&(identical(other.onSurface, _this.onSurface) || other.onSurface == _this.onSurface)&&(identical(other.error, _this.error) || other.error == _this.error)&&(identical(other.onError, _this.onError) || other.onError == _this.onError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RemoteColorScheme;
  return Object.hash(runtimeType,_this.brightness,_this.primary,_this.onPrimary,_this.secondary,_this.onSecondary,_this.surface,_this.onSurface,_this.error,_this.onError);
}

@override
String toString() {
  final _this = this as RemoteColorScheme;
  return 'RemoteColorScheme(brightness: ${_this.brightness}, primary: ${_this.primary}, onPrimary: ${_this.onPrimary}, secondary: ${_this.secondary}, onSecondary: ${_this.onSecondary}, surface: ${_this.surface}, onSurface: ${_this.onSurface}, error: ${_this.error}, onError: ${_this.onError})';
}


}

/// @nodoc
abstract mixin class $RemoteColorSchemeCopyWith<$Res>  {
  factory $RemoteColorSchemeCopyWith(RemoteColorScheme value, $Res Function(RemoteColorScheme) _then) = _$RemoteColorSchemeCopyWithImpl;
@useResult
$Res call({
@BrightnessStringConverter() Brightness brightness,@ColorStringConverter() Color primary,@ColorStringConverter() Color onPrimary,@ColorStringConverter() Color secondary,@ColorStringConverter() Color onSecondary,@ColorStringConverter() Color surface,@ColorStringConverter() Color onSurface,@ColorStringConverter() Color error,@ColorStringConverter() Color onError
});




}
/// @nodoc
class _$RemoteColorSchemeCopyWithImpl<$Res>
    implements $RemoteColorSchemeCopyWith<$Res> {
  _$RemoteColorSchemeCopyWithImpl(this._self, this._then);

  final RemoteColorScheme _self;
  final $Res Function(RemoteColorScheme) _then;

/// Create a copy of RemoteColorScheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brightness = null,Object? primary = null,Object? onPrimary = null,Object? secondary = null,Object? onSecondary = null,Object? surface = null,Object? onSurface = null,Object? error = null,Object? onError = null,}) {
  return _then(RemoteColorScheme(
brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as Brightness,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,onPrimary: null == onPrimary ? _self.onPrimary : onPrimary // ignore: cast_nullable_to_non_nullable
as Color,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color,onSecondary: null == onSecondary ? _self.onSecondary : onSecondary // ignore: cast_nullable_to_non_nullable
as Color,surface: null == surface ? _self.surface : surface // ignore: cast_nullable_to_non_nullable
as Color,onSurface: null == onSurface ? _self.onSurface : onSurface // ignore: cast_nullable_to_non_nullable
as Color,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Color,onError: null == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoteColorScheme].
extension RemoteColorSchemePatterns on RemoteColorScheme {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
