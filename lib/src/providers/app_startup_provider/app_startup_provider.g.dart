// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_startup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appStartupProviderHash() =>
    r'a9011fc99994e7b070d0954640ce4f9b3a5fc30e';

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

abstract class _$AppStartupProvider extends BuildlessAsyncNotifier<void> {
  late final List<AlwaysAliveRefreshable<dynamic>> waitList;

  FutureOr<void> build({
    List<AlwaysAliveRefreshable<dynamic>> waitList = const [],
  });
}

/// See also [AppStartupProvider].
@ProviderFor(AppStartupProvider)
const appStartupProvider = AppStartupProviderFamily();

/// See also [AppStartupProvider].
class AppStartupProviderFamily extends Family<AsyncValue<void>> {
  /// See also [AppStartupProvider].
  const AppStartupProviderFamily();

  /// See also [AppStartupProvider].
  AppStartupProviderProvider call({
    List<AlwaysAliveRefreshable<dynamic>> waitList = const [],
  }) {
    return AppStartupProviderProvider(
      waitList: waitList,
    );
  }

  @override
  AppStartupProviderProvider getProviderOverride(
    covariant AppStartupProviderProvider provider,
  ) {
    return call(
      waitList: provider.waitList,
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
  String? get name => r'appStartupProvider';
}

/// See also [AppStartupProvider].
class AppStartupProviderProvider
    extends AsyncNotifierProviderImpl<AppStartupProvider, void> {
  /// See also [AppStartupProvider].
  AppStartupProviderProvider({
    List<AlwaysAliveRefreshable<dynamic>> waitList = const [],
  }) : this._internal(
          () => AppStartupProvider()..waitList = waitList,
          from: appStartupProvider,
          name: r'appStartupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appStartupProviderHash,
          dependencies: AppStartupProviderFamily._dependencies,
          allTransitiveDependencies:
              AppStartupProviderFamily._allTransitiveDependencies,
          waitList: waitList,
        );

  AppStartupProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.waitList,
  }) : super.internal();

  final List<AlwaysAliveRefreshable<dynamic>> waitList;

  @override
  FutureOr<void> runNotifierBuild(
    covariant AppStartupProvider notifier,
  ) {
    return notifier.build(
      waitList: waitList,
    );
  }

  @override
  Override overrideWith(AppStartupProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppStartupProviderProvider._internal(
        () => create()..waitList = waitList,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        waitList: waitList,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<AppStartupProvider, void> createElement() {
    return _AppStartupProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppStartupProviderProvider && other.waitList == waitList;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, waitList.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppStartupProviderRef on AsyncNotifierProviderRef<void> {
  /// The parameter `waitList` of this provider.
  List<AlwaysAliveRefreshable<dynamic>> get waitList;
}

class _AppStartupProviderProviderElement
    extends AsyncNotifierProviderElement<AppStartupProvider, void>
    with AppStartupProviderRef {
  _AppStartupProviderProviderElement(super.provider);

  @override
  List<AlwaysAliveRefreshable<dynamic>> get waitList =>
      (origin as AppStartupProviderProvider).waitList;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
