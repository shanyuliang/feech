// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_logging_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLoggingHash() => r'48263eec14b76a5853eb6a10799b71903e75ca9b';

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

abstract class _$AppLogging extends BuildlessNotifier<AppLoggingState> {
  late final List<Logging> Function() actionLoggingList;

  AppLoggingState build({
    required List<Logging> Function() actionLoggingList,
  });
}

/// See also [AppLogging].
@ProviderFor(AppLogging)
const appLoggingProvider = AppLoggingFamily();

/// See also [AppLogging].
class AppLoggingFamily extends Family<AppLoggingState> {
  /// See also [AppLogging].
  const AppLoggingFamily();

  /// See also [AppLogging].
  AppLoggingProvider call({
    required List<Logging> Function() actionLoggingList,
  }) {
    return AppLoggingProvider(
      actionLoggingList: actionLoggingList,
    );
  }

  @override
  AppLoggingProvider getProviderOverride(
    covariant AppLoggingProvider provider,
  ) {
    return call(
      actionLoggingList: provider.actionLoggingList,
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
  String? get name => r'appLoggingProvider';
}

/// See also [AppLogging].
class AppLoggingProvider
    extends NotifierProviderImpl<AppLogging, AppLoggingState> {
  /// See also [AppLogging].
  AppLoggingProvider({
    required List<Logging> Function() actionLoggingList,
  }) : this._internal(
          () => AppLogging()..actionLoggingList = actionLoggingList,
          from: appLoggingProvider,
          name: r'appLoggingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appLoggingHash,
          dependencies: AppLoggingFamily._dependencies,
          allTransitiveDependencies:
              AppLoggingFamily._allTransitiveDependencies,
          actionLoggingList: actionLoggingList,
        );

  AppLoggingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.actionLoggingList,
  }) : super.internal();

  final List<Logging> Function() actionLoggingList;

  @override
  AppLoggingState runNotifierBuild(
    covariant AppLogging notifier,
  ) {
    return notifier.build(
      actionLoggingList: actionLoggingList,
    );
  }

  @override
  Override overrideWith(AppLogging Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppLoggingProvider._internal(
        () => create()..actionLoggingList = actionLoggingList,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        actionLoggingList: actionLoggingList,
      ),
    );
  }

  @override
  NotifierProviderElement<AppLogging, AppLoggingState> createElement() {
    return _AppLoggingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppLoggingProvider &&
        other.actionLoggingList == actionLoggingList;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, actionLoggingList.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppLoggingRef on NotifierProviderRef<AppLoggingState> {
  /// The parameter `actionLoggingList` of this provider.
  List<Logging> Function() get actionLoggingList;
}

class _AppLoggingProviderElement
    extends NotifierProviderElement<AppLogging, AppLoggingState>
    with AppLoggingRef {
  _AppLoggingProviderElement(super.provider);

  @override
  List<Logging> Function() get actionLoggingList =>
      (origin as AppLoggingProvider).actionLoggingList;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
