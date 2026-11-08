import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../support/json_converter_ex.dart';
import 'remote_app_theme.dart';

part 'remote_themes.freezed.dart';

part 'remote_themes.g.dart';

@freezed
@JsonSerializable()
class const RemoteThemes({final int schemeVersion = 0, final int dataVersion = 0, final List<RemoteAppTheme> appThemes = const []})
    with _$RemoteThemes {
  factory RemoteThemes.fromJson(Map<String, dynamic> json) => _$RemoteThemesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteThemesToJson(this);

  static RemoteThemes? fromJsonString(String? json) => json != null ? RemoteThemes.fromJson(jsonDecode(json)) : null;

  static String? toJsonString(RemoteThemes? data) => data != null ? jsonEncode(data.toJson()) : null;

  static final JsonConverterEx<RemoteThemes, String> jsonProcessor = _Converter();
}

class _Converter extends JsonConverterEx<RemoteThemes, String> {
  @override
  RemoteThemes fromJson(String json) {
    return RemoteThemes.fromJsonString(json)!;
  }

  @override
  String toJson(RemoteThemes object) {
    return RemoteThemes.toJsonString(object)!;
  }
}
