// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_lifecycle_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pageLifecycleStateProviderHash() =>
    r'5a99c3cb7977dd4bf3ebc57257f54eab7d16e50a';

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
  late final String? routeName;

  PageLifecycleState build(
    String? routeName,
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
    String? routeName,
  ) {
    return PageLifecycleStateProviderProvider(
      routeName,
    );
  }

  @override
  PageLifecycleStateProviderProvider getProviderOverride(
    covariant PageLifecycleStateProviderProvider provider,
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
  String? get name => r'pageLifecycleStateProvider';
}

/// See also [PageLifecycleStateProvider].
class PageLifecycleStateProviderProvider
    extends AutoDisposeNotifierProviderImpl<PageLifecycleStateProvider,
        PageLifecycleState> {
  /// See also [PageLifecycleStateProvider].
  PageLifecycleStateProviderProvider(
    String? routeName,
  ) : this._internal(
          () => PageLifecycleStateProvider()..routeName = routeName,
          from: pageLifecycleStateProvider,
          name: r'pageLifecycleStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pageLifecycleStateProviderHash,
          dependencies: PageLifecycleStateProviderFamily._dependencies,
          allTransitiveDependencies:
              PageLifecycleStateProviderFamily._allTransitiveDependencies,
          routeName: routeName,
        );

  PageLifecycleStateProviderProvider._internal(
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
  PageLifecycleState runNotifierBuild(
    covariant PageLifecycleStateProvider notifier,
  ) {
    return notifier.build(
      routeName,
    );
  }

  @override
  Override overrideWith(PageLifecycleStateProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: PageLifecycleStateProviderProvider._internal(
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
  AutoDisposeNotifierProviderElement<PageLifecycleStateProvider,
      PageLifecycleState> createElement() {
    return _PageLifecycleStateProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PageLifecycleStateProviderProvider &&
        other.routeName == routeName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, routeName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PageLifecycleStateProviderRef
    on AutoDisposeNotifierProviderRef<PageLifecycleState> {
  /// The parameter `routeName` of this provider.
  String? get routeName;
}

class _PageLifecycleStateProviderProviderElement
    extends AutoDisposeNotifierProviderElement<PageLifecycleStateProvider,
        PageLifecycleState> with PageLifecycleStateProviderRef {
  _PageLifecycleStateProviderProviderElement(super.provider);

  @override
  String? get routeName =>
      (origin as PageLifecycleStateProviderProvider).routeName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
