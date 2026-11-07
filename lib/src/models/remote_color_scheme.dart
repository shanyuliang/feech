import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../support/json_converters.dart';
import 'effective_evaluation.dart';

part 'remote_color_scheme.freezed.dart';

part 'remote_color_scheme.g.dart';

@freezed
@JsonSerializable()
class const RemoteColorScheme({
  @BrightnessStringConverter() final Brightness brightness = Brightness.light,
  @ColorStringConverter() required final Color primary,
  @ColorStringConverter() required final Color onPrimary,
  @ColorStringConverter() required final Color secondary,
  @ColorStringConverter() required final Color onSecondary,
  @ColorStringConverter() required final Color surface,
  @ColorStringConverter() required final Color onSurface,
  @ColorStringConverter() required final Color error,
  @ColorStringConverter() required final Color onError,
}) with _$RemoteColorScheme {
  factory RemoteColorScheme.fromJson(Map<String, dynamic> json) => _$RemoteColorSchemeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteColorSchemeToJson(this);
}
