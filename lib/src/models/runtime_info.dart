import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'display_width_mode.dart';

part 'runtime_info.freezed.dart';

@Freezed()
abstract class RuntimeInfo with _$RuntimeInfo {
  const factory RuntimeInfo({
    required final AppLifecycleState appLifecycleState,
    required final Brightness brightness,
    required final BoxConstraints displayConstraints,
    required final DisplayWidthMode displayWidthMode,
    required final Locale locale,
    required final double textScaleFactor,
  }) = _RuntimeInfo;
}
