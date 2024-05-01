// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggingProviderHash() => r'35c191c075eddf6f7dd69b30c0206ceadf467a9f';

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

abstract class _$LoggingProvider extends BuildlessAsyncNotifier<Logging> {
  late final List<Logging> Function() actionLoggingList;

  FutureOr<Logging> build({
    required List<Logging> Function() actionLoggingList,
  });
}

/// See also [LoggingProvider].
@ProviderFor(LoggingProvider)
const loggingProvider = LoggingProviderFamily();

/// See also [LoggingProvider].
class LoggingProviderFamily extends Family<AsyncValue<Logging>> {
  /// See also [LoggingProvider].
  const LoggingProviderFamily();

  /// See also [LoggingProvider].
  LoggingProviderProvider call({
    required List<Logging> Function() actionLoggingList,
  }) {
    return LoggingProviderProvider(
      actionLoggingList: actionLoggingList,
    );
  }

  @override
  LoggingProviderProvider getProviderOverride(
    covariant LoggingProviderProvider provider,
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
  String? get name => r'loggingProvider';
}

/// See also [LoggingProvider].
class LoggingProviderProvider
    extends AsyncNotifierProviderImpl<LoggingProvider, Logging> {
  /// See also [LoggingProvider].
  LoggingProviderProvider({
    required List<Logging> Function() actionLoggingList,
  }) : this._internal(
          () => LoggingProvider()..actionLoggingList = actionLoggingList,
          from: loggingProvider,
          name: r'loggingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loggingProviderHash,
          dependencies: LoggingProviderFamily._dependencies,
          allTransitiveDependencies:
              LoggingProviderFamily._allTransitiveDependencies,
          actionLoggingList: actionLoggingList,
        );

  LoggingProviderProvider._internal(
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
  FutureOr<Logging> runNotifierBuild(
    covariant LoggingProvider notifier,
  ) {
    return notifier.build(
      actionLoggingList: actionLoggingList,
    );
  }

  @override
  Override overrideWith(LoggingProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: LoggingProviderProvider._internal(
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
  AsyncNotifierProviderElement<LoggingProvider, Logging> createElement() {
    return _LoggingProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoggingProviderProvider &&
        other.actionLoggingList == actionLoggingList;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, actionLoggingList.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoggingProviderRef on AsyncNotifierProviderRef<Logging> {
  /// The parameter `actionLoggingList` of this provider.
  List<Logging> Function() get actionLoggingList;
}

class _LoggingProviderProviderElement
    extends AsyncNotifierProviderElement<LoggingProvider, Logging>
    with LoggingProviderRef {
  _LoggingProviderProviderElement(super.provider);

  @override
  List<Logging> Function() get actionLoggingList =>
      (origin as LoggingProviderProvider).actionLoggingList;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
