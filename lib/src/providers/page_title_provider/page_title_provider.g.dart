// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_title_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pageTitleProviderHash() => r'c7c672424f834480fb2313aea3eae48a539143b3';

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

abstract class _$PageTitleProvider
    extends BuildlessAutoDisposeNotifier<String> {
  late final String? routeName;

  String build(
    String? routeName,
  );
}

/// See also [PageTitleProvider].
@ProviderFor(PageTitleProvider)
const pageTitleProvider = PageTitleProviderFamily();

/// See also [PageTitleProvider].
class PageTitleProviderFamily extends Family<String> {
  /// See also [PageTitleProvider].
  const PageTitleProviderFamily();

  /// See also [PageTitleProvider].
  PageTitleProviderProvider call(
    String? routeName,
  ) {
    return PageTitleProviderProvider(
      routeName,
    );
  }

  @override
  PageTitleProviderProvider getProviderOverride(
    covariant PageTitleProviderProvider provider,
  ) {
    return call(
      provider.routeName,
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
  String? get name => r'pageTitleProvider';
}

/// See also [PageTitleProvider].
class PageTitleProviderProvider
    extends AutoDisposeNotifierProviderImpl<PageTitleProvider, String> {
  /// See also [PageTitleProvider].
  PageTitleProviderProvider(
    String? routeName,
  ) : this._internal(
          () => PageTitleProvider()..routeName = routeName,
          from: pageTitleProvider,
          name: r'pageTitleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pageTitleProviderHash,
          dependencies: PageTitleProviderFamily._dependencies,
          allTransitiveDependencies:
              PageTitleProviderFamily._allTransitiveDependencies,
          routeName: routeName,
        );

  PageTitleProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.routeName,
  }) : super.internal();

  final String? routeName;

  @override
  String runNotifierBuild(
    covariant PageTitleProvider notifier,
  ) {
    return notifier.build(
      routeName,
    );
  }

  @override
  Override overrideWith(PageTitleProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: PageTitleProviderProvider._internal(
        () => create()..routeName = routeName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        routeName: routeName,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PageTitleProvider, String>
      createElement() {
    return _PageTitleProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PageTitleProviderProvider && other.routeName == routeName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, routeName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PageTitleProviderRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `routeName` of this provider.
  String? get routeName;
}

class _PageTitleProviderProviderElement
    extends AutoDisposeNotifierProviderElement<PageTitleProvider, String>
    with PageTitleProviderRef {
  _PageTitleProviderProviderElement(super.provider);

  @override
  String? get routeName => (origin as PageTitleProviderProvider).routeName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
