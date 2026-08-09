// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'primary_color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrimaryColor {

@ColorStringConverter() Color get color; String? get name; String? get nameAlias;
/// Create a copy of PrimaryColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrimaryColorCopyWith<PrimaryColor> get copyWith => _$PrimaryColorCopyWithImpl<PrimaryColor>(this as PrimaryColor, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrimaryColor&&(identical(other.color, color) || other.color == color)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameAlias, nameAlias) || other.nameAlias == nameAlias));
}


@override
int get hashCode => Object.hash(runtimeType,color,name,nameAlias);

@override
String toString() {
  return 'PrimaryColor(color: $color, name: $name, nameAlias: $nameAlias)';
}


}

/// @nodoc
abstract mixin class $PrimaryColorCopyWith<$Res>  {
  factory $PrimaryColorCopyWith(PrimaryColor value, $Res Function(PrimaryColor) _then) = _$PrimaryColorCopyWithImpl;
@useResult
$Res call({
@ColorStringConverter() Color color, String? name, String? nameAlias
});




}
/// @nodoc
class _$PrimaryColorCopyWithImpl<$Res>
    implements $PrimaryColorCopyWith<$Res> {
  _$PrimaryColorCopyWithImpl(this._self, this._then);

  final PrimaryColor _self;
  final $Res Function(PrimaryColor) _then;

/// Create a copy of PrimaryColor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = null,Object? name = freezed,Object? nameAlias = freezed,}) {
  return _then(_self.copyWith(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,nameAlias: freezed == nameAlias ? _self.nameAlias : nameAlias // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrimaryColor].
extension PrimaryColorPatterns on PrimaryColor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrimaryColor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrimaryColor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrimaryColor value)  $default,){
final _that = this;
switch (_that) {
case _PrimaryColor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrimaryColor value)?  $default,){
final _that = this;
switch (_that) {
case _PrimaryColor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@ColorStringConverter()  Color color,  String? name,  String? nameAlias)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrimaryColor() when $default != null:
return $default(_that.color,_that.name,_that.nameAlias);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@ColorStringConverter()  Color color,  String? name,  String? nameAlias)  $default,) {final _that = this;
switch (_that) {
case _PrimaryColor():
return $default(_that.color,_that.name,_that.nameAlias);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@ColorStringConverter()  Color color,  String? name,  String? nameAlias)?  $default,) {final _that = this;
switch (_that) {
case _PrimaryColor() when $default != null:
return $default(_that.color,_that.name,_that.nameAlias);case _:
  return null;

}
}

}

/// @nodoc


class _PrimaryColor implements PrimaryColor {
  const _PrimaryColor({@ColorStringConverter() required this.color, this.name, this.nameAlias});
  

@override@ColorStringConverter() final  Color color;
@override final  String? name;
@override final  String? nameAlias;

/// Create a copy of PrimaryColor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrimaryColorCopyWith<_PrimaryColor> get copyWith => __$PrimaryColorCopyWithImpl<_PrimaryColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrimaryColor&&(identical(other.color, color) || other.color == color)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameAlias, nameAlias) || other.nameAlias == nameAlias));
}


@override
int get hashCode => Object.hash(runtimeType,color,name,nameAlias);

@override
String toString() {
  return 'PrimaryColor(color: $color, name: $name, nameAlias: $nameAlias)';
}


}

/// @nodoc
abstract mixin class _$PrimaryColorCopyWith<$Res> implements $PrimaryColorCopyWith<$Res> {
  factory _$PrimaryColorCopyWith(_PrimaryColor value, $Res Function(_PrimaryColor) _then) = __$PrimaryColorCopyWithImpl;
@override @useResult
$Res call({
@ColorStringConverter() Color color, String? name, String? nameAlias
});




}
/// @nodoc
class __$PrimaryColorCopyWithImpl<$Res>
    implements _$PrimaryColorCopyWith<$Res> {
  __$PrimaryColorCopyWithImpl(this._self, this._then);

  final _PrimaryColor _self;
  final $Res Function(_PrimaryColor) _then;

/// Create a copy of PrimaryColor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = null,Object? name = freezed,Object? nameAlias = freezed,}) {
  return _then(_PrimaryColor(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,nameAlias: freezed == nameAlias ? _self.nameAlias : nameAlias // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
