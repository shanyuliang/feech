import 'package:freezed_annotation/freezed_annotation.dart';

import 'page_lifecycle_state.dart';

part 'page_parameter.freezed.dart';

@Freezed()
abstract class PageParameter with _$PageParameter {
  const factory PageParameter({
    required final String routeName,
    @Default(PageLifecycleState.detached) final PageLifecycleState initialLifecycleState,
    final String? initialTitle,
  }) = _PageParameter;
}
