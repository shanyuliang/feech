import 'package:flutter/foundation.dart';

import '../support/debouncer.dart';

extension VoidCallbackExtension on VoidCallback {
  static final Map<String, Debouncer> debouncerMap = {};

  void debounceWarmUp({required final String actionId, required final durationInMilliseconds}) {
    final debouncer = debouncerMap[actionId] ??
        Debouncer(
          durationInMilliseconds: durationInMilliseconds,
          debouncingMode: DebouncingMode.warmUp,
          onWarmedUpActionCalled: () {
            debouncerMap.remove(actionId);
          },
        );
    debouncerMap[actionId] = debouncer;
    debouncer.run(this);
  }

  void debounceCoolDown({required final String actionId, required final durationInMilliseconds}) {
    final debouncer = debouncerMap[actionId] ??
        Debouncer(
          durationInMilliseconds: durationInMilliseconds,
          debouncingMode: DebouncingMode.coolDown,
          onCoolDownDurationPassed: () {
            debouncerMap.remove(actionId);
          },
        );
    debouncerMap[actionId] = debouncer;
    debouncer.run(this);
  }
}
