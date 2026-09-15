import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../models/display_width_mode.dart';

extension NumExtension on num {
  static final formatAUDFullDefault = NumberFormat.currency(locale: 'en_AU', name: 'AUD', symbol: r"$");
  static final formatAUDFullSimple = NumberFormat(r'$0.00', 'en_AU');
  static final formatAUDNoDecimalDefault = NumberFormat.currency(locale: 'en_AU', name: 'AUD', symbol: r"$", decimalDigits: 0);
  static final formatAUDNoDecimalSimple = NumberFormat(r'$0', 'en_AU');

  String formatToAUDFullDefault() {
    return formatAUDFullDefault.format(this);
  }

  String formatToAUDFullSimple() {
    return formatAUDFullSimple.format(this);
  }

  String formatToAUDNoDecimalWithRoundingDefault() {
    return formatAUDNoDecimalDefault.format(this);
  }

  String formatToAUDNoDecimalNoRoundingDefault() {
    return formatAUDNoDecimalDefault.format(truncateToDouble());
  }

  String formatToAUDNoDecimalWithRoundingSimple() {
    return formatAUDNoDecimalSimple.format(this);
  }

  String formatToAUDNoDecimalNoRoundingSimple() {
    return formatAUDNoDecimalSimple.format(truncateToDouble());
  }

  String formatToAUDOnlyDecimal() {
    final cents = ((abs() * 100).round() % 100).toString().padLeft(2, '0');
    return '.$cents';
  }

  String readableDataSize({int baseSize = 1024}) {
    final kbSize = baseSize;
    final mbSize = kbSize * baseSize;
    final gbSize = mbSize * baseSize;
    final tbSize = gbSize * baseSize;
    final pbSize = tbSize * baseSize;
    final numberFormat = NumberFormat("###0.##");
    if (this >= pbSize) {
      return "${numberFormat.format(this / pbSize)} PB";
    } else if (this >= tbSize) {
      return "${numberFormat.format(this / tbSize)} TB";
    } else if (this >= gbSize) {
      return "${numberFormat.format(this / gbSize)} GB";
    } else if (this >= mbSize) {
      return "${numberFormat.format(this / mbSize)} MB";
    } else if (this >= kbSize) {
      return "${numberFormat.format(this / kbSize)} KB";
    } else {
      return "$this B";
    }
  }

  DateTime parseAsDTODateTime({required bool isUtc}) => DateTime.fromMillisecondsSinceEpoch(toInt(), isUtc: isUtc);

  double asSp(BuildContext context) => MediaQuery.of(context).textScaler.scale(toDouble());

  DisplayWidthMode asWidthToDisplayWidthMode() {
    for (final displayWidthMode in DisplayWidthMode.values.reversed) {
      if (this >= displayWidthMode.minWidth) {
        return displayWidthMode;
      }
    }
    return DisplayWidthMode.compact;
  }

  String toPercentageString({int decimalDigits = 0}) {
    return "${(this * 100).toStringAsFixed(decimalDigits)}%";
  }
}
