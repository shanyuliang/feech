import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  String toShortString(BuildContext context) {
    final textTheme = TextTheme.of(context);
    if (this == textTheme.displayLarge) return "displayLarge";
    if (this == textTheme.displayMedium) return "displayMedium";
    if (this == textTheme.displaySmall) return "displaySmall";
    if (this == textTheme.headlineLarge) return "headlineLarge";
    if (this == textTheme.headlineMedium) return "headlineMedium";
    if (this == textTheme.headlineSmall) return "headlineSmall";
    if (this == textTheme.titleLarge) return "titleLarge";
    if (this == textTheme.titleMedium) return "titleMedium";
    if (this == textTheme.titleSmall) return "titleSmall";
    if (this == textTheme.bodyLarge) return "bodyLarge";
    if (this == textTheme.bodyMedium) return "bodyMedium";
    if (this == textTheme.bodySmall) return "bodySmall";
    if (this == textTheme.labelLarge) return "labelLarge";
    if (this == textTheme.labelMedium) return "labelMedium";
    if (this == textTheme.labelSmall) return "labelSmall";
    return "custom";
  }
}
