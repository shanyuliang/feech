// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TtsProvider)
final ttsProvider = TtsProviderProvider._();

final class TtsProviderProvider
    extends $AsyncNotifierProvider<TtsProvider, Tts> {
  TtsProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ttsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ttsProviderHash();

  @$internal
  @override
  TtsProvider create() => TtsProvider();
}

String _$ttsProviderHash() => r'9e9718e7f41fe1695429682498607c0d14048085';

abstract class _$TtsProvider extends $AsyncNotifier<Tts> {
  FutureOr<Tts> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Tts>, Tts>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Tts>, Tts>,
              AsyncValue<Tts>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
