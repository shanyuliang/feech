// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'primary_color_culture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrimaryColorCulture {

 String get name; String? get nameAlias; List<PrimaryColorCategory> get categories;
/// Create a copy of PrimaryColorCulture
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrimaryColorCultureCopyWith<PrimaryColorCulture> get copyWith => _$PrimaryColorCultureCopyWithImpl<PrimaryColorCulture>(this as PrimaryColorCulture, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrimaryColorCulture&&(identical(other.name, name) || other.name == name)&&(identical(other.nameAlias, nameAlias) || other.nameAlias == nameAlias)&&const DeepCollectionEquality().equals(other.categories, categories));
}


@override
int get hashCode => Object.hash(runtimeType,name,nameAlias,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'PrimaryColorCulture(name: $name, nameAlias: $nameAlias, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $PrimaryColorCultureCopyWith<$Res>  {
  factory $PrimaryColorCultureCopyWith(PrimaryColorCulture value, $Res Function(PrimaryColorCulture) _then) = _$PrimaryColorCultureCopyWithImpl;
@useResult
$Res call({
 String name, String? nameAlias, List<PrimaryColorCategory> categories
});




}
/// @nodoc
class _$PrimaryColorCultureCopyWithImpl<$Res>
    implements $PrimaryColorCultureCopyWith<$Res> {
  _$PrimaryColorCultureCopyWithImpl(this._self, this._then);

  final PrimaryColorCulture _self;
  final $Res Function(PrimaryColorCulture) _then;

/// Create a copy of PrimaryColorCulture
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? nameAlias = freezed,Object? categories = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameAlias: freezed == nameAlias ? _self.nameAlias : nameAlias // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<PrimaryColorCategory>,
  ));
}

}


/// Adds pattern-matching-related methods to [PrimaryColorCulture].
extension PrimaryColorCulturePatterns on PrimaryColorCulture {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrimaryColorCulture value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrimaryColorCulture() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrimaryColorCulture value)  $default,){
final _that = this;
switch (_that) {
case _PrimaryColorCulture():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrimaryColorCulture value)?  $default,){
final _that = this;
switch (_that) {
case _PrimaryColorCulture() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? nameAlias,  List<PrimaryColorCategory> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrimaryColorCulture() when $default != null:
return $default(_that.name,_that.nameAlias,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? nameAlias,  List<PrimaryColorCategory> categories)  $default,) {final _that = this;
switch (_that) {
case _PrimaryColorCulture():
return $default(_that.name,_that.nameAlias,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? nameAlias,  List<PrimaryColorCategory> categories)?  $default,) {final _that = this;
switch (_that) {
case _PrimaryColorCulture() when $default != null:
return $default(_that.name,_that.nameAlias,_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _PrimaryColorCulture implements PrimaryColorCulture {
  const _PrimaryColorCulture({required this.name, this.nameAlias, final  List<PrimaryColorCategory> categories = const []}): _categories = categories;
  

@override final  String name;
@override final  String? nameAlias;
 final  List<PrimaryColorCategory> _categories;
@override@JsonKey() List<PrimaryColorCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of PrimaryColorCulture
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrimaryColorCultureCopyWith<_PrimaryColorCulture> get copyWith => __$PrimaryColorCultureCopyWithImpl<_PrimaryColorCulture>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrimaryColorCulture&&(identical(other.name, name) || other.name == name)&&(identical(other.nameAlias, nameAlias) || other.nameAlias == nameAlias)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,name,nameAlias,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'PrimaryColorCulture(name: $name, nameAlias: $nameAlias, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$PrimaryColorCultureCopyWith<$Res> implements $PrimaryColorCultureCopyWith<$Res> {
  factory _$PrimaryColorCultureCopyWith(_PrimaryColorCulture value, $Res Function(_PrimaryColorCulture) _then) = __$PrimaryColorCultureCopyWithImpl;
@override @useResult
$Res call({
 String name, String? nameAlias, List<PrimaryColorCategory> categories
});




}
/// @nodoc
class __$PrimaryColorCultureCopyWithImpl<$Res>
    implements _$PrimaryColorCultureCopyWith<$Res> {
  __$PrimaryColorCultureCopyWithImpl(this._self, this._then);

  final _PrimaryColorCulture _self;
  final $Res Function(_PrimaryColorCulture) _then;

/// Create a copy of PrimaryColorCulture
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? nameAlias = freezed,Object? categories = null,}) {
  return _then(_PrimaryColorCulture(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameAlias: freezed == nameAlias ? _self.nameAlias : nameAlias // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<PrimaryColorCategory>,
  ));
}


}

// dart format on
