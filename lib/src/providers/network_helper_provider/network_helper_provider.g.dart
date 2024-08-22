// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_helper_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$networkHelperProviderHash() =>
    r'a1d0f9f706fc6e3e891c7aac48a4a054a70bb050';

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

abstract class _$NetworkHelperProvider
    extends BuildlessNotifier<NetworkHelper> {
  late final Client? client;

  NetworkHelper build({
    Client? client,
  });
}

/// See also [NetworkHelperProvider].
@ProviderFor(NetworkHelperProvider)
const networkHelperProvider = NetworkHelperProviderFamily();

/// See also [NetworkHelperProvider].
class NetworkHelperProviderFamily extends Family<NetworkHelper> {
  /// See also [NetworkHelperProvider].
  const NetworkHelperProviderFamily();

  /// See also [NetworkHelperProvider].
  NetworkHelperProviderProvider call({
    Client? client,
  }) {
    return NetworkHelperProviderProvider(
      client: client,
    );
  }

  @override
  NetworkHelperProviderProvider getProviderOverride(
    covariant NetworkHelperProviderProvider provider,
  ) {
    return call(
      client: provider.client,
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
  String? get name => r'networkHelperProvider';
}

/// See also [NetworkHelperProvider].
class NetworkHelperProviderProvider
    extends NotifierProviderImpl<NetworkHelperProvider, NetworkHelper> {
  /// See also [NetworkHelperProvider].
  NetworkHelperProviderProvider({
    Client? client,
  }) : this._internal(
          () => NetworkHelperProvider()..client = client,
          from: networkHelperProvider,
          name: r'networkHelperProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$networkHelperProviderHash,
          dependencies: NetworkHelperProviderFamily._dependencies,
          allTransitiveDependencies:
              NetworkHelperProviderFamily._allTransitiveDependencies,
          client: client,
        );

  NetworkHelperProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.client,
  }) : super.internal();

  final Client? client;

  @override
  NetworkHelper runNotifierBuild(
    covariant NetworkHelperProvider notifier,
  ) {
    return notifier.build(
      client: client,
    );
  }

  @override
  Override overrideWith(NetworkHelperProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: NetworkHelperProviderProvider._internal(
        () => create()..client = client,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        client: client,
      ),
    );
  }

  @override
  NotifierProviderElement<NetworkHelperProvider, NetworkHelper>
      createElement() {
    return _NetworkHelperProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NetworkHelperProviderProvider && other.client == client;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, client.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NetworkHelperProviderRef on NotifierProviderRef<NetworkHelper> {
  /// The parameter `client` of this provider.
  Client? get client;
}

class _NetworkHelperProviderProviderElement
    extends NotifierProviderElement<NetworkHelperProvider, NetworkHelper>
    with NetworkHelperProviderRef {
  _NetworkHelperProviderProviderElement(super.provider);

  @override
  Client? get client => (origin as NetworkHelperProviderProvider).client;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
