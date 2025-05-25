// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'svg_string_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$svgStringProviderHash() => r'd684d4a6346625503b26536707420325bef1963d';

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

abstract class _$SvgStringProvider
    extends BuildlessAutoDisposeAsyncNotifier<String?> {
  late final String svgLink;
  late final Map<String, String>? headers;

  FutureOr<String?> build({
    required String svgLink,
    Map<String, String>? headers,
  });
}

/// See also [SvgStringProvider].
@ProviderFor(SvgStringProvider)
const svgStringProvider = SvgStringProviderFamily();

/// See also [SvgStringProvider].
class SvgStringProviderFamily extends Family<AsyncValue<String?>> {
  /// See also [SvgStringProvider].
  const SvgStringProviderFamily();

  /// See also [SvgStringProvider].
  SvgStringProviderProvider call({
    required String svgLink,
    Map<String, String>? headers,
  }) {
    return SvgStringProviderProvider(svgLink: svgLink, headers: headers);
  }

  @override
  SvgStringProviderProvider getProviderOverride(
    covariant SvgStringProviderProvider provider,
  ) {
    return call(svgLink: provider.svgLink, headers: provider.headers);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'svgStringProvider';
}

/// See also [SvgStringProvider].
class SvgStringProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SvgStringProvider, String?> {
  /// See also [SvgStringProvider].
  SvgStringProviderProvider({
    required String svgLink,
    Map<String, String>? headers,
  }) : this._internal(
         () => SvgStringProvider()
           ..svgLink = svgLink
           ..headers = headers,
         from: svgStringProvider,
         name: r'svgStringProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$svgStringProviderHash,
         dependencies: SvgStringProviderFamily._dependencies,
         allTransitiveDependencies:
             SvgStringProviderFamily._allTransitiveDependencies,
         svgLink: svgLink,
         headers: headers,
       );

  SvgStringProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.svgLink,
    required this.headers,
  }) : super.internal();

  final String svgLink;
  final Map<String, String>? headers;

  @override
  FutureOr<String?> runNotifierBuild(covariant SvgStringProvider notifier) {
    return notifier.build(svgLink: svgLink, headers: headers);
  }

  @override
  Override overrideWith(SvgStringProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: SvgStringProviderProvider._internal(
        () => create()
          ..svgLink = svgLink
          ..headers = headers,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        svgLink: svgLink,
        headers: headers,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SvgStringProvider, String?>
  createElement() {
    return _SvgStringProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SvgStringProviderProvider &&
        other.svgLink == svgLink &&
        other.headers == headers;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, svgLink.hashCode);
    hash = _SystemHash.combine(hash, headers.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SvgStringProviderRef on AutoDisposeAsyncNotifierProviderRef<String?> {
  /// The parameter `svgLink` of this provider.
  String get svgLink;

  /// The parameter `headers` of this provider.
  Map<String, String>? get headers;
}

class _SvgStringProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SvgStringProvider, String?>
    with SvgStringProviderRef {
  _SvgStringProviderProviderElement(super.provider);

  @override
  String get svgLink => (origin as SvgStringProviderProvider).svgLink;
  @override
  Map<String, String>? get headers =>
      (origin as SvgStringProviderProvider).headers;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
