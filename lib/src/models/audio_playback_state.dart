import 'package:freezed_annotation/freezed_annotation.dart';

import 'audio_player_state.dart';

part 'audio_playback_state.freezed.dart';
part 'audio_playback_state.g.dart';

@Freezed()
abstract class AudioPlaybackState with _$AudioPlaybackState {
  const AudioPlaybackState._();

  const factory AudioPlaybackState({
    @Default(AudioPlayerState.stopped) final AudioPlayerState playerState,
    final Duration? duration,
    final Duration? position,
    final AudioPlayerState? playerStateWhenAppPaused,
  }) = _AudioPlaybackState;

  factory AudioPlaybackState.fromJson(Map<String, dynamic> json) => _$AudioPlaybackStateFromJson(json);

  double get progress {
    if (duration != null && position != null) {
      if (duration! >= position!) {
        return position!.inMilliseconds / duration!.inMilliseconds;
      } else {
        return 0.0;
      }
    } else {
      return 0.0;
    }
  }
}
