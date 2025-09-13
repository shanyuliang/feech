// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_title_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PageTitleProvider)
const pageTitleProvider = PageTitleProviderFamily._();

final class PageTitleProviderProvider
    extends $NotifierProvider<PageTitleProvider, String?> {
  const PageTitleProviderProvider._({
    required PageTitleProviderFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'pageTitleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pageTitleProviderHash();

  @override
  String toString() {
    return r'pageTitleProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PageTitleProvider create() => PageTitleProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PageTitleProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pageTitleProviderHash() => r'46e0da22b0e9eac7774ea3da1e81983eae98a9f5';

final class PageTitleProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          PageTitleProvider,
          String?,
          String?,
          String?,
          String?
        > {
  const PageTitleProviderFamily._()
    : super(
        retry: null,
        name: r'pageTitleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PageTitleProviderProvider call(String? routeName) =>
      PageTitleProviderProvider._(argument: routeName, from: this);

  @override
  String toString() => r'pageTitleProvider';
}

abstract class _$PageTitleProvider extends $Notifier<String?> {
  late final _$args = ref.$arg as String?;
  String? get routeName => _$args;

  String? build(String? routeName);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
