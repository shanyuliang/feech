import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  final int durationInMilliseconds;
  final DebouncingMode debouncingMode;
  final VoidCallback? onWarmedUpActionCalled;
  final VoidCallback? onCoolDownDurationPassed;
  Timer? _timer;

  Debouncer({
    required this.durationInMilliseconds,
    required this.debouncingMode,
    this.onWarmedUpActionCalled,
    this.onCoolDownDurationPassed,
  });

  run(VoidCallback action) {
    if (debouncingMode == DebouncingMode.warmUp) {
      _timer?.cancel();
      _timer = Timer(Duration(milliseconds: durationInMilliseconds), () {
        action.call();
        onWarmedUpActionCalled?.call();
      });
    } else {
      final timerActive = _timer?.isActive ?? false;
      if (!timerActive) {
        action.call();
        _timer = Timer(Duration(milliseconds: durationInMilliseconds), () {
          onCoolDownDurationPassed?.call();
        });
      }
    }
  }
}

enum DebouncingMode {
  // Run the action after [DURATION] delay. New coming action will cancel previous not-yet-run action.
  warmUp,
  // Run the action immediately if there is no previous action run in last [DURATION], otherwise the action is cancelled.
  coolDown;
}
