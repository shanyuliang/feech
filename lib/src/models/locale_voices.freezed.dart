// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_voices.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocaleVoices {
  String get localeId => throw _privateConstructorUsedError;
  List<String> get voiceIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocaleVoicesCopyWith<LocaleVoices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleVoicesCopyWith<$Res> {
  factory $LocaleVoicesCopyWith(
          LocaleVoices value, $Res Function(LocaleVoices) then) =
      _$LocaleVoicesCopyWithImpl<$Res, LocaleVoices>;
  @useResult
  $Res call({String localeId, List<String> voiceIds});
}

/// @nodoc
class _$LocaleVoicesCopyWithImpl<$Res, $Val extends LocaleVoices>
    implements $LocaleVoicesCopyWith<$Res> {
  _$LocaleVoicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localeId = null,
    Object? voiceIds = null,
  }) {
    return _then(_value.copyWith(
      localeId: null == localeId
          ? _value.localeId
          : localeId // ignore: cast_nullable_to_non_nullable
              as String,
      voiceIds: null == voiceIds
          ? _value.voiceIds
          : voiceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocaleVoicesImplCopyWith<$Res>
    implements $LocaleVoicesCopyWith<$Res> {
  factory _$$LocaleVoicesImplCopyWith(
          _$LocaleVoicesImpl value, $Res Function(_$LocaleVoicesImpl) then) =
      __$$LocaleVoicesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String localeId, List<String> voiceIds});
}

/// @nodoc
class __$$LocaleVoicesImplCopyWithImpl<$Res>
    extends _$LocaleVoicesCopyWithImpl<$Res, _$LocaleVoicesImpl>
    implements _$$LocaleVoicesImplCopyWith<$Res> {
  __$$LocaleVoicesImplCopyWithImpl(
      _$LocaleVoicesImpl _value, $Res Function(_$LocaleVoicesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localeId = null,
    Object? voiceIds = null,
  }) {
    return _then(_$LocaleVoicesImpl(
      localeId: null == localeId
          ? _value.localeId
          : localeId // ignore: cast_nullable_to_non_nullable
              as String,
      voiceIds: null == voiceIds
          ? _value.voiceIds
          : voiceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$LocaleVoicesImpl extends _LocaleVoices {
  const _$LocaleVoicesImpl({required this.localeId, required this.voiceIds})
      : super._();

  @override
  final String localeId;
  @override
  final List<String> voiceIds;

  @override
  String toString() {
    return 'LocaleVoices(localeId: $localeId, voiceIds: $voiceIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocaleVoicesImpl &&
            (identical(other.localeId, localeId) ||
                other.localeId == localeId) &&
            const DeepCollectionEquality().equals(other.voiceIds, voiceIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, localeId, const DeepCollectionEquality().hash(voiceIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocaleVoicesImplCopyWith<_$LocaleVoicesImpl> get copyWith =>
      __$$LocaleVoicesImplCopyWithImpl<_$LocaleVoicesImpl>(this, _$identity);
}

abstract class _LocaleVoices extends LocaleVoices {
  const factory _LocaleVoices(
      {required final String localeId,
      required final List<String> voiceIds}) = _$LocaleVoicesImpl;
  const _LocaleVoices._() : super._();

  @override
  String get localeId;
  @override
  List<String> get voiceIds;
  @override
  @JsonKey(ignore: true)
  _$$LocaleVoicesImplCopyWith<_$LocaleVoicesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
