// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_playback_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AudioPlaybackState {


/// Create a copy of AudioPlaybackState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioPlaybackStateCopyWith<AudioPlaybackState> get copyWith => _$AudioPlaybackStateCopyWithImpl<AudioPlaybackState>(this as AudioPlaybackState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AudioPlaybackState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioPlaybackState&&(identical(other.playerState, _this.playerState) || other.playerState == _this.playerState)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.position, _this.position) || other.position == _this.position)&&(identical(other.playerStateWhenAppPaused, _this.playerStateWhenAppPaused) || other.playerStateWhenAppPaused == _this.playerStateWhenAppPaused));
}


@override
int get hashCode {
  final _this = this as AudioPlaybackState;
  return Object.hash(runtimeType,_this.playerState,_this.duration,_this.position,_this.playerStateWhenAppPaused);
}

@override
String toString() {
  final _this = this as AudioPlaybackState;
  return 'AudioPlaybackState(playerState: ${_this.playerState}, duration: ${_this.duration}, position: ${_this.position}, playerStateWhenAppPaused: ${_this.playerStateWhenAppPaused})';
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
  return _then(AudioPlaybackState(
playerState: null == playerState ? _self.playerState : playerState // ignore: cast_nullable_to_non_nullable
as AudioPlayerState,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration?,playerStateWhenAppPaused: freezed == playerStateWhenAppPaused ? _self.playerStateWhenAppPaused : playerStateWhenAppPaused // ignore: cast_nullable_to_non_nullable
as AudioPlayerState?,
  ));
}

}



/// @nodoc


class _AudioPlaybackState extends AudioPlaybackState {
  const _AudioPlaybackState({this.playerState = AudioPlayerState.stopped, this.duration, this.position, this.playerStateWhenAppPaused}): super(playerState: playerState, duration: duration, position: position, playerStateWhenAppPaused: playerStateWhenAppPaused);
  

@override final  AudioPlayerState playerState;
@override final  Duration? duration;
@override final  Duration? position;
@override final  AudioPlayerState? playerStateWhenAppPaused;

/// Create a copy of AudioPlaybackState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioPlaybackStateCopyWith<_AudioPlaybackState> get copyWith => __$AudioPlaybackStateCopyWithImpl<_AudioPlaybackState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioPlaybackState&&(identical(other.playerState, playerState) || other.playerState == playerState)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.position, position) || other.position == position)&&(identical(other.playerStateWhenAppPaused, playerStateWhenAppPaused) || other.playerStateWhenAppPaused == playerStateWhenAppPaused));
}


@override
int get hashCode {
    return Object.hash(runtimeType,playerState,duration,position,playerStateWhenAppPaused);
}

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
