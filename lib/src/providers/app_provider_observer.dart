import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';

final class AppProviderObserver extends ProviderObserver {
  final bool debugLogDiagnostics;

  AppProviderObserver({this.debugLogDiagnostics = false});

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    if (debugLogDiagnostics) {
      developer.log('Provider ${context.provider} was initialized with $value', name: debugTag);
    }
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    if (debugLogDiagnostics) {
      developer.log('Provider ${context.provider} was disposed', name: debugTag);
    }
  }

  @override
  void didUpdateProvider(ProviderObserverContext context, Object? previousValue, Object? newValue) {
    if (debugLogDiagnostics) {
      developer.log('Provider ${context.provider} updated\nfrom\n$previousValue\nto\n$newValue', name: debugTag);
    }
  }

  @override
  void providerDidFail(ProviderObserverContext context, Object error, StackTrace stackTrace) {
    if (debugLogDiagnostics) {
      developer.log('Provider ${context.provider} threw $error at $stackTrace', name: debugTag);
    }
  }
}
