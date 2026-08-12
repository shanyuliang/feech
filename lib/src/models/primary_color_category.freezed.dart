// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'primary_color_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrimaryColorCategory {

 String get name; String? get nameAlias; List<PrimaryColor> get colors;
/// Create a copy of PrimaryColorCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrimaryColorCategoryCopyWith<PrimaryColorCategory> get copyWith => _$PrimaryColorCategoryCopyWithImpl<PrimaryColorCategory>(this as PrimaryColorCategory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrimaryColorCategory&&(identical(other.name, name) || other.name == name)&&(identical(other.nameAlias, nameAlias) || other.nameAlias == nameAlias)&&const DeepCollectionEquality().equals(other.colors, colors));
}


@override
int get hashCode => Object.hash(runtimeType,name,nameAlias,const DeepCollectionEquality().hash(colors));

@override
String toString() {
  return 'PrimaryColorCategory(name: $name, nameAlias: $nameAlias, colors: $colors)';
}


}

/// @nodoc
abstract mixin class $PrimaryColorCategoryCopyWith<$Res>  {
  factory $PrimaryColorCategoryCopyWith(PrimaryColorCategory value, $Res Function(PrimaryColorCategory) _then) = _$PrimaryColorCategoryCopyWithImpl;
@useResult
$Res call({
 String name, String? nameAlias, List<PrimaryColor> colors
});




}
/// @nodoc
class _$PrimaryColorCategoryCopyWithImpl<$Res>
    implements $PrimaryColorCategoryCopyWith<$Res> {
  _$PrimaryColorCategoryCopyWithImpl(this._self, this._then);

  final PrimaryColorCategory _self;
  final $Res Function(PrimaryColorCategory) _then;

/// Create a copy of PrimaryColorCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? nameAlias = freezed,Object? colors = null,}) {
  return _then(PrimaryColorCategory(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameAlias: freezed == nameAlias ? _self.nameAlias : nameAlias // ignore: cast_nullable_to_non_nullable
as String?,colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as List<PrimaryColor>,
  ));
}

}


/// Adds pattern-matching-related methods to [PrimaryColorCategory].
extension PrimaryColorCategoryPatterns on PrimaryColorCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrimaryColorCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrimaryColorCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrimaryColorCategory value)  $default,){
final _that = this;
switch (_that) {
case _PrimaryColorCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrimaryColorCategory value)?  $default,){
final _that = this;
switch (_that) {
case _PrimaryColorCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? nameAlias,  List<PrimaryColor> colors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrimaryColorCategory() when $default != null:
return $default(_that.name,_that.nameAlias,_that.colors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? nameAlias,  List<PrimaryColor> colors)  $default,) {final _that = this;
switch (_that) {
case _PrimaryColorCategory():
return $default(_that.name,_that.nameAlias,_that.colors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? nameAlias,  List<PrimaryColor> colors)?  $default,) {final _that = this;
switch (_that) {
case _PrimaryColorCategory() when $default != null:
return $default(_that.name,_that.nameAlias,_that.colors);case _:
  return null;

}
}

}

/// @nodoc


class _PrimaryColorCategory implements PrimaryColorCategory {
  const _PrimaryColorCategory({required this.name, this.nameAlias,  List<PrimaryColor> colors = const []}): _colors = colors;
  

@override final  String name;
@override final  String? nameAlias;
 final  List<PrimaryColor> _colors;
@override@JsonKey() List<PrimaryColor> get colors {
  if (_colors is EqualUnmodifiableListView) return _colors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colors);
}


/// Create a copy of PrimaryColorCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrimaryColorCategoryCopyWith<_PrimaryColorCategory> get copyWith => __$PrimaryColorCategoryCopyWithImpl<_PrimaryColorCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrimaryColorCategory&&(identical(other.name, name) || other.name == name)&&(identical(other.nameAlias, nameAlias) || other.nameAlias == nameAlias)&&const DeepCollectionEquality().equals(other._colors, _colors));
}


@override
int get hashCode => Object.hash(runtimeType,name,nameAlias,const DeepCollectionEquality().hash(_colors));

@override
String toString() {
  return 'PrimaryColorCategory(name: $name, nameAlias: $nameAlias, colors: $colors)';
}


}

/// @nodoc
abstract mixin class _$PrimaryColorCategoryCopyWith<$Res> implements $PrimaryColorCategoryCopyWith<$Res> {
  factory _$PrimaryColorCategoryCopyWith(_PrimaryColorCategory value, $Res Function(_PrimaryColorCategory) _then) = __$PrimaryColorCategoryCopyWithImpl;
@override @useResult
$Res call({
 String name, String? nameAlias, List<PrimaryColor> colors
});




}
/// @nodoc
class __$PrimaryColorCategoryCopyWithImpl<$Res>
    implements _$PrimaryColorCategoryCopyWith<$Res> {
  __$PrimaryColorCategoryCopyWithImpl(this._self, this._then);

  final _PrimaryColorCategory _self;
  final $Res Function(_PrimaryColorCategory) _then;

/// Create a copy of PrimaryColorCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? nameAlias = freezed,Object? colors = null,}) {
  return _then(_PrimaryColorCategory(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameAlias: freezed == nameAlias ? _self.nameAlias : nameAlias // ignore: cast_nullable_to_non_nullable
as String?,colors: null == colors ? _self._colors : colors // ignore: cast_nullable_to_non_nullable
as List<PrimaryColor>,
  ));
}


}

// dart format on
