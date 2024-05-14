import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'page_lifecycle_state.dart';

part 'page_lifecycle_state_provider.g.dart';

@Riverpod()
class PageLifecycleStateProvider extends _$PageLifecycleStateProvider {
  @override
  PageLifecycleState build(String? routeName) {
    return PageLifecycleState.resumed;
  }

  void setState(PageLifecycleState pageLifecycleState) {
    state = pageLifecycleState;
  }
}
