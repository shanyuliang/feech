import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../constants.dart';
import '../extensions/general_type_extension.dart';
import '../models/page_lifecycle_state.dart';
import '../models/page_parameter.dart';
import '../signals/app_lifecycle_state_signal/app_lifecycle_state_signal.dart';
import '../signals/page_lifecycle_state_signal.dart';
import '../signals/page_lifecycle_state_signal_container.dart';
import '../signals/page_title_signal.dart';
import '../signals/page_title_signal_container.dart';
import '../utilities/handy_util.dart';

abstract class BaseSignalPage extends SignalStatefulWidget {
  final bool debugLogDiagnostics;
  final PageParameter pageParameter;
  final AppLifecycleStateSignal? appLifecycleStateSignal;
  final PageLifecycleStateSignalContainer? pageLifecycleStateSignalContainer;
  final PageTitleSignalContainer? pageTitleSignalContainer;

  const BaseSignalPage({
    super.key,
    required this.pageParameter,
    this.appLifecycleStateSignal,
    this.pageLifecycleStateSignalContainer,
    this.pageTitleSignalContainer,
    this.debugLogDiagnostics = false,
  });

  @override
  State<StatefulWidget> createState() => _BaseSignalPageState();

  void setTitle(String? title) {
    pageTitleSignalContainer?.call(pageParameter).set(title);
  }

  String? getTitle() {
    return pageTitleSignalContainer?.call(pageParameter).peek();
  }

  void initialise() {}

  void didChangeDependencies({required BuildContext context}) {}

  Widget build({required BuildContext context});

  void onDisposed({required BuildContext context}) {}

  void onAppResumed({required BuildContext context}) {}

  void onAppPaused({required BuildContext context}) {}

  void onAppDetached({required BuildContext context}) {}

  void onPageResumed({required BuildContext context}) {}

  void onPagePaused({required BuildContext context}) {}
}

class _BaseSignalPageState extends State<BaseSignalPage> {
  late final PageLifecycleStateSignal? pageLifecycleStateSignal;
  late final PageTitleSignal? pageTitleSignal;
  Function()? disposeAppLifecycleStateListener;
  Function()? disposePageLifecycleStateListener;
  Function()? disposePageTitleListener;

  @override
  void initState() {
    super.initState();
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page initialise", name: debugTag);
    }
    pageLifecycleStateSignal = widget.pageLifecycleStateSignalContainer?.call(widget.pageParameter);
    pageTitleSignal = widget.pageTitleSignalContainer?.call(widget.pageParameter);
    widget.initialise();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page didChangeDependencies", name: debugTag);
    }
    widget.appLifecycleStateSignal?.let((it) {
      disposeAppLifecycleStateListener = effect(() {
        final appLifecycleState = it.value;
        switch (appLifecycleState) {
          case AppLifecycleState.resumed:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app resumed", name: debugTag);
            }
            widget.onAppResumed(context: context);
            break;
          case AppLifecycleState.paused:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app paused", name: debugTag);
            }
            widget.onAppPaused(context: context);
            break;
          case AppLifecycleState.detached:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app detached", name: debugTag);
            }
            widget.onAppDetached(context: context);
            break;
          default:
            if (widget.debugLogDiagnostics) {
              developer.log(
                "[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app lifecycle status: ${appLifecycleState.name}",
                name: debugTag,
              );
            }
            break;
        }
      });
    });
    pageLifecycleStateSignal?.let((it) {
      disposePageLifecycleStateListener = effect(() {
        final pageLifecycleState = it.value;
        switch (pageLifecycleState) {
          case PageLifecycleState.resumed:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page resumed", name: debugTag);
            }
            _refreshTitle();
            widget.onPageResumed(context: context);
            break;
          case PageLifecycleState.paused:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page paused", name: debugTag);
            }
            widget.onPagePaused(context: context);
            break;
          default:
            if (widget.debugLogDiagnostics) {
              developer.log(
                "[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page lifecycle status:${pageLifecycleState.name}",
                name: debugTag,
              );
            }
            break;
        }
      });
    });
    pageTitleSignal?.let((it) {
      disposePageTitleListener = effect(() {
        final pageTitle = it.value;
        if (widget.debugLogDiagnostics) {
          developer.log(
            "[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page title changed to [$pageTitle]",
            name: debugTag,
          );
        }
        _refreshTitle();
      });
    });
    widget.didChangeDependencies(context: context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page build", name: debugTag);
    }
    return Title(
      title: pageTitleSignal?.value ?? '',
      color: Theme.of(context).colorScheme.primary,
      child: widget.build(context: context),
    );
  }

  @override
  void dispose() {
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page dispose", name: debugTag);
    }
    disposeAppLifecycleStateListener?.call();
    disposePageLifecycleStateListener?.call();
    disposePageTitleListener?.call();
    widget.onDisposed(context: context);
    super.dispose();
  }

  void _refreshTitle() {
    setAppSwitcherTitle(context: context, title: pageTitleSignal?.peek());
  }
}
