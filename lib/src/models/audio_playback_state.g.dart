// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_playback_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioPlaybackState _$AudioPlaybackStateFromJson(Map<String, dynamic> json) =>
    _AudioPlaybackState(
      playerState:
          $enumDecodeNullable(_$AudioPlayerStateEnumMap, json['playerState']) ??
          AudioPlayerState.stopped,
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: (json['duration'] as num).toInt()),
      position: json['position'] == null
          ? null
          : Duration(microseconds: (json['position'] as num).toInt()),
      playerStateWhenAppPaused: $enumDecodeNullable(
        _$AudioPlayerStateEnumMap,
        json['playerStateWhenAppPaused'],
      ),
    );

Map<String, dynamic> _$AudioPlaybackStateToJson(_AudioPlaybackState instance) =>
    <String, dynamic>{
      'playerState': _$AudioPlayerStateEnumMap[instance.playerState]!,
      'duration': instance.duration?.inMicroseconds,
      'position': instance.position?.inMicroseconds,
      'playerStateWhenAppPaused':
          _$AudioPlayerStateEnumMap[instance.playerStateWhenAppPaused],
    };

const _$AudioPlayerStateEnumMap = {
  AudioPlayerState.stopped: 'stopped',
  AudioPlayerState.playing: 'playing',
  AudioPlayerState.paused: 'paused',
  AudioPlayerState.completed: 'completed',
  AudioPlayerState.disposed: 'disposed',
};
