import 'package:flutter/widgets.dart';

extension IterableExtension on Iterable {
  Iterable<Widget> separator(Widget separatorWidget) sync* {
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield separatorWidget;
        yield iterator.current;
      }
    }
  }
}
