// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_locale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppLocale {
  String get localeId => throw _privateConstructorUsedError;
  String get localeName => throw _privateConstructorUsedError;

  /// Create a copy of AppLocale
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppLocaleCopyWith<AppLocale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLocaleCopyWith<$Res> {
  factory $AppLocaleCopyWith(AppLocale value, $Res Function(AppLocale) then) =
      _$AppLocaleCopyWithImpl<$Res, AppLocale>;
  @useResult
  $Res call({String localeId, String localeName});
}

/// @nodoc
class _$AppLocaleCopyWithImpl<$Res, $Val extends AppLocale>
    implements $AppLocaleCopyWith<$Res> {
  _$AppLocaleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppLocale
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localeId = null,
    Object? localeName = null,
  }) {
    return _then(_value.copyWith(
      localeId: null == localeId
          ? _value.localeId
          : localeId // ignore: cast_nullable_to_non_nullable
              as String,
      localeName: null == localeName
          ? _value.localeName
          : localeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppLocaleImplCopyWith<$Res>
    implements $AppLocaleCopyWith<$Res> {
  factory _$$AppLocaleImplCopyWith(
          _$AppLocaleImpl value, $Res Function(_$AppLocaleImpl) then) =
      __$$AppLocaleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String localeId, String localeName});
}

/// @nodoc
class __$$AppLocaleImplCopyWithImpl<$Res>
    extends _$AppLocaleCopyWithImpl<$Res, _$AppLocaleImpl>
    implements _$$AppLocaleImplCopyWith<$Res> {
  __$$AppLocaleImplCopyWithImpl(
      _$AppLocaleImpl _value, $Res Function(_$AppLocaleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppLocale
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localeId = null,
    Object? localeName = null,
  }) {
    return _then(_$AppLocaleImpl(
      localeId: null == localeId
          ? _value.localeId
          : localeId // ignore: cast_nullable_to_non_nullable
              as String,
      localeName: null == localeName
          ? _value.localeName
          : localeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppLocaleImpl extends _AppLocale {
  const _$AppLocaleImpl({required this.localeId, required this.localeName})
      : super._();

  @override
  final String localeId;
  @override
  final String localeName;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLocaleImpl &&
            (identical(other.localeId, localeId) ||
                other.localeId == localeId) &&
            (identical(other.localeName, localeName) ||
                other.localeName == localeName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localeId, localeName);

  /// Create a copy of AppLocale
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLocaleImplCopyWith<_$AppLocaleImpl> get copyWith =>
      __$$AppLocaleImplCopyWithImpl<_$AppLocaleImpl>(this, _$identity);
}

abstract class _AppLocale extends AppLocale {
  const factory _AppLocale(
      {required final String localeId,
      required final String localeName}) = _$AppLocaleImpl;
  const _AppLocale._() : super._();

  @override
  String get localeId;
  @override
  String get localeName;

  /// Create a copy of AppLocale
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppLocaleImplCopyWith<_$AppLocaleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
