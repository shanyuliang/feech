// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Stt {


/// Create a copy of Stt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SttCopyWith<Stt> get copyWith => _$SttCopyWithImpl<Stt>(this as Stt, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Stt;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Stt&&const DeepCollectionEquality().equals(other.supportedLocales, _this.supportedLocales)&&(identical(other.selectedLocale, _this.selectedLocale) || other.selectedLocale == _this.selectedLocale));
}


@override
int get hashCode {
  final _this = this as Stt;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.supportedLocales),_this.selectedLocale);
}

@override
String toString() {
  final _this = this as Stt;
  return 'Stt(supportedLocales: ${_this.supportedLocales}, selectedLocale: ${_this.selectedLocale})';
}


}

/// @nodoc
abstract mixin class $SttCopyWith<$Res>  {
  factory $SttCopyWith(Stt value, $Res Function(Stt) _then) = _$SttCopyWithImpl;
@useResult
$Res call({
 List<SttLocale> supportedLocales, SttLocale? selectedLocale
});


$SttLocaleCopyWith<$Res>? get selectedLocale;

}
/// @nodoc
class _$SttCopyWithImpl<$Res>
    implements $SttCopyWith<$Res> {
  _$SttCopyWithImpl(this._self, this._then);

  final Stt _self;
  final $Res Function(Stt) _then;

/// Create a copy of Stt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? supportedLocales = null,Object? selectedLocale = freezed,}) {
  return _then(Stt(
supportedLocales: null == supportedLocales ? _self.supportedLocales : supportedLocales // ignore: cast_nullable_to_non_nullable
as List<SttLocale>,selectedLocale: freezed == selectedLocale ? _self.selectedLocale : selectedLocale // ignore: cast_nullable_to_non_nullable
as SttLocale?,
  ));
}
/// Create a copy of Stt
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SttLocaleCopyWith<$Res>? get selectedLocale {
    if (_self.selectedLocale == null) {
    return null;
  }

  return $SttLocaleCopyWith<$Res>(_self.selectedLocale!, (value) {
    return _then(_self.copyWith(selectedLocale: value));
  });
}
}



// dart format on
