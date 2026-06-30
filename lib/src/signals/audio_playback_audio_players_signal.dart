import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../models/audio_playback_state.dart';
import '../models/audio_player_state.dart';
import 'audio_playback_signal.dart';

class AudioPlaybackAudioPlayersSignal extends AudioPlaybackSignal {
  final _audioPlayer = AudioPlayer();
  late Future<void> _audioPlayerInit;

  AudioPlaybackAudioPlayersSignal() : super(const AudioPlaybackState(), options: const SignalOptions(name: 'AudioPlaybackAudioPlayersSignal')) {
    AudioLogger.logLevel = AudioLogLevel.info;
    _audioPlayerInit = _audioPlayer.setReleaseMode(ReleaseMode.stop);
    _audioPlayer.positionUpdater = TimerPositionUpdater(interval: const Duration(milliseconds: 200), getPosition: _audioPlayer.getCurrentPosition);
    _audioPlayer.eventStream.listen((AudioEvent event) {
      debugPrint(event.eventType.name);
    });
    _audioPlayer.onPlayerStateChanged.listen((PlayerState playerState) {
      value = value.copyWith(playerState: _toAudioPlayerState(playerState));
    });
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      value = value.copyWith(duration: duration);
    });
    _audioPlayer.onPositionChanged.listen((Duration position) {
      value = value.copyWith(position: position);
    });
  }

  Future<void> _setSource({required String assetName}) async {
    await _audioPlayerInit;
    await _audioPlayer.setSourceAsset(assetName);
  }

  @override
  Future<void> play({required String assetName}) async {
    await _setSource(assetName: assetName);
    resume();
  }

  @override
  Future<void> resume() async {
    _audioPlayer.resume();
  }

  @override
  Future<void> pause() async {
    _audioPlayer.pause();
  }

  @override
  Future<void> stop() async {
    _audioPlayer.release();
  }

  @override
  void rememberPlayerStateWhenAppPaused() {
    value = value.copyWith(playerStateWhenAppPaused: value.playerState);
  }

  @override
  void clearPlayerStateWhenAppPaused() {
    value = value.copyWith(playerStateWhenAppPaused: null);
  }

  AudioPlayerState _toAudioPlayerState(PlayerState playerState) {
    switch (playerState) {
      case PlayerState.stopped:
        return AudioPlayerState.stopped;
      case PlayerState.playing:
        return AudioPlayerState.playing;
      case PlayerState.paused:
        return AudioPlayerState.paused;
      case PlayerState.completed:
        return AudioPlayerState.completed;
      case PlayerState.disposed:
        return AudioPlayerState.disposed;
    }
  }
}
