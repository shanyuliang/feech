// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_startup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appStartupProviderHash() =>
    r'dffb7cf5e6fa041b6e7afafd1d263caf8f7a820c';

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
  late final int minWaitDurationInMilliseconds;

  FutureOr<void> build({
    List<AlwaysAliveRefreshable<dynamic>> waitList = const [],
    int minWaitDurationInMilliseconds = 0,
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
    int minWaitDurationInMilliseconds = 0,
  }) {
    return AppStartupProviderProvider(
      waitList: waitList,
      minWaitDurationInMilliseconds: minWaitDurationInMilliseconds,
    );
  }

  @override
  AppStartupProviderProvider getProviderOverride(
    covariant AppStartupProviderProvider provider,
  ) {
    return call(
      waitList: provider.waitList,
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
  String? get name => r'appStartupProvider';
}

/// See also [AppStartupProvider].
class AppStartupProviderProvider
    extends AsyncNotifierProviderImpl<AppStartupProvider, void> {
  /// See also [AppStartupProvider].
  AppStartupProviderProvider({
    List<AlwaysAliveRefreshable<dynamic>> waitList = const [],
    int minWaitDurationInMilliseconds = 0,
  }) : this._internal(
          () => AppStartupProvider()
            ..waitList = waitList
            ..minWaitDurationInMilliseconds = minWaitDurationInMilliseconds,
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
          minWaitDurationInMilliseconds: minWaitDurationInMilliseconds,
        );

  AppStartupProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.waitList,
    required this.minWaitDurationInMilliseconds,
  }) : super.internal();

  final List<AlwaysAliveRefreshable<dynamic>> waitList;
  final int minWaitDurationInMilliseconds;

  @override
  FutureOr<void> runNotifierBuild(
    covariant AppStartupProvider notifier,
  ) {
    return notifier.build(
      waitList: waitList,
      minWaitDurationInMilliseconds: minWaitDurationInMilliseconds,
    );
  }

  @override
  Override overrideWith(AppStartupProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppStartupProviderProvider._internal(
        () => create()
          ..waitList = waitList
          ..minWaitDurationInMilliseconds = minWaitDurationInMilliseconds,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        waitList: waitList,
        minWaitDurationInMilliseconds: minWaitDurationInMilliseconds,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<AppStartupProvider, void> createElement() {
    return _AppStartupProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppStartupProviderProvider &&
        other.waitList == waitList &&
        other.minWaitDurationInMilliseconds == minWaitDurationInMilliseconds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, waitList.hashCode);
    hash = _SystemHash.combine(hash, minWaitDurationInMilliseconds.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppStartupProviderRef on AsyncNotifierProviderRef<void> {
  /// The parameter `waitList` of this provider.
  List<AlwaysAliveRefreshable<dynamic>> get waitList;

  /// The parameter `minWaitDurationInMilliseconds` of this provider.
  int get minWaitDurationInMilliseconds;
}

class _AppStartupProviderProviderElement
    extends AsyncNotifierProviderElement<AppStartupProvider, void>
    with AppStartupProviderRef {
  _AppStartupProviderProviderElement(super.provider);

  @override
  List<AlwaysAliveRefreshable<dynamic>> get waitList =>
      (origin as AppStartupProviderProvider).waitList;
  @override
  int get minWaitDurationInMilliseconds =>
      (origin as AppStartupProviderProvider).minWaitDurationInMilliseconds;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
