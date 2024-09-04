// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'runtime_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RuntimeInfo {
  AppLifecycleState get appLifecycleState => throw _privateConstructorUsedError;
  Brightness get brightness => throw _privateConstructorUsedError;
  BoxConstraints get displayConstraints => throw _privateConstructorUsedError;
  DisplayWidthMode get displayWidthMode => throw _privateConstructorUsedError;
  Locale get locale => throw _privateConstructorUsedError;
  double get textScaleFactor => throw _privateConstructorUsedError;

  /// Create a copy of RuntimeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RuntimeInfoCopyWith<RuntimeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuntimeInfoCopyWith<$Res> {
  factory $RuntimeInfoCopyWith(
          RuntimeInfo value, $Res Function(RuntimeInfo) then) =
      _$RuntimeInfoCopyWithImpl<$Res, RuntimeInfo>;
  @useResult
  $Res call(
      {AppLifecycleState appLifecycleState,
      Brightness brightness,
      BoxConstraints displayConstraints,
      DisplayWidthMode displayWidthMode,
      Locale locale,
      double textScaleFactor});
}

/// @nodoc
class _$RuntimeInfoCopyWithImpl<$Res, $Val extends RuntimeInfo>
    implements $RuntimeInfoCopyWith<$Res> {
  _$RuntimeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RuntimeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appLifecycleState = null,
    Object? brightness = null,
    Object? displayConstraints = null,
    Object? displayWidthMode = null,
    Object? locale = null,
    Object? textScaleFactor = null,
  }) {
    return _then(_value.copyWith(
      appLifecycleState: null == appLifecycleState
          ? _value.appLifecycleState
          : appLifecycleState // ignore: cast_nullable_to_non_nullable
              as AppLifecycleState,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
      displayConstraints: null == displayConstraints
          ? _value.displayConstraints
          : displayConstraints // ignore: cast_nullable_to_non_nullable
              as BoxConstraints,
      displayWidthMode: null == displayWidthMode
          ? _value.displayWidthMode
          : displayWidthMode // ignore: cast_nullable_to_non_nullable
              as DisplayWidthMode,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      textScaleFactor: null == textScaleFactor
          ? _value.textScaleFactor
          : textScaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RuntimeInfoImplCopyWith<$Res>
    implements $RuntimeInfoCopyWith<$Res> {
  factory _$$RuntimeInfoImplCopyWith(
          _$RuntimeInfoImpl value, $Res Function(_$RuntimeInfoImpl) then) =
      __$$RuntimeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppLifecycleState appLifecycleState,
      Brightness brightness,
      BoxConstraints displayConstraints,
      DisplayWidthMode displayWidthMode,
      Locale locale,
      double textScaleFactor});
}

/// @nodoc
class __$$RuntimeInfoImplCopyWithImpl<$Res>
    extends _$RuntimeInfoCopyWithImpl<$Res, _$RuntimeInfoImpl>
    implements _$$RuntimeInfoImplCopyWith<$Res> {
  __$$RuntimeInfoImplCopyWithImpl(
      _$RuntimeInfoImpl _value, $Res Function(_$RuntimeInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuntimeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appLifecycleState = null,
    Object? brightness = null,
    Object? displayConstraints = null,
    Object? displayWidthMode = null,
    Object? locale = null,
    Object? textScaleFactor = null,
  }) {
    return _then(_$RuntimeInfoImpl(
      appLifecycleState: null == appLifecycleState
          ? _value.appLifecycleState
          : appLifecycleState // ignore: cast_nullable_to_non_nullable
              as AppLifecycleState,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
      displayConstraints: null == displayConstraints
          ? _value.displayConstraints
          : displayConstraints // ignore: cast_nullable_to_non_nullable
              as BoxConstraints,
      displayWidthMode: null == displayWidthMode
          ? _value.displayWidthMode
          : displayWidthMode // ignore: cast_nullable_to_non_nullable
              as DisplayWidthMode,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      textScaleFactor: null == textScaleFactor
          ? _value.textScaleFactor
          : textScaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RuntimeInfoImpl extends _RuntimeInfo {
  const _$RuntimeInfoImpl(
      {required this.appLifecycleState,
      required this.brightness,
      required this.displayConstraints,
      required this.displayWidthMode,
      required this.locale,
      required this.textScaleFactor})
      : super._();

  @override
  final AppLifecycleState appLifecycleState;
  @override
  final Brightness brightness;
  @override
  final BoxConstraints displayConstraints;
  @override
  final DisplayWidthMode displayWidthMode;
  @override
  final Locale locale;
  @override
  final double textScaleFactor;

  @override
  String toString() {
    return 'RuntimeInfo(appLifecycleState: $appLifecycleState, brightness: $brightness, displayConstraints: $displayConstraints, displayWidthMode: $displayWidthMode, locale: $locale, textScaleFactor: $textScaleFactor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuntimeInfoImpl &&
            (identical(other.appLifecycleState, appLifecycleState) ||
                other.appLifecycleState == appLifecycleState) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness) &&
            (identical(other.displayConstraints, displayConstraints) ||
                other.displayConstraints == displayConstraints) &&
            (identical(other.displayWidthMode, displayWidthMode) ||
                other.displayWidthMode == displayWidthMode) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.textScaleFactor, textScaleFactor) ||
                other.textScaleFactor == textScaleFactor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appLifecycleState, brightness,
      displayConstraints, displayWidthMode, locale, textScaleFactor);

  /// Create a copy of RuntimeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuntimeInfoImplCopyWith<_$RuntimeInfoImpl> get copyWith =>
      __$$RuntimeInfoImplCopyWithImpl<_$RuntimeInfoImpl>(this, _$identity);
}

abstract class _RuntimeInfo extends RuntimeInfo {
  const factory _RuntimeInfo(
      {required final AppLifecycleState appLifecycleState,
      required final Brightness brightness,
      required final BoxConstraints displayConstraints,
      required final DisplayWidthMode displayWidthMode,
      required final Locale locale,
      required final double textScaleFactor}) = _$RuntimeInfoImpl;
  const _RuntimeInfo._() : super._();

  @override
  AppLifecycleState get appLifecycleState;
  @override
  Brightness get brightness;
  @override
  BoxConstraints get displayConstraints;
  @override
  DisplayWidthMode get displayWidthMode;
  @override
  Locale get locale;
  @override
  double get textScaleFactor;

  /// Create a copy of RuntimeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuntimeInfoImplCopyWith<_$RuntimeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
