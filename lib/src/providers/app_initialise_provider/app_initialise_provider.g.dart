// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_initialise_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appInitialiseProviderHash() =>
    r'9a824fca1e89a94860bab84a62efaf239156bb59';

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

abstract class _$AppInitialiseProvider extends BuildlessAsyncNotifier<void> {
  late final List<AsyncNotifierProviderImpl<AsyncNotifier<dynamic>, dynamic>>
      initialiseList;
  late final int minWaitDurationInMilliseconds;

  FutureOr<void> build({
    List<AsyncNotifierProviderImpl<AsyncNotifier<dynamic>, dynamic>>
        initialiseList = const [],
    int minWaitDurationInMilliseconds = 0,
  });
}

/// See also [AppInitialiseProvider].
@ProviderFor(AppInitialiseProvider)
const appInitialiseProvider = AppInitialiseProviderFamily();

/// See also [AppInitialiseProvider].
class AppInitialiseProviderFamily extends Family<AsyncValue<void>> {
  /// See also [AppInitialiseProvider].
  const AppInitialiseProviderFamily();

  /// See also [AppInitialiseProvider].
  AppInitialiseProviderProvider call({
    List<AsyncNotifierProviderImpl<AsyncNotifier<dynamic>, dynamic>>
        initialiseList = const [],
    int minWaitDurationInMilliseconds = 0,
  }) {
    return AppInitialiseProviderProvider(
      initialiseList: initialiseList,
      minWaitDurationInMilliseconds: minWaitDurationInMilliseconds,
    );
  }

  @override
  AppInitialiseProviderProvider getProviderOverride(
    covariant AppInitialiseProviderProvider provider,
  ) {
    return call(
      initialiseList: provider.initialiseList,
      minWaitDurationInMilliseconds: provider.minWaitDurationInMilliseconds,
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
  String? get name => r'appInitialiseProvider';
}

/// See also [AppInitialiseProvider].
class AppInitialiseProviderProvider
    extends AsyncNotifierProviderImpl<AppInitialiseProvider, void> {
  /// See also [AppInitialiseProvider].
  AppInitialiseProviderProvider({
    List<AsyncNotifierProviderImpl<AsyncNotifier<dynamic>, dynamic>>
        initialiseList = const [],
    int minWaitDurationInMilliseconds = 0,
  }) : this._internal(
          () => AppInitialiseProvider()
            ..initialiseList = initialiseList
            ..minWaitDurationInMilliseconds = minWaitDurationInMilliseconds,
          from: appInitialiseProvider,
          name: r'appInitialiseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appInitialiseProviderHash,
          dependencies: AppInitialiseProviderFamily._dependencies,
          allTransitiveDependencies:
              AppInitialiseProviderFamily._allTransitiveDependencies,
          initialiseList: initialiseList,
          minWaitDurationInMilliseconds: minWaitDurationInMilliseconds,
        );

  AppInitialiseProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialiseList,
    required this.minWaitDurationInMilliseconds,
  }) : super.internal();

  final List<AsyncNotifierProviderImpl<AsyncNotifier<dynamic>, dynamic>>
      initialiseList;
  final int minWaitDurationInMilliseconds;

  @override
  FutureOr<void> runNotifierBuild(
    covariant AppInitialiseProvider notifier,
  ) {
    return notifier.build(
      initialiseList: initialiseList,
      minWaitDurationInMilliseconds: minWaitDurationInMilliseconds,
    );
  }

  @override
  Override overrideWith(AppInitialiseProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppInitialiseProviderProvider._internal(
        () => create()
          ..initialiseList = initialiseList
          ..minWaitDurationInMilliseconds = minWaitDurationInMilliseconds,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialiseList: initialiseList,
        minWaitDurationInMilliseconds: minWaitDurationInMilliseconds,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<AppInitialiseProvider, void> createElement() {
    return _AppInitialiseProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppInitialiseProviderProvider &&
        other.initialiseList == initialiseList &&
        other.minWaitDurationInMilliseconds == minWaitDurationInMilliseconds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialiseList.hashCode);
    hash = _SystemHash.combine(hash, minWaitDurationInMilliseconds.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppInitialiseProviderRef on AsyncNotifierProviderRef<void> {
  /// The parameter `initialiseList` of this provider.
  List<AsyncNotifierProviderImpl<AsyncNotifier<dynamic>, dynamic>>
      get initialiseList;

  /// The parameter `minWaitDurationInMilliseconds` of this provider.
  int get minWaitDurationInMilliseconds;
}

class _AppInitialiseProviderProviderElement
    extends AsyncNotifierProviderElement<AppInitialiseProvider, void>
    with AppInitialiseProviderRef {
  _AppInitialiseProviderProviderElement(super.provider);

  @override
  List<AsyncNotifierProviderImpl<AsyncNotifier<dynamic>, dynamic>>
      get initialiseList =>
          (origin as AppInitialiseProviderProvider).initialiseList;
  @override
  int get minWaitDurationInMilliseconds =>
      (origin as AppInitialiseProviderProvider).minWaitDurationInMilliseconds;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
