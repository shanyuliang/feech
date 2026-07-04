import 'dart:async';
import 'dart:developer' as develop;

import 'package:flutter/foundation.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../models/audio_playback_state.dart';
import '../models/audio_player_state.dart';
import 'audio_playback_signal.dart';

class AudioPlaybackSoLoudSignal extends AudioPlaybackSignal {
  final _soLoud = SoLoud.instance;
  late AudioSource _audioSource;
  late SoundHandle _soundHandle;
  Timer? _timer;

  AudioPlaybackSoLoudSignal() : super(const AudioPlaybackState(), options: const SignalOptions(name: 'AudioPlaybackSoLoudSignal'));

  void _startTrackingPosition() {
    set(peek().copyWith(duration: _soLoud.getLength(_audioSource)));
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      final isPlaying = _soLoud.getIsValidVoiceHandle(_soundHandle);
      final isPaused = _soLoud.getPause(_soundHandle);
      final playerState = isPlaying ? (isPaused ? AudioPlayerState.paused : AudioPlayerState.playing) : AudioPlayerState.stopped;
      final position = _soLoud.getPosition(_soundHandle);
      set(peek().copyWith(playerState: playerState, position: position));
      if (!isPlaying) {
        timer.cancel();
      }
    });
  }

  Future<void> _setSource({required String assetName}) async {
    try {
      await _soLoud.init();
      await _soLoud.disposeAllSources();
      _audioSource = await _soLoud.loadAsset(assetName);
    } catch (ex) {
      develop.log(ex.toString());
    }
  }

  @override
  Future<void> play({required String assetName}) async {
    debugPrint("AudioPlaybackSoLoudSignal play $assetName");
    await _setSource(assetName: assetName);
    _soundHandle = _soLoud.play(_audioSource);
    _startTrackingPosition();
  }

  @override
  Future<void> resume() async {
    _soLoud.setPause(_soundHandle, false);
  }

  @override
  Future<void> pause() async {
    _soLoud.setPause(_soundHandle, true);
  }

  @override
  Future<void> stop() async {
    await _soLoud.stop(_soundHandle);
  }

  @override
  void rememberPlayerStateWhenAppPaused() {
    value = value.copyWith(playerStateWhenAppPaused: value.playerState);
  }

  @override
  void clearPlayerStateWhenAppPaused() {
    value = value.copyWith(playerStateWhenAppPaused: null);
  }
}
