// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runtime_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RuntimeInfoProvider)
const runtimeInfoProvider = RuntimeInfoProviderFamily._();

final class RuntimeInfoProviderProvider
    extends $NotifierProvider<RuntimeInfoProvider, RuntimeInfo> {
  const RuntimeInfoProviderProvider._({
    required RuntimeInfoProviderFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'runtimeInfoProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$runtimeInfoProviderHash();

  @override
  String toString() {
    return r'runtimeInfoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RuntimeInfoProvider create() => RuntimeInfoProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RuntimeInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RuntimeInfo>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RuntimeInfoProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$runtimeInfoProviderHash() =>
    r'475a5f7df04ffcaa7ff3081ee07e5608dbfb067c';

final class RuntimeInfoProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          RuntimeInfoProvider,
          RuntimeInfo,
          RuntimeInfo,
          RuntimeInfo,
          bool
        > {
  const RuntimeInfoProviderFamily._()
    : super(
        retry: null,
        name: r'runtimeInfoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  RuntimeInfoProviderProvider call({bool debugLogDiagnostics = false}) =>
      RuntimeInfoProviderProvider._(argument: debugLogDiagnostics, from: this);

  @override
  String toString() => r'runtimeInfoProvider';
}

abstract class _$RuntimeInfoProvider extends $Notifier<RuntimeInfo> {
  late final _$args = ref.$arg as bool;
  bool get debugLogDiagnostics => _$args;

  RuntimeInfo build({bool debugLogDiagnostics = false});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(debugLogDiagnostics: _$args);
    final ref = this.ref as $Ref<RuntimeInfo, RuntimeInfo>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RuntimeInfo, RuntimeInfo>,
              RuntimeInfo,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
