// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_title_signal_container_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PageTitleSignalContainerParameter {

 String? get routeName; String? get initialTitle;
/// Create a copy of PageTitleSignalContainerParameter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageTitleSignalContainerParameterCopyWith<PageTitleSignalContainerParameter> get copyWith => _$PageTitleSignalContainerParameterCopyWithImpl<PageTitleSignalContainerParameter>(this as PageTitleSignalContainerParameter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageTitleSignalContainerParameter&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.initialTitle, initialTitle) || other.initialTitle == initialTitle));
}


@override
int get hashCode => Object.hash(runtimeType,routeName,initialTitle);

@override
String toString() {
  return 'PageTitleSignalContainerParameter(routeName: $routeName, initialTitle: $initialTitle)';
}


}

/// @nodoc
abstract mixin class $PageTitleSignalContainerParameterCopyWith<$Res>  {
  factory $PageTitleSignalContainerParameterCopyWith(PageTitleSignalContainerParameter value, $Res Function(PageTitleSignalContainerParameter) _then) = _$PageTitleSignalContainerParameterCopyWithImpl;
@useResult
$Res call({
 String? routeName, String? initialTitle
});




}
/// @nodoc
class _$PageTitleSignalContainerParameterCopyWithImpl<$Res>
    implements $PageTitleSignalContainerParameterCopyWith<$Res> {
  _$PageTitleSignalContainerParameterCopyWithImpl(this._self, this._then);

  final PageTitleSignalContainerParameter _self;
  final $Res Function(PageTitleSignalContainerParameter) _then;

/// Create a copy of PageTitleSignalContainerParameter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? routeName = freezed,Object? initialTitle = freezed,}) {
  return _then(_self.copyWith(
routeName: freezed == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String?,initialTitle: freezed == initialTitle ? _self.initialTitle : initialTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PageTitleSignalContainerParameter].
extension PageTitleSignalContainerParameterPatterns on PageTitleSignalContainerParameter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageTitleSignalContainerParameter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageTitleSignalContainerParameter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageTitleSignalContainerParameter value)  $default,){
final _that = this;
switch (_that) {
case _PageTitleSignalContainerParameter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageTitleSignalContainerParameter value)?  $default,){
final _that = this;
switch (_that) {
case _PageTitleSignalContainerParameter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? routeName,  String? initialTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageTitleSignalContainerParameter() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? routeName,  String? initialTitle)  $default,) {final _that = this;
switch (_that) {
case _PageTitleSignalContainerParameter():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? routeName,  String? initialTitle)?  $default,) {final _that = this;
switch (_that) {
case _PageTitleSignalContainerParameter() when $default != null:
return $default(_that.routeName,_that.initialTitle);case _:
  return null;

}
}

}

/// @nodoc


class _PageTitleSignalContainerParameter implements PageTitleSignalContainerParameter {
  const _PageTitleSignalContainerParameter({this.routeName, this.initialTitle});
  

@override final  String? routeName;
@override final  String? initialTitle;

/// Create a copy of PageTitleSignalContainerParameter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageTitleSignalContainerParameterCopyWith<_PageTitleSignalContainerParameter> get copyWith => __$PageTitleSignalContainerParameterCopyWithImpl<_PageTitleSignalContainerParameter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageTitleSignalContainerParameter&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.initialTitle, initialTitle) || other.initialTitle == initialTitle));
}


@override
int get hashCode => Object.hash(runtimeType,routeName,initialTitle);

@override
String toString() {
  return 'PageTitleSignalContainerParameter(routeName: $routeName, initialTitle: $initialTitle)';
}


}

/// @nodoc
abstract mixin class _$PageTitleSignalContainerParameterCopyWith<$Res> implements $PageTitleSignalContainerParameterCopyWith<$Res> {
  factory _$PageTitleSignalContainerParameterCopyWith(_PageTitleSignalContainerParameter value, $Res Function(_PageTitleSignalContainerParameter) _then) = __$PageTitleSignalContainerParameterCopyWithImpl;
@override @useResult
$Res call({
 String? routeName, String? initialTitle
});




}
/// @nodoc
class __$PageTitleSignalContainerParameterCopyWithImpl<$Res>
    implements _$PageTitleSignalContainerParameterCopyWith<$Res> {
  __$PageTitleSignalContainerParameterCopyWithImpl(this._self, this._then);

  final _PageTitleSignalContainerParameter _self;
  final $Res Function(_PageTitleSignalContainerParameter) _then;

/// Create a copy of PageTitleSignalContainerParameter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? routeName = freezed,Object? initialTitle = freezed,}) {
  return _then(_PageTitleSignalContainerParameter(
routeName: freezed == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String?,initialTitle: freezed == initialTitle ? _self.initialTitle : initialTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
