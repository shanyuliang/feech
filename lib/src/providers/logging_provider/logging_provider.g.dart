// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoggingProvider)
const loggingProvider = LoggingProviderFamily._();

final class LoggingProviderProvider
    extends $AsyncNotifierProvider<LoggingProvider, Logging> {
  const LoggingProviderProvider._({
    required LoggingProviderFamily super.from,
    required List<Logging> Function() super.argument,
  }) : super(
         retry: null,
         name: r'loggingProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loggingProviderHash();

  @override
  String toString() {
    return r'loggingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LoggingProvider create() => LoggingProvider();

  @override
  bool operator ==(Object other) {
    return other is LoggingProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loggingProviderHash() => r'35c191c075eddf6f7dd69b30c0206ceadf467a9f';

final class LoggingProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          LoggingProvider,
          AsyncValue<Logging>,
          Logging,
          FutureOr<Logging>,
          List<Logging> Function()
        > {
  const LoggingProviderFamily._()
    : super(
        retry: null,
        name: r'loggingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  LoggingProviderProvider call({
    required List<Logging> Function() actionLoggingList,
  }) => LoggingProviderProvider._(argument: actionLoggingList, from: this);

  @override
  String toString() => r'loggingProvider';
}

abstract class _$LoggingProvider extends $AsyncNotifier<Logging> {
  late final _$args = ref.$arg as List<Logging> Function();
  List<Logging> Function() get actionLoggingList => _$args;

  FutureOr<Logging> build({
    required List<Logging> Function() actionLoggingList,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(actionLoggingList: _$args);
    final ref = this.ref as $Ref<AsyncValue<Logging>, Logging>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Logging>, Logging>,
              AsyncValue<Logging>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
