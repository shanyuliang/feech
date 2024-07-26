// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_asset_manifest_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appAssetManifestProviderHash() =>
    r'8df25de0287be2f72d34490d6d636f14aaa56037';

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

abstract class _$AppAssetManifestProvider
    extends BuildlessAsyncNotifier<AssetManifest> {
  late final bool debugLogDiagnostics;

  FutureOr<AssetManifest> build({
    bool debugLogDiagnostics = false,
  });
}

/// See also [AppAssetManifestProvider].
@ProviderFor(AppAssetManifestProvider)
const appAssetManifestProvider = AppAssetManifestProviderFamily();

/// See also [AppAssetManifestProvider].
class AppAssetManifestProviderFamily extends Family<AsyncValue<AssetManifest>> {
  /// See also [AppAssetManifestProvider].
  const AppAssetManifestProviderFamily();

  /// See also [AppAssetManifestProvider].
  AppAssetManifestProviderProvider call({
    bool debugLogDiagnostics = false,
  }) {
    return AppAssetManifestProviderProvider(
      debugLogDiagnostics: debugLogDiagnostics,
    );
  }

  @override
  AppAssetManifestProviderProvider getProviderOverride(
    covariant AppAssetManifestProviderProvider provider,
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
  String? get name => r'appAssetManifestProvider';
}

/// See also [AppAssetManifestProvider].
class AppAssetManifestProviderProvider
    extends AsyncNotifierProviderImpl<AppAssetManifestProvider, AssetManifest> {
  /// See also [AppAssetManifestProvider].
  AppAssetManifestProviderProvider({
    bool debugLogDiagnostics = false,
  }) : this._internal(
          () => AppAssetManifestProvider()
            ..debugLogDiagnostics = debugLogDiagnostics,
          from: appAssetManifestProvider,
          name: r'appAssetManifestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appAssetManifestProviderHash,
          dependencies: AppAssetManifestProviderFamily._dependencies,
          allTransitiveDependencies:
              AppAssetManifestProviderFamily._allTransitiveDependencies,
          debugLogDiagnostics: debugLogDiagnostics,
        );

  AppAssetManifestProviderProvider._internal(
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
    covariant AppAssetManifestProvider notifier,
  ) {
    return notifier.build(
      debugLogDiagnostics: debugLogDiagnostics,
    );
  }

  @override
  Override overrideWith(AppAssetManifestProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppAssetManifestProviderProvider._internal(
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
  AsyncNotifierProviderElement<AppAssetManifestProvider, AssetManifest>
      createElement() {
    return _AppAssetManifestProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppAssetManifestProviderProvider &&
        other.debugLogDiagnostics == debugLogDiagnostics;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, debugLogDiagnostics.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppAssetManifestProviderRef on AsyncNotifierProviderRef<AssetManifest> {
  /// The parameter `debugLogDiagnostics` of this provider.
  bool get debugLogDiagnostics;
}

class _AppAssetManifestProviderProviderElement
    extends AsyncNotifierProviderElement<AppAssetManifestProvider,
        AssetManifest> with AppAssetManifestProviderRef {
  _AppAssetManifestProviderProviderElement(super.provider);

  @override
  bool get debugLogDiagnostics =>
      (origin as AppAssetManifestProviderProvider).debugLogDiagnostics;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
