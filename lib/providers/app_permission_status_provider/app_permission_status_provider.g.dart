// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_permission_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appPermissionStatusHash() =>
    r'54ea6a4b2023c376c379363ffc05afc1bbc8a311';

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

abstract class _$AppPermissionStatus
    extends BuildlessNotifier<AppPermissionStatusState> {
  late final Permission permission;

  AppPermissionStatusState build(
    Permission permission,
  );
}

/// See also [AppPermissionStatus].
@ProviderFor(AppPermissionStatus)
const appPermissionStatusProvider = AppPermissionStatusFamily();

/// See also [AppPermissionStatus].
class AppPermissionStatusFamily extends Family<AppPermissionStatusState> {
  /// See also [AppPermissionStatus].
  const AppPermissionStatusFamily();

  /// See also [AppPermissionStatus].
  AppPermissionStatusProvider call(
    Permission permission,
  ) {
    return AppPermissionStatusProvider(
      permission,
    );
  }

  @override
  AppPermissionStatusProvider getProviderOverride(
    covariant AppPermissionStatusProvider provider,
  ) {
    return call(
      provider.permission,
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
  String? get name => r'appPermissionStatusProvider';
}

/// See also [AppPermissionStatus].
class AppPermissionStatusProvider extends NotifierProviderImpl<
    AppPermissionStatus, AppPermissionStatusState> {
  /// See also [AppPermissionStatus].
  AppPermissionStatusProvider(
    Permission permission,
  ) : this._internal(
          () => AppPermissionStatus()..permission = permission,
          from: appPermissionStatusProvider,
          name: r'appPermissionStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appPermissionStatusHash,
          dependencies: AppPermissionStatusFamily._dependencies,
          allTransitiveDependencies:
              AppPermissionStatusFamily._allTransitiveDependencies,
          permission: permission,
        );

  AppPermissionStatusProvider._internal(
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
  AppPermissionStatusState runNotifierBuild(
    covariant AppPermissionStatus notifier,
  ) {
    return notifier.build(
      permission,
    );
  }

  @override
  Override overrideWith(AppPermissionStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppPermissionStatusProvider._internal(
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
  NotifierProviderElement<AppPermissionStatus, AppPermissionStatusState>
      createElement() {
    return _AppPermissionStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppPermissionStatusProvider &&
        other.permission == permission;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, permission.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppPermissionStatusRef on NotifierProviderRef<AppPermissionStatusState> {
  /// The parameter `permission` of this provider.
  Permission get permission;
}

class _AppPermissionStatusProviderElement extends NotifierProviderElement<
    AppPermissionStatus, AppPermissionStatusState> with AppPermissionStatusRef {
  _AppPermissionStatusProviderElement(super.provider);

  @override
  Permission get permission =>
      (origin as AppPermissionStatusProvider).permission;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
