import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'display_width_mode.dart';

part 'runtime_info.freezed.dart';

@Freezed()
abstract class RuntimeInfo with _$RuntimeInfo {
  const factory RuntimeInfo({
    required AppLifecycleState appLifecycleState,
    required Brightness brightness,
    required BoxConstraints displayConstraints,
    required DisplayWidthMode displayWidthMode,
    required Locale locale,
    required double textScaleFactor,
  }) = _RuntimeInfo;
}
