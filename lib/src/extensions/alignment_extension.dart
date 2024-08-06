import 'package:flutter/widgets.dart';

extension AlignmentExtension on Alignment {
  String toShortString() => toString().replaceFirst("Alignment.", "");
}
