// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_lifecycle_state_provider_web.dart';

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
    r'ce75074440924ed4182c2c3a783aad84c8f4d9a1';

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
