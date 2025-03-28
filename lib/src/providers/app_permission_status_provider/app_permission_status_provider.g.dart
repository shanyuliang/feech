// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_permission_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appPermissionStatusProviderHash() =>
    r'19e1cd3f2320d59142fd5ff666acc51e066d87d8';

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

abstract class _$AppPermissionStatusProvider
    extends BuildlessNotifier<AppPermissionStatus> {
  late final Permission permission;

  AppPermissionStatus build(Permission permission);
}

/// See also [AppPermissionStatusProvider].
@ProviderFor(AppPermissionStatusProvider)
const appPermissionStatusProvider = AppPermissionStatusProviderFamily();

/// See also [AppPermissionStatusProvider].
class AppPermissionStatusProviderFamily extends Family<AppPermissionStatus> {
  /// See also [AppPermissionStatusProvider].
  const AppPermissionStatusProviderFamily();

  /// See also [AppPermissionStatusProvider].
  AppPermissionStatusProviderProvider call(Permission permission) {
    return AppPermissionStatusProviderProvider(permission);
  }

  @override
  AppPermissionStatusProviderProvider getProviderOverride(
    covariant AppPermissionStatusProviderProvider provider,
  ) {
    return call(provider.permission);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'appPermissionStatusProvider';
}

/// See also [AppPermissionStatusProvider].
class AppPermissionStatusProviderProvider
    extends
        NotifierProviderImpl<AppPermissionStatusProvider, AppPermissionStatus> {
  /// See also [AppPermissionStatusProvider].
  AppPermissionStatusProviderProvider(Permission permission)
    : this._internal(
        () => AppPermissionStatusProvider()..permission = permission,
        from: appPermissionStatusProvider,
        name: r'appPermissionStatusProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$appPermissionStatusProviderHash,
        dependencies: AppPermissionStatusProviderFamily._dependencies,
        allTransitiveDependencies:
            AppPermissionStatusProviderFamily._allTransitiveDependencies,
        permission: permission,
      );

  AppPermissionStatusProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.permission,
  }) : super.internal();

  final Permission permission;

  @override
  AppPermissionStatus runNotifierBuild(
    covariant AppPermissionStatusProvider notifier,
  ) {
    return notifier.build(permission);
  }

  @override
  Override overrideWith(AppPermissionStatusProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppPermissionStatusProviderProvider._internal(
        () => create()..permission = permission,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        permission: permission,
      ),
    );
  }

  @override
  NotifierProviderElement<AppPermissionStatusProvider, AppPermissionStatus>
  createElement() {
    return _AppPermissionStatusProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppPermissionStatusProviderProvider &&
        other.permission == permission;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, permission.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppPermissionStatusProviderRef
    on NotifierProviderRef<AppPermissionStatus> {
  /// The parameter `permission` of this provider.
  Permission get permission;
}

class _AppPermissionStatusProviderProviderElement
    extends
        NotifierProviderElement<
          AppPermissionStatusProvider,
          AppPermissionStatus
        >
    with AppPermissionStatusProviderRef {
  _AppPermissionStatusProviderProviderElement(super.provider);

  @override
  Permission get permission =>
      (origin as AppPermissionStatusProviderProvider).permission;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
