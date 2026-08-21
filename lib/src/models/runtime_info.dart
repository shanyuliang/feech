import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'display_width_mode.dart';

part 'runtime_info.freezed.dart';

@Freezed()
abstract class RuntimeInfo with _$RuntimeInfo {
  const factory RuntimeInfo({
    required AppLifecycleState? appLifecycleState,
    required Brightness brightness,
    required Locale locale,
    required double textScaleFactor,
    required double devicePixelRatio,
    required Size physicalDisplaySize,
    required Size logicalDisplaySize,
    required DisplayWidthMode displayWidthMode,
  }) = _RuntimeInfo;
}
