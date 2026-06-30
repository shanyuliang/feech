// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_playback_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioPlaybackState {

 AudioPlayerState get playerState; Duration? get duration; Duration? get position; AudioPlayerState? get playerStateWhenAppPaused;
/// Create a copy of AudioPlaybackState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioPlaybackStateCopyWith<AudioPlaybackState> get copyWith => _$AudioPlaybackStateCopyWithImpl<AudioPlaybackState>(this as AudioPlaybackState, _$identity);

  /// Serializes this AudioPlaybackState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioPlaybackState&&(identical(other.playerState, playerState) || other.playerState == playerState)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.position, position) || other.position == position)&&(identical(other.playerStateWhenAppPaused, playerStateWhenAppPaused) || other.playerStateWhenAppPaused == playerStateWhenAppPaused));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerState,duration,position,playerStateWhenAppPaused);

@override
String toString() {
  return 'AudioPlaybackState(playerState: $playerState, duration: $duration, position: $position, playerStateWhenAppPaused: $playerStateWhenAppPaused)';
}


}

/// @nodoc
abstract mixin class $AudioPlaybackStateCopyWith<$Res>  {
  factory $AudioPlaybackStateCopyWith(AudioPlaybackState value, $Res Function(AudioPlaybackState) _then) = _$AudioPlaybackStateCopyWithImpl;
@useResult
$Res call({
 AudioPlayerState playerState, Duration? duration, Duration? position, AudioPlayerState? playerStateWhenAppPaused
});




}
/// @nodoc
class _$AudioPlaybackStateCopyWithImpl<$Res>
    implements $AudioPlaybackStateCopyWith<$Res> {
  _$AudioPlaybackStateCopyWithImpl(this._self, this._then);

  final AudioPlaybackState _self;
  final $Res Function(AudioPlaybackState) _then;

/// Create a copy of AudioPlaybackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerState = null,Object? duration = freezed,Object? position = freezed,Object? playerStateWhenAppPaused = freezed,}) {
  return _then(_self.copyWith(
playerState: null == playerState ? _self.playerState : playerState // ignore: cast_nullable_to_non_nullable
as AudioPlayerState,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration?,playerStateWhenAppPaused: freezed == playerStateWhenAppPaused ? _self.playerStateWhenAppPaused : playerStateWhenAppPaused // ignore: cast_nullable_to_non_nullable
as AudioPlayerState?,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioPlaybackState].
extension AudioPlaybackStatePatterns on AudioPlaybackState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioPlaybackState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioPlaybackState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioPlaybackState value)  $default,){
final _that = this;
switch (_that) {
case _AudioPlaybackState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioPlaybackState value)?  $default,){
final _that = this;
switch (_that) {
case _AudioPlaybackState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AudioPlayerState playerState,  Duration? duration,  Duration? position,  AudioPlayerState? playerStateWhenAppPaused)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioPlaybackState() when $default != null:
return $default(_that.playerState,_that.duration,_that.position,_that.playerStateWhenAppPaused);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AudioPlayerState playerState,  Duration? duration,  Duration? position,  AudioPlayerState? playerStateWhenAppPaused)  $default,) {final _that = this;
switch (_that) {
case _AudioPlaybackState():
return $default(_that.playerState,_that.duration,_that.position,_that.playerStateWhenAppPaused);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AudioPlayerState playerState,  Duration? duration,  Duration? position,  AudioPlayerState? playerStateWhenAppPaused)?  $default,) {final _that = this;
switch (_that) {
case _AudioPlaybackState() when $default != null:
return $default(_that.playerState,_that.duration,_that.position,_that.playerStateWhenAppPaused);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioPlaybackState extends AudioPlaybackState {
  const _AudioPlaybackState({this.playerState = AudioPlayerState.stopped, this.duration, this.position, this.playerStateWhenAppPaused}): super._();
  factory _AudioPlaybackState.fromJson(Map<String, dynamic> json) => _$AudioPlaybackStateFromJson(json);

@override@JsonKey() final  AudioPlayerState playerState;
@override final  Duration? duration;
@override final  Duration? position;
@override final  AudioPlayerState? playerStateWhenAppPaused;

/// Create a copy of AudioPlaybackState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioPlaybackStateCopyWith<_AudioPlaybackState> get copyWith => __$AudioPlaybackStateCopyWithImpl<_AudioPlaybackState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioPlaybackStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioPlaybackState&&(identical(other.playerState, playerState) || other.playerState == playerState)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.position, position) || other.position == position)&&(identical(other.playerStateWhenAppPaused, playerStateWhenAppPaused) || other.playerStateWhenAppPaused == playerStateWhenAppPaused));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerState,duration,position,playerStateWhenAppPaused);

@override
String toString() {
  return 'AudioPlaybackState(playerState: $playerState, duration: $duration, position: $position, playerStateWhenAppPaused: $playerStateWhenAppPaused)';
}


}

/// @nodoc
abstract mixin class _$AudioPlaybackStateCopyWith<$Res> implements $AudioPlaybackStateCopyWith<$Res> {
  factory _$AudioPlaybackStateCopyWith(_AudioPlaybackState value, $Res Function(_AudioPlaybackState) _then) = __$AudioPlaybackStateCopyWithImpl;
@override @useResult
$Res call({
 AudioPlayerState playerState, Duration? duration, Duration? position, AudioPlayerState? playerStateWhenAppPaused
});




}
/// @nodoc
class __$AudioPlaybackStateCopyWithImpl<$Res>
    implements _$AudioPlaybackStateCopyWith<$Res> {
  __$AudioPlaybackStateCopyWithImpl(this._self, this._then);

  final _AudioPlaybackState _self;
  final $Res Function(_AudioPlaybackState) _then;

/// Create a copy of AudioPlaybackState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerState = null,Object? duration = freezed,Object? position = freezed,Object? playerStateWhenAppPaused = freezed,}) {
  return _then(_AudioPlaybackState(
playerState: null == playerState ? _self.playerState : playerState // ignore: cast_nullable_to_non_nullable
as AudioPlayerState,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration?,playerStateWhenAppPaused: freezed == playerStateWhenAppPaused ? _self.playerStateWhenAppPaused : playerStateWhenAppPaused // ignore: cast_nullable_to_non_nullable
as AudioPlayerState?,
  ));
}


}

// dart format on
