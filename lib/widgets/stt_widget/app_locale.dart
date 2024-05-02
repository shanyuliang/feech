import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_locale.freezed.dart';

@Freezed()
class AppLocale with _$AppLocale {
  const factory AppLocale({
    required final String localeId,
    required final String localeName,
  }) = _AppLocale;

  const AppLocale._();

  @override
  String toString() {
    return localeName;
  }
}
