// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Tts {
  FlutterTts get flutterTts => throw _privateConstructorUsedError;
  List<LocaleVoices> get allLocaleVoices => throw _privateConstructorUsedError;
  String? get selectedLocaleId => throw _privateConstructorUsedError;
  String? get selectedVoiceId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TtsCopyWith<Tts> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TtsCopyWith<$Res> {
  factory $TtsCopyWith(Tts value, $Res Function(Tts) then) =
      _$TtsCopyWithImpl<$Res, Tts>;
  @useResult
  $Res call(
      {FlutterTts flutterTts,
      List<LocaleVoices> allLocaleVoices,
      String? selectedLocaleId,
      String? selectedVoiceId});
}

/// @nodoc
class _$TtsCopyWithImpl<$Res, $Val extends Tts> implements $TtsCopyWith<$Res> {
  _$TtsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flutterTts = null,
    Object? allLocaleVoices = null,
    Object? selectedLocaleId = freezed,
    Object? selectedVoiceId = freezed,
  }) {
    return _then(_value.copyWith(
      flutterTts: null == flutterTts
          ? _value.flutterTts
          : flutterTts // ignore: cast_nullable_to_non_nullable
              as FlutterTts,
      allLocaleVoices: null == allLocaleVoices
          ? _value.allLocaleVoices
          : allLocaleVoices // ignore: cast_nullable_to_non_nullable
              as List<LocaleVoices>,
      selectedLocaleId: freezed == selectedLocaleId
          ? _value.selectedLocaleId
          : selectedLocaleId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedVoiceId: freezed == selectedVoiceId
          ? _value.selectedVoiceId
          : selectedVoiceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TtsImplCopyWith<$Res> implements $TtsCopyWith<$Res> {
  factory _$$TtsImplCopyWith(_$TtsImpl value, $Res Function(_$TtsImpl) then) =
      __$$TtsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FlutterTts flutterTts,
      List<LocaleVoices> allLocaleVoices,
      String? selectedLocaleId,
      String? selectedVoiceId});
}

/// @nodoc
class __$$TtsImplCopyWithImpl<$Res> extends _$TtsCopyWithImpl<$Res, _$TtsImpl>
    implements _$$TtsImplCopyWith<$Res> {
  __$$TtsImplCopyWithImpl(_$TtsImpl _value, $Res Function(_$TtsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flutterTts = null,
    Object? allLocaleVoices = null,
    Object? selectedLocaleId = freezed,
    Object? selectedVoiceId = freezed,
  }) {
    return _then(_$TtsImpl(
      flutterTts: null == flutterTts
          ? _value.flutterTts
          : flutterTts // ignore: cast_nullable_to_non_nullable
              as FlutterTts,
      allLocaleVoices: null == allLocaleVoices
          ? _value.allLocaleVoices
          : allLocaleVoices // ignore: cast_nullable_to_non_nullable
              as List<LocaleVoices>,
      selectedLocaleId: freezed == selectedLocaleId
          ? _value.selectedLocaleId
          : selectedLocaleId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedVoiceId: freezed == selectedVoiceId
          ? _value.selectedVoiceId
          : selectedVoiceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TtsImpl extends _Tts {
  const _$TtsImpl(
      {required this.flutterTts,
      required this.allLocaleVoices,
      required this.selectedLocaleId,
      required this.selectedVoiceId})
      : super._();

  @override
  final FlutterTts flutterTts;
  @override
  final List<LocaleVoices> allLocaleVoices;
  @override
  final String? selectedLocaleId;
  @override
  final String? selectedVoiceId;

  @override
  String toString() {
    return 'Tts(flutterTts: $flutterTts, allLocaleVoices: $allLocaleVoices, selectedLocaleId: $selectedLocaleId, selectedVoiceId: $selectedVoiceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TtsImpl &&
            (identical(other.flutterTts, flutterTts) ||
                other.flutterTts == flutterTts) &&
            const DeepCollectionEquality()
                .equals(other.allLocaleVoices, allLocaleVoices) &&
            (identical(other.selectedLocaleId, selectedLocaleId) ||
                other.selectedLocaleId == selectedLocaleId) &&
            (identical(other.selectedVoiceId, selectedVoiceId) ||
                other.selectedVoiceId == selectedVoiceId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      flutterTts,
      const DeepCollectionEquality().hash(allLocaleVoices),
      selectedLocaleId,
      selectedVoiceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TtsImplCopyWith<_$TtsImpl> get copyWith =>
      __$$TtsImplCopyWithImpl<_$TtsImpl>(this, _$identity);
}

abstract class _Tts extends Tts {
  const factory _Tts(
      {required final FlutterTts flutterTts,
      required final List<LocaleVoices> allLocaleVoices,
      required final String? selectedLocaleId,
      required final String? selectedVoiceId}) = _$TtsImpl;
  const _Tts._() : super._();

  @override
  FlutterTts get flutterTts;
  @override
  List<LocaleVoices> get allLocaleVoices;
  @override
  String? get selectedLocaleId;
  @override
  String? get selectedVoiceId;
  @override
  @JsonKey(ignore: true)
  _$$TtsImplCopyWith<_$TtsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
