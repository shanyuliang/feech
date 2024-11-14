import 'package:flutter/widgets.dart';

extension BoxFitExtension on BoxFit {
  String toShortString() => toString().replaceFirst("BoxFit.", "");
}
