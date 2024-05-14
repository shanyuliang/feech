// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_lifecycle_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pageLifecycleStateProviderHash() =>
    r'bc34e81b4a95c7b20e8a24d2a72175ddc9ad15d1';

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

abstract class _$PageLifecycleStateProvider
    extends BuildlessAutoDisposeNotifier<PageLifecycleState> {
  late final String name;

  PageLifecycleState build(
    String name,
  );
}

/// See also [PageLifecycleStateProvider].
@ProviderFor(PageLifecycleStateProvider)
const pageLifecycleStateProvider = PageLifecycleStateProviderFamily();

/// See also [PageLifecycleStateProvider].
class PageLifecycleStateProviderFamily extends Family<PageLifecycleState> {
  /// See also [PageLifecycleStateProvider].
  const PageLifecycleStateProviderFamily();

  /// See also [PageLifecycleStateProvider].
  PageLifecycleStateProviderProvider call(
    String name,
  ) {
    return PageLifecycleStateProviderProvider(
      name,
    );
  }

  @override
  PageLifecycleStateProviderProvider getProviderOverride(
    covariant PageLifecycleStateProviderProvider provider,
  ) {
    return call(
      provider.name,
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
  String? get name => r'pageLifecycleStateProvider';
}

/// See also [PageLifecycleStateProvider].
class PageLifecycleStateProviderProvider
    extends AutoDisposeNotifierProviderImpl<PageLifecycleStateProvider,
        PageLifecycleState> {
  /// See also [PageLifecycleStateProvider].
  PageLifecycleStateProviderProvider(
    String name,
  ) : this._internal(
          () => PageLifecycleStateProvider()..name = name,
          from: pageLifecycleStateProvider,
          name: r'pageLifecycleStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pageLifecycleStateProviderHash,
          dependencies: PageLifecycleStateProviderFamily._dependencies,
          allTransitiveDependencies:
              PageLifecycleStateProviderFamily._allTransitiveDependencies,
          name: name,
        );

  PageLifecycleStateProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.name,
  }) : super.internal();

  final String name;

  @override
  PageLifecycleState runNotifierBuild(
    covariant PageLifecycleStateProvider notifier,
  ) {
    return notifier.build(
      name,
    );
  }

  @override
  Override overrideWith(PageLifecycleStateProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: PageLifecycleStateProviderProvider._internal(
        () => create()..name = name,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        name: name,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PageLifecycleStateProvider,
      PageLifecycleState> createElement() {
    return _PageLifecycleStateProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PageLifecycleStateProviderProvider && other.name == name;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PageLifecycleStateProviderRef
    on AutoDisposeNotifierProviderRef<PageLifecycleState> {
  /// The parameter `name` of this provider.
  String get name;
}

class _PageLifecycleStateProviderProviderElement
    extends AutoDisposeNotifierProviderElement<PageLifecycleStateProvider,
        PageLifecycleState> with PageLifecycleStateProviderRef {
  _PageLifecycleStateProviderProviderElement(super.provider);

  @override
  String get name => (origin as PageLifecycleStateProviderProvider).name;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
