import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../models/audio_playback_state.dart';
import '../models/audio_player_state.dart';
import 'audio_playback_signal.dart';

class AudioPlaybackJustAudioSignal extends AudioPlaybackSignal {
  final _audioPlayer = AudioPlayer();

  AudioPlaybackJustAudioSignal() : super(const AudioPlaybackState(), options: const SignalOptions(name: 'AudioPlaybackJustAudioSignal')) {
    _audioPlayer.playerStateStream.listen((playerState) {
      set(peek().copyWith(playerState: _toAudioPlayerState(playerState)));
    });
    _audioPlayer.positionStream.listen((position) {
      set(peek().copyWith(position: position));
    });
  }

  Future<void> _setSource({required String assetName}) async {
    final duration = await _audioPlayer.setAsset(assetName);
    set(peek().copyWith(duration: duration));
  }

  @override
  Future<void> play({required String assetName}) async {
    await _setSource(assetName: assetName);
    _audioPlayer.play();
  }

  @override
  Future<void> resume() async {
    _audioPlayer.play();
  }

  @override
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  @override
  Future<void> stop() async {
    await _audioPlayer.stop();
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
    if (playerState.processingState == ProcessingState.ready) {
      if (playerState.playing) {
        return AudioPlayerState.playing;
      } else {
        return AudioPlayerState.paused;
      }
    } else if (playerState.processingState == ProcessingState.completed) {
      return AudioPlayerState.completed;
    } else if (playerState.processingState == ProcessingState.idle) {
      return AudioPlayerState.stopped;
    }
    return AudioPlayerState.disposed;
  }
}
