import 'package:freezed_annotation/freezed_annotation.dart';

import 'page_lifecycle_state.dart';

part 'page_lifecycle_state_signal_container_parameter.freezed.dart';

@Freezed()
abstract class PageLifecycleStateSignalContainerParameter with _$PageLifecycleStateSignalContainerParameter {
  const factory PageLifecycleStateSignalContainerParameter({
    final String? routeName,
    @Default(PageLifecycleState.detached) final PageLifecycleState initialLifecycleState,
  }) = _PageLifecycleStateSignalContainerParameter;
}
