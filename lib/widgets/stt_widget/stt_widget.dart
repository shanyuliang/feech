import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'stt_provider.dart';

class SttWidget extends ConsumerStatefulWidget {
  final SpeechStatusListener? onStatus;
  final SpeechErrorListener? onError;
  final SpeechResultListener? onResult;

  const SttWidget({
    super.key,
    this.onStatus,
    this.onError,
    this.onResult,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SttWidgetState();
}

class _SttWidgetState extends ConsumerState<SttWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: const Duration(milliseconds: 300),
    );
    _colorTween = ColorTween(begin: Colors.green, end: Colors.redAccent).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) => IconButton(
        icon: const Icon(Icons.mic_outlined),
        color: _colorTween.value,
        onPressed: _onTapSttButton,
      ),
    );
  }

  Future<void> _onTapSttButton() async {
    final speech = SpeechToText();
    await speech.initialize(
      onStatus: (status) {
        debugPrint(status);
        widget.onStatus?.call(status);
        switch (status) {
          case SpeechToText.listeningStatus:
            _animationController.repeat(reverse: true);
          default:
            _animationController.reset();
        }
      },
      onError: (error) {
        debugPrint(error.toString());
        widget.onError?.call(error);
        _animationController.reset();
      },
    );
    if (speech.isAvailable) {
      if (speech.isNotListening) {
        speech.listen(onResult: widget.onResult, localeId: ref.watch(sttProvider).value?.selectedLocale?.localeId);
      } else {
        speech.stop();
      }
    } else {
      debugPrint("The user has denied the use of speech recognition.");
    }
  }
}
