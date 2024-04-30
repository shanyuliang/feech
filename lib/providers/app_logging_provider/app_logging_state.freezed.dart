// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_logging_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppLoggingState {
  Logging get logging => throw _privateConstructorUsedError;
  StateStatus get stateStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppLoggingStateCopyWith<AppLoggingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLoggingStateCopyWith<$Res> {
  factory $AppLoggingStateCopyWith(
          AppLoggingState value, $Res Function(AppLoggingState) then) =
      _$AppLoggingStateCopyWithImpl<$Res, AppLoggingState>;
  @useResult
  $Res call({Logging logging, StateStatus stateStatus});
}

/// @nodoc
class _$AppLoggingStateCopyWithImpl<$Res, $Val extends AppLoggingState>
    implements $AppLoggingStateCopyWith<$Res> {
  _$AppLoggingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logging = null,
    Object? stateStatus = null,
  }) {
    return _then(_value.copyWith(
      logging: null == logging
          ? _value.logging
          : logging // ignore: cast_nullable_to_non_nullable
              as Logging,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppLoggingStateImplCopyWith<$Res>
    implements $AppLoggingStateCopyWith<$Res> {
  factory _$$AppLoggingStateImplCopyWith(_$AppLoggingStateImpl value,
          $Res Function(_$AppLoggingStateImpl) then) =
      __$$AppLoggingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Logging logging, StateStatus stateStatus});
}

/// @nodoc
class __$$AppLoggingStateImplCopyWithImpl<$Res>
    extends _$AppLoggingStateCopyWithImpl<$Res, _$AppLoggingStateImpl>
    implements _$$AppLoggingStateImplCopyWith<$Res> {
  __$$AppLoggingStateImplCopyWithImpl(
      _$AppLoggingStateImpl _value, $Res Function(_$AppLoggingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logging = null,
    Object? stateStatus = null,
  }) {
    return _then(_$AppLoggingStateImpl(
      logging: null == logging
          ? _value.logging
          : logging // ignore: cast_nullable_to_non_nullable
              as Logging,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ));
  }
}

/// @nodoc

class _$AppLoggingStateImpl extends _AppLoggingState {
  const _$AppLoggingStateImpl(
      {required this.logging, this.stateStatus = StateStatus.initial})
      : super._();

  @override
  final Logging logging;
  @override
  @JsonKey()
  final StateStatus stateStatus;

  @override
  String toString() {
    return 'AppLoggingState(logging: $logging, stateStatus: $stateStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLoggingStateImpl &&
            (identical(other.logging, logging) || other.logging == logging) &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, logging, stateStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLoggingStateImplCopyWith<_$AppLoggingStateImpl> get copyWith =>
      __$$AppLoggingStateImplCopyWithImpl<_$AppLoggingStateImpl>(
          this, _$identity);
}

abstract class _AppLoggingState extends AppLoggingState {
  const factory _AppLoggingState(
      {required final Logging logging,
      final StateStatus stateStatus}) = _$AppLoggingStateImpl;
  const _AppLoggingState._() : super._();

  @override
  Logging get logging;
  @override
  StateStatus get stateStatus;
  @override
  @JsonKey(ignore: true)
  _$$AppLoggingStateImplCopyWith<_$AppLoggingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
