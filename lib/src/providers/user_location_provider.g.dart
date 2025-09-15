// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserLocationProvider)
const userLocationProvider = UserLocationProviderProvider._();

final class UserLocationProviderProvider
    extends $NotifierProvider<UserLocationProvider, UserLocation> {
  const UserLocationProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLocationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLocationProviderHash();

  @$internal
  @override
  UserLocationProvider create() => UserLocationProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserLocation value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserLocation>(value),
    );
  }
}

String _$userLocationProviderHash() =>
    r'f546119b6563cf769ea03c22edb56eb8d9a0e40b';

abstract class _$UserLocationProvider extends $Notifier<UserLocation> {
  UserLocation build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserLocation, UserLocation>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserLocation, UserLocation>,
              UserLocation,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
