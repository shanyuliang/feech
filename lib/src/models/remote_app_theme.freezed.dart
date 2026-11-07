// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_app_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteAppTheme {


/// Create a copy of RemoteAppTheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteAppThemeCopyWith<RemoteAppTheme> get copyWith => _$RemoteAppThemeCopyWithImpl<RemoteAppTheme>(this as RemoteAppTheme, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RemoteAppTheme;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteAppTheme&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.effectiveEvaluation, _this.effectiveEvaluation) || other.effectiveEvaluation == _this.effectiveEvaluation)&&(identical(other.lightColorScheme, _this.lightColorScheme) || other.lightColorScheme == _this.lightColorScheme)&&(identical(other.darkColorScheme, _this.darkColorScheme) || other.darkColorScheme == _this.darkColorScheme)&&(identical(other.fontFamily, _this.fontFamily) || other.fontFamily == _this.fontFamily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RemoteAppTheme;
  return Object.hash(runtimeType,_this.name,_this.effectiveEvaluation,_this.lightColorScheme,_this.darkColorScheme,_this.fontFamily);
}

@override
String toString() {
  final _this = this as RemoteAppTheme;
  return 'RemoteAppTheme(name: ${_this.name}, effectiveEvaluation: ${_this.effectiveEvaluation}, lightColorScheme: ${_this.lightColorScheme}, darkColorScheme: ${_this.darkColorScheme}, fontFamily: ${_this.fontFamily})';
}


}

/// @nodoc
abstract mixin class $RemoteAppThemeCopyWith<$Res>  {
  factory $RemoteAppThemeCopyWith(RemoteAppTheme value, $Res Function(RemoteAppTheme) _then) = _$RemoteAppThemeCopyWithImpl;
@useResult
$Res call({
 String name, EffectiveEvaluation? effectiveEvaluation, RemoteColorScheme? lightColorScheme, RemoteColorScheme? darkColorScheme, String? fontFamily
});


$EffectiveEvaluationCopyWith<$Res>? get effectiveEvaluation;$RemoteColorSchemeCopyWith<$Res>? get lightColorScheme;$RemoteColorSchemeCopyWith<$Res>? get darkColorScheme;

}
/// @nodoc
class _$RemoteAppThemeCopyWithImpl<$Res>
    implements $RemoteAppThemeCopyWith<$Res> {
  _$RemoteAppThemeCopyWithImpl(this._self, this._then);

  final RemoteAppTheme _self;
  final $Res Function(RemoteAppTheme) _then;

/// Create a copy of RemoteAppTheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? effectiveEvaluation = freezed,Object? lightColorScheme = freezed,Object? darkColorScheme = freezed,Object? fontFamily = freezed,}) {
  return _then(RemoteAppTheme(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,effectiveEvaluation: freezed == effectiveEvaluation ? _self.effectiveEvaluation : effectiveEvaluation // ignore: cast_nullable_to_non_nullable
as EffectiveEvaluation?,lightColorScheme: freezed == lightColorScheme ? _self.lightColorScheme : lightColorScheme // ignore: cast_nullable_to_non_nullable
as RemoteColorScheme?,darkColorScheme: freezed == darkColorScheme ? _self.darkColorScheme : darkColorScheme // ignore: cast_nullable_to_non_nullable
as RemoteColorScheme?,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RemoteAppTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EffectiveEvaluationCopyWith<$Res>? get effectiveEvaluation {
    if (_self.effectiveEvaluation == null) {
    return null;
  }

  return $EffectiveEvaluationCopyWith<$Res>(_self.effectiveEvaluation!, (value) {
    return _then(_self.copyWith(effectiveEvaluation: value));
  });
}/// Create a copy of RemoteAppTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteColorSchemeCopyWith<$Res>? get lightColorScheme {
    if (_self.lightColorScheme == null) {
    return null;
  }

  return $RemoteColorSchemeCopyWith<$Res>(_self.lightColorScheme!, (value) {
    return _then(_self.copyWith(lightColorScheme: value));
  });
}/// Create a copy of RemoteAppTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteColorSchemeCopyWith<$Res>? get darkColorScheme {
    if (_self.darkColorScheme == null) {
    return null;
  }

  return $RemoteColorSchemeCopyWith<$Res>(_self.darkColorScheme!, (value) {
    return _then(_self.copyWith(darkColorScheme: value));
  });
}
}


/// Adds pattern-matching-related methods to [RemoteAppTheme].
extension RemoteAppThemePatterns on RemoteAppTheme {
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
