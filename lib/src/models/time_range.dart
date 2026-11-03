import 'package:freezed_annotation/freezed_annotation.dart';

import '../extensions/date_time_extension.dart';
import '../support/json_converters.dart';

part 'time_range.freezed.dart';

part 'time_range.g.dart';

@freezed
@JsonSerializable()
class const TimeRange({@DateTimeStringConverterNullable() final DateTime? from, @DateTimeStringConverterNullable() final DateTime? to})
    with _$TimeRange {
  static final distantPast = DateTime.parse('1978-02-23T00:00:00');
  static final distantFuture = DateTime.parse('2999-12-31T23:59:59');

  factory TimeRange.fromJson(Map<String, dynamic> json) => _$TimeRangeFromJson(json);

  Map<String, dynamic> toJson() => _$TimeRangeToJson(this);

  bool evaluate({DateTime? targetDateTime}) {
    final compareTargetDateTime = targetDateTime ?? DateTime.now();
    final compareFrom = from ?? distantPast;
    final compareTo = to ?? distantFuture;
    return (compareTargetDateTime.isAtSameMomentAs(compareFrom) || compareTargetDateTime.isAfter(compareFrom)) &&
        (compareTargetDateTime.isBefore(compareTo) || compareTargetDateTime.isAtSameMomentAs(compareTo));
  }

  @override
  String toString() {
    return 'TimeRange [${from?.formatToDTOString()} ~ ${to?.formatToDTOString()}]';
  }
}
