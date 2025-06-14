// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'svg_file_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$svgFileProviderHash() => r'ec7133742a96350e60416587c50f64e6025401f2';

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

abstract class _$SvgFileProvider
    extends BuildlessAutoDisposeStreamNotifier<(String, File?)> {
  late final AppCacheManager appCacheManager;
  late final String svgLink;
  late final Map<String, String>? headers;

  Stream<(String, File?)> build({
    required AppCacheManager appCacheManager,
    required String svgLink,
    Map<String, String>? headers,
  });
}

/// See also [SvgFileProvider].
@ProviderFor(SvgFileProvider)
const svgFileProvider = SvgFileProviderFamily();

/// See also [SvgFileProvider].
class SvgFileProviderFamily extends Family<AsyncValue<(String, File?)>> {
  /// See also [SvgFileProvider].
  const SvgFileProviderFamily();

  /// See also [SvgFileProvider].
  SvgFileProviderProvider call({
    required AppCacheManager appCacheManager,
    required String svgLink,
    Map<String, String>? headers,
  }) {
    return SvgFileProviderProvider(
      appCacheManager: appCacheManager,
      svgLink: svgLink,
      headers: headers,
    );
  }

  @override
  SvgFileProviderProvider getProviderOverride(
    covariant SvgFileProviderProvider provider,
  ) {
    return call(
      appCacheManager: provider.appCacheManager,
      svgLink: provider.svgLink,
      headers: provider.headers,
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
  String? get name => r'svgFileProvider';
}

/// See also [SvgFileProvider].
class SvgFileProviderProvider
    extends
        AutoDisposeStreamNotifierProviderImpl<
          SvgFileProvider,
          (String, File?)
        > {
  /// See also [SvgFileProvider].
  SvgFileProviderProvider({
    required AppCacheManager appCacheManager,
    required String svgLink,
    Map<String, String>? headers,
  }) : this._internal(
         () => SvgFileProvider()
           ..appCacheManager = appCacheManager
           ..svgLink = svgLink
           ..headers = headers,
         from: svgFileProvider,
         name: r'svgFileProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$svgFileProviderHash,
         dependencies: SvgFileProviderFamily._dependencies,
         allTransitiveDependencies:
             SvgFileProviderFamily._allTransitiveDependencies,
         appCacheManager: appCacheManager,
         svgLink: svgLink,
         headers: headers,
       );

  SvgFileProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appCacheManager,
    required this.svgLink,
    required this.headers,
  }) : super.internal();

  final AppCacheManager appCacheManager;
  final String svgLink;
  final Map<String, String>? headers;

  @override
  Stream<(String, File?)> runNotifierBuild(covariant SvgFileProvider notifier) {
    return notifier.build(
      appCacheManager: appCacheManager,
      svgLink: svgLink,
      headers: headers,
    );
  }

  @override
  Override overrideWith(SvgFileProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: SvgFileProviderProvider._internal(
        () => create()
          ..appCacheManager = appCacheManager
          ..svgLink = svgLink
          ..headers = headers,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appCacheManager: appCacheManager,
        svgLink: svgLink,
        headers: headers,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<SvgFileProvider, (String, File?)>
  createElement() {
    return _SvgFileProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SvgFileProviderProvider &&
        other.appCacheManager == appCacheManager &&
        other.svgLink == svgLink &&
        other.headers == headers;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appCacheManager.hashCode);
    hash = _SystemHash.combine(hash, svgLink.hashCode);
    hash = _SystemHash.combine(hash, headers.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SvgFileProviderRef
    on AutoDisposeStreamNotifierProviderRef<(String, File?)> {
  /// The parameter `appCacheManager` of this provider.
  AppCacheManager get appCacheManager;

  /// The parameter `svgLink` of this provider.
  String get svgLink;

  /// The parameter `headers` of this provider.
  Map<String, String>? get headers;
}

class _SvgFileProviderProviderElement
    extends
        AutoDisposeStreamNotifierProviderElement<
          SvgFileProvider,
          (String, File?)
        >
    with SvgFileProviderRef {
  _SvgFileProviderProviderElement(super.provider);

  @override
  AppCacheManager get appCacheManager =>
      (origin as SvgFileProviderProvider).appCacheManager;
  @override
  String get svgLink => (origin as SvgFileProviderProvider).svgLink;
  @override
  Map<String, String>? get headers =>
      (origin as SvgFileProviderProvider).headers;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
