import 'package:flutter/widgets.dart';

extension BrightnessExtension on Brightness {
  String toShortString() => switch (this) {
    Brightness.light => "light",
    Brightness.dark => "dark",
  };
}
