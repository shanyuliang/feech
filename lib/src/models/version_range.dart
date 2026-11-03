import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version/version.dart';

import '../support/json_converters.dart';

part 'version_range.freezed.dart';

part 'version_range.g.dart';

@freezed
@JsonSerializable()
class const VersionRange({@VersionConverterNullable() final Version? from, @VersionConverterNullable() final Version? to}) with _$VersionRange {
  static final distantPastVersion = Version.parse("0.0.0");
  static final distantFutureVersion = Version.parse("99999.99999.99999");

  factory VersionRange.fromJson(Map<String, dynamic> json) => _$VersionRangeFromJson(json);

  Map<String, dynamic> toJson() => _$VersionRangeToJson(this);

  bool evaluate({required Version targetVersion}) {
    final compareFrom = from ?? distantPastVersion;
    final compareTo = to ?? distantFutureVersion;
    return targetVersion >= compareFrom && targetVersion <= compareTo;
  }

  @override
  String toString() {
    return 'VersionRange [$from ~ $to]';
  }
}
