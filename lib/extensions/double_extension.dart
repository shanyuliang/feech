import 'package:flutter/widgets.dart';

extension DoubleExtension on double {
  double asSp(BuildContext context) => MediaQuery.of(context).textScaler.scale(this);
}
