// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_lifecycle_state_signal_container_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PageLifecycleStateSignalContainerParameter {

 String? get routeName; PageLifecycleState get initialLifecycleState;
/// Create a copy of PageLifecycleStateSignalContainerParameter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageLifecycleStateSignalContainerParameterCopyWith<PageLifecycleStateSignalContainerParameter> get copyWith => _$PageLifecycleStateSignalContainerParameterCopyWithImpl<PageLifecycleStateSignalContainerParameter>(this as PageLifecycleStateSignalContainerParameter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageLifecycleStateSignalContainerParameter&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.initialLifecycleState, initialLifecycleState) || other.initialLifecycleState == initialLifecycleState));
}


@override
int get hashCode => Object.hash(runtimeType,routeName,initialLifecycleState);

@override
String toString() {
  return 'PageLifecycleStateSignalContainerParameter(routeName: $routeName, initialLifecycleState: $initialLifecycleState)';
}


}

/// @nodoc
abstract mixin class $PageLifecycleStateSignalContainerParameterCopyWith<$Res>  {
  factory $PageLifecycleStateSignalContainerParameterCopyWith(PageLifecycleStateSignalContainerParameter value, $Res Function(PageLifecycleStateSignalContainerParameter) _then) = _$PageLifecycleStateSignalContainerParameterCopyWithImpl;
@useResult
$Res call({
 String? routeName, PageLifecycleState initialLifecycleState
});




}
/// @nodoc
class _$PageLifecycleStateSignalContainerParameterCopyWithImpl<$Res>
    implements $PageLifecycleStateSignalContainerParameterCopyWith<$Res> {
  _$PageLifecycleStateSignalContainerParameterCopyWithImpl(this._self, this._then);

  final PageLifecycleStateSignalContainerParameter _self;
  final $Res Function(PageLifecycleStateSignalContainerParameter) _then;

/// Create a copy of PageLifecycleStateSignalContainerParameter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? routeName = freezed,Object? initialLifecycleState = null,}) {
  return _then(_self.copyWith(
routeName: freezed == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String?,initialLifecycleState: null == initialLifecycleState ? _self.initialLifecycleState : initialLifecycleState // ignore: cast_nullable_to_non_nullable
as PageLifecycleState,
  ));
}

}


/// Adds pattern-matching-related methods to [PageLifecycleStateSignalContainerParameter].
extension PageLifecycleStateSignalContainerParameterPatterns on PageLifecycleStateSignalContainerParameter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageLifecycleStateSignalContainerParameter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageLifecycleStateSignalContainerParameter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageLifecycleStateSignalContainerParameter value)  $default,){
final _that = this;
switch (_that) {
case _PageLifecycleStateSignalContainerParameter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageLifecycleStateSignalContainerParameter value)?  $default,){
final _that = this;
switch (_that) {
case _PageLifecycleStateSignalContainerParameter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? routeName,  PageLifecycleState initialLifecycleState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageLifecycleStateSignalContainerParameter() when $default != null:
return $default(_that.routeName,_that.initialLifecycleState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? routeName,  PageLifecycleState initialLifecycleState)  $default,) {final _that = this;
switch (_that) {
case _PageLifecycleStateSignalContainerParameter():
return $default(_that.routeName,_that.initialLifecycleState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? routeName,  PageLifecycleState initialLifecycleState)?  $default,) {final _that = this;
switch (_that) {
case _PageLifecycleStateSignalContainerParameter() when $default != null:
return $default(_that.routeName,_that.initialLifecycleState);case _:
  return null;

}
}

}

/// @nodoc


class _PageLifecycleStateSignalContainerParameter implements PageLifecycleStateSignalContainerParameter {
  const _PageLifecycleStateSignalContainerParameter({this.routeName, this.initialLifecycleState = PageLifecycleState.detached});
  

@override final  String? routeName;
@override@JsonKey() final  PageLifecycleState initialLifecycleState;

/// Create a copy of PageLifecycleStateSignalContainerParameter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageLifecycleStateSignalContainerParameterCopyWith<_PageLifecycleStateSignalContainerParameter> get copyWith => __$PageLifecycleStateSignalContainerParameterCopyWithImpl<_PageLifecycleStateSignalContainerParameter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageLifecycleStateSignalContainerParameter&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.initialLifecycleState, initialLifecycleState) || other.initialLifecycleState == initialLifecycleState));
}


@override
int get hashCode => Object.hash(runtimeType,routeName,initialLifecycleState);

@override
String toString() {
  return 'PageLifecycleStateSignalContainerParameter(routeName: $routeName, initialLifecycleState: $initialLifecycleState)';
}


}

/// @nodoc
abstract mixin class _$PageLifecycleStateSignalContainerParameterCopyWith<$Res> implements $PageLifecycleStateSignalContainerParameterCopyWith<$Res> {
  factory _$PageLifecycleStateSignalContainerParameterCopyWith(_PageLifecycleStateSignalContainerParameter value, $Res Function(_PageLifecycleStateSignalContainerParameter) _then) = __$PageLifecycleStateSignalContainerParameterCopyWithImpl;
@override @useResult
$Res call({
 String? routeName, PageLifecycleState initialLifecycleState
});




}
/// @nodoc
class __$PageLifecycleStateSignalContainerParameterCopyWithImpl<$Res>
    implements _$PageLifecycleStateSignalContainerParameterCopyWith<$Res> {
  __$PageLifecycleStateSignalContainerParameterCopyWithImpl(this._self, this._then);

  final _PageLifecycleStateSignalContainerParameter _self;
  final $Res Function(_PageLifecycleStateSignalContainerParameter) _then;

/// Create a copy of PageLifecycleStateSignalContainerParameter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? routeName = freezed,Object? initialLifecycleState = null,}) {
  return _then(_PageLifecycleStateSignalContainerParameter(
routeName: freezed == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String?,initialLifecycleState: null == initialLifecycleState ? _self.initialLifecycleState : initialLifecycleState // ignore: cast_nullable_to_non_nullable
as PageLifecycleState,
  ));
}


}

// dart format on
