// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_startup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appStartupHash() => r'31ee52eb843e6274d2f49c70c8ddc62f04f4f1ba';

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

abstract class _$AppStartup extends BuildlessAsyncNotifier<void> {
  late final List<AlwaysAliveRefreshable<dynamic>> waitList;

  FutureOr<void> build({
    List<AlwaysAliveRefreshable<dynamic>> waitList = const [],
  });
}

/// See also [AppStartup].
@ProviderFor(AppStartup)
const appStartupProvider = AppStartupFamily();

/// See also [AppStartup].
class AppStartupFamily extends Family<AsyncValue<void>> {
  /// See also [AppStartup].
  const AppStartupFamily();

  /// See also [AppStartup].
  AppStartupProvider call({
    List<AlwaysAliveRefreshable<dynamic>> waitList = const [],
  }) {
    return AppStartupProvider(
      waitList: waitList,
    );
  }

  @override
  AppStartupProvider getProviderOverride(
    covariant AppStartupProvider provider,
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

/// See also [AppStartup].
class AppStartupProvider extends AsyncNotifierProviderImpl<AppStartup, void> {
  /// See also [AppStartup].
  AppStartupProvider({
    List<AlwaysAliveRefreshable<dynamic>> waitList = const [],
  }) : this._internal(
          () => AppStartup()..waitList = waitList,
          from: appStartupProvider,
          name: r'appStartupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appStartupHash,
          dependencies: AppStartupFamily._dependencies,
          allTransitiveDependencies:
              AppStartupFamily._allTransitiveDependencies,
          waitList: waitList,
        );

  AppStartupProvider._internal(
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
    covariant AppStartup notifier,
  ) {
    return notifier.build(
      waitList: waitList,
    );
  }

  @override
  Override overrideWith(AppStartup Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppStartupProvider._internal(
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
  AsyncNotifierProviderElement<AppStartup, void> createElement() {
    return _AppStartupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppStartupProvider && other.waitList == waitList;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, waitList.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppStartupRef on AsyncNotifierProviderRef<void> {
  /// The parameter `waitList` of this provider.
  List<AlwaysAliveRefreshable<dynamic>> get waitList;
}

class _AppStartupProviderElement
    extends AsyncNotifierProviderElement<AppStartup, void> with AppStartupRef {
  _AppStartupProviderElement(super.provider);

  @override
  List<AlwaysAliveRefreshable<dynamic>> get waitList =>
      (origin as AppStartupProvider).waitList;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
