import 'package:intl/intl.dart';

extension IntExtension on int {
  DateTime parseAsDTODateTime({required bool isUtc}) => DateTime.fromMillisecondsSinceEpoch(this, isUtc: isUtc);

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
}
