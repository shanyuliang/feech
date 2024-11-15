import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

extension PaletteGeneratorExtension on PaletteGenerator {
  List<Color> toGradientColors({int maxColor = 5}) {
    paletteColors.sort((PaletteColor a, PaletteColor b) {
      return b.population.compareTo(a.population);
    });
    switch (paletteColors.length) {
      case 0:
        return [Colors.transparent, Colors.transparent];
      case 1:
        return [paletteColors[0].color, paletteColors[0].color];
      default:
        return [
          ...paletteColors.map((e) => e.color).take(maxColor),
        ];
    }
  }
}
