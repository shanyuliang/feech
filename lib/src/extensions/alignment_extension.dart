import 'package:flutter/widgets.dart';

extension AlignmentExtension on Alignment {
  String toShortString() => toString().replaceFirst("Alignment.", "");

  String toCSSPosition() => switch (this) {
        Alignment.topLeft => "left top",
        Alignment.topCenter => "center top",
        Alignment.topRight => "right top",
        Alignment.centerLeft => "left center",
        Alignment.center => "center center",
        Alignment.centerRight => "right center",
        Alignment.bottomLeft => "left bottom",
        Alignment.bottomCenter => "center bottom",
        Alignment.bottomRight => "right bottom",
        _ => "center center",
      };
}
