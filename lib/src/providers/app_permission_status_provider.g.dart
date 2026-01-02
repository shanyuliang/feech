// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_permission_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppPermissionStatusProvider)
final appPermissionStatusProvider = AppPermissionStatusProviderFamily._();

final class AppPermissionStatusProviderProvider
    extends
        $NotifierProvider<AppPermissionStatusProvider, AppPermissionStatus> {
  AppPermissionStatusProviderProvider._({
    required AppPermissionStatusProviderFamily super.from,
    required Permission super.argument,
  }) : super(
         retry: null,
         name: r'appPermissionStatusProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$appPermissionStatusProviderHash();

  @override
  String toString() {
    return r'appPermissionStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AppPermissionStatusProvider create() => AppPermissionStatusProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppPermissionStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppPermissionStatus>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AppPermissionStatusProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$appPermissionStatusProviderHash() =>
    r'19e1cd3f2320d59142fd5ff666acc51e066d87d8';

final class AppPermissionStatusProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          AppPermissionStatusProvider,
          AppPermissionStatus,
          AppPermissionStatus,
          AppPermissionStatus,
          Permission
        > {
  AppPermissionStatusProviderFamily._()
    : super(
        retry: null,
        name: r'appPermissionStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  AppPermissionStatusProviderProvider call(Permission permission) =>
      AppPermissionStatusProviderProvider._(argument: permission, from: this);

  @override
  String toString() => r'appPermissionStatusProvider';
}

abstract class _$AppPermissionStatusProvider
    extends $Notifier<AppPermissionStatus> {
  late final _$args = ref.$arg as Permission;
  Permission get permission => _$args;

  AppPermissionStatus build(Permission permission);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppPermissionStatus, AppPermissionStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppPermissionStatus, AppPermissionStatus>,
              AppPermissionStatus,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
