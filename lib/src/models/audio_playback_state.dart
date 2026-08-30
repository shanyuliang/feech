import 'package:freezed_annotation/freezed_annotation.dart';

import 'audio_player_state.dart';

part 'audio_playback_state.freezed.dart';

@freezed
class const AudioPlaybackState({
  final AudioPlayerState playerState = AudioPlayerState.stopped,
  final Duration? duration,
  final Duration? position,
  final AudioPlayerState? playerStateWhenAppPaused,
}) with _$AudioPlaybackState {
  double getProgress() {
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
