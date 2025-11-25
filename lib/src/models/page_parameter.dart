import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_parameter.freezed.dart';

@Freezed()
abstract class PageParameter with _$PageParameter {
  const factory PageParameter({required final String routeName, final String? initialTitle}) = _PageParameter;
}
