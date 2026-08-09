// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'primary_colors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrimaryColors {

 List<PrimaryColorCulture> get cultures;
/// Create a copy of PrimaryColors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrimaryColorsCopyWith<PrimaryColors> get copyWith => _$PrimaryColorsCopyWithImpl<PrimaryColors>(this as PrimaryColors, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrimaryColors&&const DeepCollectionEquality().equals(other.cultures, cultures));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cultures));

@override
String toString() {
  return 'PrimaryColors(cultures: $cultures)';
}


}

/// @nodoc
abstract mixin class $PrimaryColorsCopyWith<$Res>  {
  factory $PrimaryColorsCopyWith(PrimaryColors value, $Res Function(PrimaryColors) _then) = _$PrimaryColorsCopyWithImpl;
@useResult
$Res call({
 List<PrimaryColorCulture> cultures
});




}
/// @nodoc
class _$PrimaryColorsCopyWithImpl<$Res>
    implements $PrimaryColorsCopyWith<$Res> {
  _$PrimaryColorsCopyWithImpl(this._self, this._then);

  final PrimaryColors _self;
  final $Res Function(PrimaryColors) _then;

/// Create a copy of PrimaryColors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cultures = null,}) {
  return _then(_self.copyWith(
cultures: null == cultures ? _self.cultures : cultures // ignore: cast_nullable_to_non_nullable
as List<PrimaryColorCulture>,
  ));
}

}


/// Adds pattern-matching-related methods to [PrimaryColors].
extension PrimaryColorsPatterns on PrimaryColors {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrimaryColors value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrimaryColors() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrimaryColors value)  $default,){
final _that = this;
switch (_that) {
case _PrimaryColors():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrimaryColors value)?  $default,){
final _that = this;
switch (_that) {
case _PrimaryColors() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PrimaryColorCulture> cultures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrimaryColors() when $default != null:
return $default(_that.cultures);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PrimaryColorCulture> cultures)  $default,) {final _that = this;
switch (_that) {
case _PrimaryColors():
return $default(_that.cultures);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PrimaryColorCulture> cultures)?  $default,) {final _that = this;
switch (_that) {
case _PrimaryColors() when $default != null:
return $default(_that.cultures);case _:
  return null;

}
}

}

/// @nodoc


class _PrimaryColors implements PrimaryColors {
  const _PrimaryColors({final  List<PrimaryColorCulture> cultures = const []}): _cultures = cultures;
  

 final  List<PrimaryColorCulture> _cultures;
@override@JsonKey() List<PrimaryColorCulture> get cultures {
  if (_cultures is EqualUnmodifiableListView) return _cultures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cultures);
}


/// Create a copy of PrimaryColors
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrimaryColorsCopyWith<_PrimaryColors> get copyWith => __$PrimaryColorsCopyWithImpl<_PrimaryColors>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrimaryColors&&const DeepCollectionEquality().equals(other._cultures, _cultures));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cultures));

@override
String toString() {
  return 'PrimaryColors(cultures: $cultures)';
}


}

/// @nodoc
abstract mixin class _$PrimaryColorsCopyWith<$Res> implements $PrimaryColorsCopyWith<$Res> {
  factory _$PrimaryColorsCopyWith(_PrimaryColors value, $Res Function(_PrimaryColors) _then) = __$PrimaryColorsCopyWithImpl;
@override @useResult
$Res call({
 List<PrimaryColorCulture> cultures
});




}
/// @nodoc
class __$PrimaryColorsCopyWithImpl<$Res>
    implements _$PrimaryColorsCopyWith<$Res> {
  __$PrimaryColorsCopyWithImpl(this._self, this._then);

  final _PrimaryColors _self;
  final $Res Function(_PrimaryColors) _then;

/// Create a copy of PrimaryColors
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cultures = null,}) {
  return _then(_PrimaryColors(
cultures: null == cultures ? _self._cultures : cultures // ignore: cast_nullable_to_non_nullable
as List<PrimaryColorCulture>,
  ));
}


}

// dart format on
