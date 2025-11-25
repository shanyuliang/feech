import 'package:freezed_annotation/freezed_annotation.dart';

import 'page_lifecycle_state.dart';

part 'page_parameter.freezed.dart';

@Freezed()
abstract class PageParameter with _$PageParameter {
  const PageParameter._();

  const factory PageParameter({
    required final String routeName,
    @Default(PageLifecycleState.detached) final PageLifecycleState initialLifecycleState,
    final String? initialTitle,
  }) = _PageParameter;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PageParameter && routeName == other.routeName;

  @override
  int get hashCode => routeName.hashCode;
}
