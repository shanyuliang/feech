import 'package:signals_flutter/signals_flutter.dart';

import '../models/audio_playback_state.dart';

abstract class AudioPlaybackSignal extends Signal<AudioPlaybackState> {
  AudioPlaybackSignal(super.initialValue, {super.options});

  Future<void> play({required String assetName});

  Future<void> resume();

  Future<void> pause();

  Future<void> stop();

  void rememberPlayerStateWhenAppPaused();

  void clearPlayerStateWhenAppPaused();
}
