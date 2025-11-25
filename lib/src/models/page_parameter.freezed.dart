// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PageParameter {

 String get routeName; String? get initialTitle;
/// Create a copy of PageParameter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageParameterCopyWith<PageParameter> get copyWith => _$PageParameterCopyWithImpl<PageParameter>(this as PageParameter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageParameter&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.initialTitle, initialTitle) || other.initialTitle == initialTitle));
}


@override
int get hashCode => Object.hash(runtimeType,routeName,initialTitle);

@override
String toString() {
  return 'PageParameter(routeName: $routeName, initialTitle: $initialTitle)';
}


}

/// @nodoc
abstract mixin class $PageParameterCopyWith<$Res>  {
  factory $PageParameterCopyWith(PageParameter value, $Res Function(PageParameter) _then) = _$PageParameterCopyWithImpl;
@useResult
$Res call({
 String routeName, String? initialTitle
});




}
/// @nodoc
class _$PageParameterCopyWithImpl<$Res>
    implements $PageParameterCopyWith<$Res> {
  _$PageParameterCopyWithImpl(this._self, this._then);

  final PageParameter _self;
  final $Res Function(PageParameter) _then;

/// Create a copy of PageParameter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? routeName = null,Object? initialTitle = freezed,}) {
  return _then(_self.copyWith(
routeName: null == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String,initialTitle: freezed == initialTitle ? _self.initialTitle : initialTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PageParameter].
extension PageParameterPatterns on PageParameter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageParameter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageParameter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageParameter value)  $default,){
final _that = this;
switch (_that) {
case _PageParameter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageParameter value)?  $default,){
final _that = this;
switch (_that) {
case _PageParameter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String routeName,  String? initialTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageParameter() when $default != null:
return $default(_that.routeName,_that.initialTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String routeName,  String? initialTitle)  $default,) {final _that = this;
switch (_that) {
case _PageParameter():
return $default(_that.routeName,_that.initialTitle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String routeName,  String? initialTitle)?  $default,) {final _that = this;
switch (_that) {
case _PageParameter() when $default != null:
return $default(_that.routeName,_that.initialTitle);case _:
  return null;

}
}

}

/// @nodoc


class _PageParameter implements PageParameter {
  const _PageParameter({required this.routeName, this.initialTitle});
  

@override final  String routeName;
@override final  String? initialTitle;

/// Create a copy of PageParameter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageParameterCopyWith<_PageParameter> get copyWith => __$PageParameterCopyWithImpl<_PageParameter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageParameter&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.initialTitle, initialTitle) || other.initialTitle == initialTitle));
}


@override
int get hashCode => Object.hash(runtimeType,routeName,initialTitle);

@override
String toString() {
  return 'PageParameter(routeName: $routeName, initialTitle: $initialTitle)';
}


}

/// @nodoc
abstract mixin class _$PageParameterCopyWith<$Res> implements $PageParameterCopyWith<$Res> {
  factory _$PageParameterCopyWith(_PageParameter value, $Res Function(_PageParameter) _then) = __$PageParameterCopyWithImpl;
@override @useResult
$Res call({
 String routeName, String? initialTitle
});




}
/// @nodoc
class __$PageParameterCopyWithImpl<$Res>
    implements _$PageParameterCopyWith<$Res> {
  __$PageParameterCopyWithImpl(this._self, this._then);

  final _PageParameter _self;
  final $Res Function(_PageParameter) _then;

/// Create a copy of PageParameter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? routeName = null,Object? initialTitle = freezed,}) {
  return _then(_PageParameter(
routeName: null == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String,initialTitle: freezed == initialTitle ? _self.initialTitle : initialTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
