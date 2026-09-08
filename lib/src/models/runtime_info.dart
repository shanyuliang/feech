import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'display_width_mode.dart';

part 'runtime_info.freezed.dart';

@freezed
class const RuntimeInfo({
  required final AppLifecycleState? appLifecycleState,
  required final Brightness brightness,
  required final Locale locale,
  required final double textScaleFactor,
  required final double devicePixelRatio,
  required final Size physicalDisplaySize,
  required final Size logicalDisplaySize,
  required final DisplayWidthMode displayWidthMode,
}) with _$RuntimeInfo;
