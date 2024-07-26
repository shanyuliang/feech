// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_manifest_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$assetManifestProviderHash() =>
    r'7694b89852c875d682feb821415158eae603f893';

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

abstract class _$AssetManifestProvider
    extends BuildlessAsyncNotifier<AssetManifest> {
  late final bool debugLogDiagnostics;

  FutureOr<AssetManifest> build({
    bool debugLogDiagnostics = false,
  });
}

/// See also [AssetManifestProvider].
@ProviderFor(AssetManifestProvider)
const assetManifestProvider = AssetManifestProviderFamily();

/// See also [AssetManifestProvider].
class AssetManifestProviderFamily extends Family<AsyncValue<AssetManifest>> {
  /// See also [AssetManifestProvider].
  const AssetManifestProviderFamily();

  /// See also [AssetManifestProvider].
  AssetManifestProviderProvider call({
    bool debugLogDiagnostics = false,
  }) {
    return AssetManifestProviderProvider(
      debugLogDiagnostics: debugLogDiagnostics,
    );
  }

  @override
  AssetManifestProviderProvider getProviderOverride(
    covariant AssetManifestProviderProvider provider,
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
  String? get name => r'assetManifestProvider';
}

/// See also [AssetManifestProvider].
class AssetManifestProviderProvider
    extends AsyncNotifierProviderImpl<AssetManifestProvider, AssetManifest> {
  /// See also [AssetManifestProvider].
  AssetManifestProviderProvider({
    bool debugLogDiagnostics = false,
  }) : this._internal(
          () => AssetManifestProvider()
            ..debugLogDiagnostics = debugLogDiagnostics,
          from: assetManifestProvider,
          name: r'assetManifestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$assetManifestProviderHash,
          dependencies: AssetManifestProviderFamily._dependencies,
          allTransitiveDependencies:
              AssetManifestProviderFamily._allTransitiveDependencies,
          debugLogDiagnostics: debugLogDiagnostics,
        );

  AssetManifestProviderProvider._internal(
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
  FutureOr<AssetManifest> runNotifierBuild(
    covariant AssetManifestProvider notifier,
  ) {
    return notifier.build(
      debugLogDiagnostics: debugLogDiagnostics,
    );
  }

  @override
  Override overrideWith(AssetManifestProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: AssetManifestProviderProvider._internal(
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
  AsyncNotifierProviderElement<AssetManifestProvider, AssetManifest>
      createElement() {
    return _AssetManifestProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AssetManifestProviderProvider &&
        other.debugLogDiagnostics == debugLogDiagnostics;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, debugLogDiagnostics.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AssetManifestProviderRef on AsyncNotifierProviderRef<AssetManifest> {
  /// The parameter `debugLogDiagnostics` of this provider.
  bool get debugLogDiagnostics;
}

class _AssetManifestProviderProviderElement
    extends AsyncNotifierProviderElement<AssetManifestProvider, AssetManifest>
    with AssetManifestProviderRef {
  _AssetManifestProviderProviderElement(super.provider);

  @override
  bool get debugLogDiagnostics =>
      (origin as AssetManifestProviderProvider).debugLogDiagnostics;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
