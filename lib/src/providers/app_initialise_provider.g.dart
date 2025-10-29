// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_initialise_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppInitialiseProvider)
const appInitialiseProvider = AppInitialiseProviderFamily._();

final class AppInitialiseProviderProvider
    extends $AsyncNotifierProvider<AppInitialiseProvider, bool> {
  const AppInitialiseProviderProvider._({
    required AppInitialiseProviderFamily super.from,
    required ({
      List<ProviderBase<dynamic>> initialiseList,
      int minWaitDurationInMilliseconds,
      bool inOrder,
      bool debugLogDiagnostics,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'appInitialiseProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$appInitialiseProviderHash();

  @override
  String toString() {
    return r'appInitialiseProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  AppInitialiseProvider create() => AppInitialiseProvider();

  @override
  bool operator ==(Object other) {
    return other is AppInitialiseProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$appInitialiseProviderHash() =>
    r'6caa68dc163c9ac435ea2767b7544077f38943d5';

final class AppInitialiseProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          AppInitialiseProvider,
          AsyncValue<bool>,
          bool,
          FutureOr<bool>,
          ({
            List<ProviderBase<dynamic>> initialiseList,
            int minWaitDurationInMilliseconds,
            bool inOrder,
            bool debugLogDiagnostics,
          })
        > {
  const AppInitialiseProviderFamily._()
    : super(
        retry: null,
        name: r'appInitialiseProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  AppInitialiseProviderProvider call({
    List<ProviderBase<dynamic>> initialiseList = const [],
    int minWaitDurationInMilliseconds = 0,
    bool inOrder = false,
    bool debugLogDiagnostics = false,
  }) => AppInitialiseProviderProvider._(
    argument: (
      initialiseList: initialiseList,
      minWaitDurationInMilliseconds: minWaitDurationInMilliseconds,
      inOrder: inOrder,
      debugLogDiagnostics: debugLogDiagnostics,
    ),
    from: this,
  );

  @override
  String toString() => r'appInitialiseProvider';
}

abstract class _$AppInitialiseProvider extends $AsyncNotifier<bool> {
  late final _$args =
      ref.$arg
          as ({
            List<ProviderBase<dynamic>> initialiseList,
            int minWaitDurationInMilliseconds,
            bool inOrder,
            bool debugLogDiagnostics,
          });
  List<ProviderBase<dynamic>> get initialiseList => _$args.initialiseList;
  int get minWaitDurationInMilliseconds => _$args.minWaitDurationInMilliseconds;
  bool get inOrder => _$args.inOrder;
  bool get debugLogDiagnostics => _$args.debugLogDiagnostics;

  FutureOr<bool> build({
    List<ProviderBase<dynamic>> initialiseList = const [],
    int minWaitDurationInMilliseconds = 0,
    bool inOrder = false,
    bool debugLogDiagnostics = false,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      initialiseList: _$args.initialiseList,
      minWaitDurationInMilliseconds: _$args.minWaitDurationInMilliseconds,
      inOrder: _$args.inOrder,
      debugLogDiagnostics: _$args.debugLogDiagnostics,
    );
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
