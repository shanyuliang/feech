import 'package:freezed_annotation/freezed_annotation.dart';

import 'page_lifecycle_state.dart';

part 'page_parameter.freezed.dart';

@freezed
class const PageParameter({
  required final String routeName,
  final PageLifecycleState initialLifecycleState = PageLifecycleState.detached,
  final String? initialTitle,
}) with _$PageParameter {
  @override
  bool operator ==(Object other) => identical(this, other) || other is PageParameter && routeName == other.routeName;

  @override
  int get hashCode => routeName.hashCode;
}
