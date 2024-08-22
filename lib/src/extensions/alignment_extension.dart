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

  String toCSSMargin() => switch (this) {
    Alignment.topCenter => '''
                margin-left: auto;
                margin-right: auto;
                margin-top: 0;
                margin-bottom: auto;
    ''',
    Alignment.centerLeft => '''
                margin-left: 0;
                margin-right: auto;
                margin-top: auto;
                margin-bottom: auto;
    ''',
    Alignment.center => '''
                margin-left: auto;
                margin-right: auto;
                margin-top: auto;
                margin-bottom: auto;
    ''',
    Alignment.centerRight => '''
                margin-left: auto;
                margin-right: 0;
                margin-top: auto;
                margin-bottom: auto;
    ''',
    Alignment.bottomCenter => '''
                margin-left: auto;
                margin-right: auto;
                margin-top: auto;
                margin-bottom: 0;
    ''',
    _ => '''
                margin-left: auto;
                margin-right: auto;
                margin-top: auto;
                margin-bottom: auto;
    ''',
  };
}
