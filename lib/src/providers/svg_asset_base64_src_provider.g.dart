// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'svg_asset_base64_src_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$svgAssetBase64SrcProviderHash() =>
    r'8ae96956bfc12ab7c8f02d30197d162911ae453b';

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

abstract class _$SvgAssetBase64SrcProvider
    extends BuildlessAutoDisposeAsyncNotifier<String> {
  late final String svgAsset;

  FutureOr<String> build({
    required String svgAsset,
  });
}

/// See also [SvgAssetBase64SrcProvider].
@ProviderFor(SvgAssetBase64SrcProvider)
const svgAssetBase64SrcProvider = SvgAssetBase64SrcProviderFamily();

/// See also [SvgAssetBase64SrcProvider].
class SvgAssetBase64SrcProviderFamily extends Family<AsyncValue<String>> {
  /// See also [SvgAssetBase64SrcProvider].
  const SvgAssetBase64SrcProviderFamily();

  /// See also [SvgAssetBase64SrcProvider].
  SvgAssetBase64SrcProviderProvider call({
    required String svgAsset,
  }) {
    return SvgAssetBase64SrcProviderProvider(
      svgAsset: svgAsset,
    );
  }

  @override
  SvgAssetBase64SrcProviderProvider getProviderOverride(
    covariant SvgAssetBase64SrcProviderProvider provider,
  ) {
    return call(
      svgAsset: provider.svgAsset,
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
  String? get name => r'svgAssetBase64SrcProvider';
}

/// See also [SvgAssetBase64SrcProvider].
class SvgAssetBase64SrcProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SvgAssetBase64SrcProvider,
        String> {
  /// See also [SvgAssetBase64SrcProvider].
  SvgAssetBase64SrcProviderProvider({
    required String svgAsset,
  }) : this._internal(
          () => SvgAssetBase64SrcProvider()..svgAsset = svgAsset,
          from: svgAssetBase64SrcProvider,
          name: r'svgAssetBase64SrcProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$svgAssetBase64SrcProviderHash,
          dependencies: SvgAssetBase64SrcProviderFamily._dependencies,
          allTransitiveDependencies:
              SvgAssetBase64SrcProviderFamily._allTransitiveDependencies,
          svgAsset: svgAsset,
        );

  SvgAssetBase64SrcProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.svgAsset,
  }) : super.internal();

  final String svgAsset;

  @override
  FutureOr<String> runNotifierBuild(
    covariant SvgAssetBase64SrcProvider notifier,
  ) {
    return notifier.build(
      svgAsset: svgAsset,
    );
  }

  @override
  Override overrideWith(SvgAssetBase64SrcProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: SvgAssetBase64SrcProviderProvider._internal(
        () => create()..svgAsset = svgAsset,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        svgAsset: svgAsset,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SvgAssetBase64SrcProvider, String>
      createElement() {
    return _SvgAssetBase64SrcProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SvgAssetBase64SrcProviderProvider &&
        other.svgAsset == svgAsset;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, svgAsset.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SvgAssetBase64SrcProviderRef
    on AutoDisposeAsyncNotifierProviderRef<String> {
  /// The parameter `svgAsset` of this provider.
  String get svgAsset;
}

class _SvgAssetBase64SrcProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SvgAssetBase64SrcProvider,
        String> with SvgAssetBase64SrcProviderRef {
  _SvgAssetBase64SrcProviderProviderElement(super.provider);

  @override
  String get svgAsset => (origin as SvgAssetBase64SrcProviderProvider).svgAsset;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
