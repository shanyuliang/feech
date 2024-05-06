import 'package:flutter/widgets.dart';

extension CharactersExtension on Characters {
  String getHexCode({String divider = " "}) {
    return toList().map((e) => e.codeUnits.map((e) => "\\u${e.toRadixString(16).toUpperCase()}").join()).join(divider);
  }
}
