// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_lifecycle_state_provider_native.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppLifecycleStateProvider)
const appLifecycleStateProvider = AppLifecycleStateProviderProvider._();

final class AppLifecycleStateProviderProvider
    extends $NotifierProvider<AppLifecycleStateProvider, AppLifecycleState> {
  const AppLifecycleStateProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLifecycleStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLifecycleStateProviderHash();

  @$internal
  @override
  AppLifecycleStateProvider create() => AppLifecycleStateProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLifecycleState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLifecycleState>(value),
    );
  }
}

String _$appLifecycleStateProviderHash() =>
    r'8889228a1c041c5b6e9e8fbeca95d7afb1da65c2';

abstract class _$AppLifecycleStateProvider
    extends $Notifier<AppLifecycleState> {
  AppLifecycleState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppLifecycleState, AppLifecycleState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppLifecycleState, AppLifecycleState>,
              AppLifecycleState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
