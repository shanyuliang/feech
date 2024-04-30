import 'package:freezed_annotation/freezed_annotation.dart';

import '../../support/logging/logging.dart';
import '../../support/state_status.dart';

part 'app_logging_state.freezed.dart';

@Freezed()
class AppLoggingState with _$AppLoggingState {
  const AppLoggingState._();

  const factory AppLoggingState({
    required final Logging logging,
    @Default(StateStatus.initial) final StateStatus stateStatus,
  }) = _AppLoggingState;
}
