// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Stt {
  List<AppLocale> get supportedLocales => throw _privateConstructorUsedError;
  AppLocale? get selectedLocale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SttCopyWith<Stt> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SttCopyWith<$Res> {
  factory $SttCopyWith(Stt value, $Res Function(Stt) then) =
      _$SttCopyWithImpl<$Res, Stt>;
  @useResult
  $Res call({List<AppLocale> supportedLocales, AppLocale? selectedLocale});

  $AppLocaleCopyWith<$Res>? get selectedLocale;
}

/// @nodoc
class _$SttCopyWithImpl<$Res, $Val extends Stt> implements $SttCopyWith<$Res> {
  _$SttCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supportedLocales = null,
    Object? selectedLocale = freezed,
  }) {
    return _then(_value.copyWith(
      supportedLocales: null == supportedLocales
          ? _value.supportedLocales
          : supportedLocales // ignore: cast_nullable_to_non_nullable
              as List<AppLocale>,
      selectedLocale: freezed == selectedLocale
          ? _value.selectedLocale
          : selectedLocale // ignore: cast_nullable_to_non_nullable
              as AppLocale?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppLocaleCopyWith<$Res>? get selectedLocale {
    if (_value.selectedLocale == null) {
      return null;
    }

    return $AppLocaleCopyWith<$Res>(_value.selectedLocale!, (value) {
      return _then(_value.copyWith(selectedLocale: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SttImplCopyWith<$Res> implements $SttCopyWith<$Res> {
  factory _$$SttImplCopyWith(_$SttImpl value, $Res Function(_$SttImpl) then) =
      __$$SttImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppLocale> supportedLocales, AppLocale? selectedLocale});

  @override
  $AppLocaleCopyWith<$Res>? get selectedLocale;
}

/// @nodoc
class __$$SttImplCopyWithImpl<$Res> extends _$SttCopyWithImpl<$Res, _$SttImpl>
    implements _$$SttImplCopyWith<$Res> {
  __$$SttImplCopyWithImpl(_$SttImpl _value, $Res Function(_$SttImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supportedLocales = null,
    Object? selectedLocale = freezed,
  }) {
    return _then(_$SttImpl(
      supportedLocales: null == supportedLocales
          ? _value._supportedLocales
          : supportedLocales // ignore: cast_nullable_to_non_nullable
              as List<AppLocale>,
      selectedLocale: freezed == selectedLocale
          ? _value.selectedLocale
          : selectedLocale // ignore: cast_nullable_to_non_nullable
              as AppLocale?,
    ));
  }
}

/// @nodoc

class _$SttImpl extends _Stt {
  const _$SttImpl(
      {required final List<AppLocale> supportedLocales,
      required this.selectedLocale})
      : _supportedLocales = supportedLocales,
        super._();

  final List<AppLocale> _supportedLocales;
  @override
  List<AppLocale> get supportedLocales {
    if (_supportedLocales is EqualUnmodifiableListView)
      return _supportedLocales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedLocales);
  }

  @override
  final AppLocale? selectedLocale;

  @override
  String toString() {
    return 'Stt(supportedLocales: $supportedLocales, selectedLocale: $selectedLocale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SttImpl &&
            const DeepCollectionEquality()
                .equals(other._supportedLocales, _supportedLocales) &&
            (identical(other.selectedLocale, selectedLocale) ||
                other.selectedLocale == selectedLocale));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_supportedLocales), selectedLocale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SttImplCopyWith<_$SttImpl> get copyWith =>
      __$$SttImplCopyWithImpl<_$SttImpl>(this, _$identity);
}

abstract class _Stt extends Stt {
  const factory _Stt(
      {required final List<AppLocale> supportedLocales,
      required final AppLocale? selectedLocale}) = _$SttImpl;
  const _Stt._() : super._();

  @override
  List<AppLocale> get supportedLocales;
  @override
  AppLocale? get selectedLocale;
  @override
  @JsonKey(ignore: true)
  _$$SttImplCopyWith<_$SttImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
