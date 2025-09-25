import 'package:flutter/widgets.dart';

extension BoxFitExtension on BoxFit {
  String toShortString() => switch (this) {
    BoxFit.fill => "fill",
    BoxFit.contain => "contain",
    BoxFit.cover => "cover",
    BoxFit.fitWidth => "fitWidth",
    BoxFit.fitHeight => "fitHeight",
    BoxFit.scaleDown => "scaleDown",
    BoxFit.none => "none",
  };
}
