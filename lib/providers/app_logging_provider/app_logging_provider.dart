import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../support/logging/consolidated_logging.dart';
import '../../support/logging/logging.dart';
import '../../support/state_status.dart';
import 'app_logging_state.dart';

part 'app_logging_provider.g.dart';

@Riverpod(keepAlive: true)
class AppLogging extends _$AppLogging {
  @override
  AppLoggingState build({required List<Logging> Function() actionLoggingList}) {
    Future(() {
      _initialise();
    });
    return AppLoggingState(logging: ConsolidatedLogging(actionLoggingList: actionLoggingList));
  }

  Future<void> _initialise() async {
    state = state.copyWith(stateStatus: StateStatus.updating);
    await state.logging.initialise();
    state = state.copyWith(stateStatus: StateStatus.updated);
  }
}
