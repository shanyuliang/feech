// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runtime_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$runtimeInfoProviderHash() =>
    r'2168d63154ac59c26cba3b511203624c98e7e0d0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$RuntimeInfoProvider extends BuildlessNotifier<RuntimeInfo> {
  late final bool debugLogDiagnostics;

  RuntimeInfo build({
    bool debugLogDiagnostics = false,
  });
}

/// See also [RuntimeInfoProvider].
@ProviderFor(RuntimeInfoProvider)
const runtimeInfoProvider = RuntimeInfoProviderFamily();

/// See also [RuntimeInfoProvider].
class RuntimeInfoProviderFamily extends Family<RuntimeInfo> {
  /// See also [RuntimeInfoProvider].
  const RuntimeInfoProviderFamily();

  /// See also [RuntimeInfoProvider].
  RuntimeInfoProviderProvider call({
    bool debugLogDiagnostics = false,
  }) {
    return RuntimeInfoProviderProvider(
      debugLogDiagnostics: debugLogDiagnostics,
    );
  }

  @override
  RuntimeInfoProviderProvider getProviderOverride(
    covariant RuntimeInfoProviderProvider provider,
  ) {
    return call(
      debugLogDiagnostics: provider.debugLogDiagnostics,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'runtimeInfoProvider';
}

/// See also [RuntimeInfoProvider].
class RuntimeInfoProviderProvider
    extends NotifierProviderImpl<RuntimeInfoProvider, RuntimeInfo> {
  /// See also [RuntimeInfoProvider].
  RuntimeInfoProviderProvider({
    bool debugLogDiagnostics = false,
  }) : this._internal(
          () =>
              RuntimeInfoProvider()..debugLogDiagnostics = debugLogDiagnostics,
          from: runtimeInfoProvider,
          name: r'runtimeInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$runtimeInfoProviderHash,
          dependencies: RuntimeInfoProviderFamily._dependencies,
          allTransitiveDependencies:
              RuntimeInfoProviderFamily._allTransitiveDependencies,
          debugLogDiagnostics: debugLogDiagnostics,
        );

  RuntimeInfoProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.debugLogDiagnostics,
  }) : super.internal();

  final bool debugLogDiagnostics;

  @override
  RuntimeInfo runNotifierBuild(
    covariant RuntimeInfoProvider notifier,
  ) {
    return notifier.build(
      debugLogDiagnostics: debugLogDiagnostics,
    );
  }

  @override
  Override overrideWith(RuntimeInfoProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: RuntimeInfoProviderProvider._internal(
        () => create()..debugLogDiagnostics = debugLogDiagnostics,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        debugLogDiagnostics: debugLogDiagnostics,
      ),
    );
  }

  @override
  NotifierProviderElement<RuntimeInfoProvider, RuntimeInfo> createElement() {
    return _RuntimeInfoProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RuntimeInfoProviderProvider &&
        other.debugLogDiagnostics == debugLogDiagnostics;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, debugLogDiagnostics.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RuntimeInfoProviderRef on NotifierProviderRef<RuntimeInfo> {
  /// The parameter `debugLogDiagnostics` of this provider.
  bool get debugLogDiagnostics;
}

class _RuntimeInfoProviderProviderElement
    extends NotifierProviderElement<RuntimeInfoProvider, RuntimeInfo>
    with RuntimeInfoProviderRef {
  _RuntimeInfoProviderProviderElement(super.provider);

  @override
  bool get debugLogDiagnostics =>
      (origin as RuntimeInfoProviderProvider).debugLogDiagnostics;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
