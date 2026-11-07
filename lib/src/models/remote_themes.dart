import 'package:freezed_annotation/freezed_annotation.dart';

import 'remote_app_theme.dart';

part 'remote_themes.freezed.dart';

part 'remote_themes.g.dart';

@freezed
@JsonSerializable()
abstract class RemoteThemes({final int schemeVersion = 0, final int dataVersion = 0, final List<RemoteAppTheme>? appThemes})
    with _$RemoteThemes {
  factory RemoteThemes.fromJson(Map<String, dynamic> json) => _$RemoteThemesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteThemesToJson(this);
}
