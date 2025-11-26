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

abstract class BaseSignalPage extends StatefulWidget {
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

  void initialise({PageLifecycleStateSignal? pageLifecycleStateSignal, PageTitleSignal? pageTitleSignal}) {}

  void didChangeDependencies({required BuildContext context, PageLifecycleStateSignal? pageLifecycleStateSignal, PageTitleSignal? pageTitleSignal}) {}

  Widget build({required BuildContext context, PageLifecycleStateSignal? pageLifecycleStateSignal, PageTitleSignal? pageTitleSignal});

  void onDisposed({required BuildContext context, PageLifecycleStateSignal? pageLifecycleStateSignal, PageTitleSignal? pageTitleSignal}) {}

  void onAppResumed({required BuildContext context, PageLifecycleStateSignal? pageLifecycleStateSignal, PageTitleSignal? pageTitleSignal}) {}

  void onAppPaused({required BuildContext context, PageLifecycleStateSignal? pageLifecycleStateSignal, PageTitleSignal? pageTitleSignal}) {}

  void onAppDetached({required BuildContext context, PageLifecycleStateSignal? pageLifecycleStateSignal, PageTitleSignal? pageTitleSignal}) {}

  void onPageResumed({required BuildContext context, PageLifecycleStateSignal? pageLifecycleStateSignal, PageTitleSignal? pageTitleSignal}) {}

  void onPagePaused({required BuildContext context, PageLifecycleStateSignal? pageLifecycleStateSignal, PageTitleSignal? pageTitleSignal}) {}
}

class _BaseSignalPageState extends State<BaseSignalPage> {
  late final PageLifecycleStateSignal? pageLifecycleStateSignal;
  late final PageTitleSignal? pageTitleSignal;
  late final Function()? disposeAppLifecycleStateListener;
  late final Function()? disposePageLifecycleStateListener;
  late final Function()? disposePageTitleListener;

  @override
  void initState() {
    super.initState();
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page initialise", name: debugTag);
    }
    widget.pageLifecycleStateSignalContainer?.let((it) {
      pageLifecycleStateSignal = it(widget.pageParameter);
    });
    widget.pageTitleSignalContainer?.let((it) {
      pageTitleSignal = it(widget.pageParameter);
    });
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
            widget.onAppResumed(context: context, pageLifecycleStateSignal: pageLifecycleStateSignal, pageTitleSignal: pageTitleSignal);
            break;
          case AppLifecycleState.paused:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app paused", name: debugTag);
            }
            widget.onAppPaused(context: context, pageLifecycleStateSignal: pageLifecycleStateSignal, pageTitleSignal: pageTitleSignal);
            break;
          case AppLifecycleState.detached:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app detached", name: debugTag);
            }
            widget.onAppDetached(context: context, pageLifecycleStateSignal: pageLifecycleStateSignal, pageTitleSignal: pageTitleSignal);
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
            widget.onPageResumed(context: context, pageLifecycleStateSignal: pageLifecycleStateSignal, pageTitleSignal: pageTitleSignal);
            break;
          case PageLifecycleState.paused:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page paused", name: debugTag);
            }
            widget.onPagePaused(context: context, pageLifecycleStateSignal: pageLifecycleStateSignal, pageTitleSignal: pageTitleSignal);
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
    widget.didChangeDependencies(context: context, pageLifecycleStateSignal: pageLifecycleStateSignal, pageTitleSignal: pageTitleSignal);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page build", name: debugTag);
    }
    return Title(
      title: pageTitleSignal?.value ?? '',
      color: Theme.of(context).colorScheme.primary,
      child: widget.build(context: context, pageLifecycleStateSignal: pageLifecycleStateSignal, pageTitleSignal: pageTitleSignal),
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
    widget.onDisposed(context: context, pageLifecycleStateSignal: pageLifecycleStateSignal, pageTitleSignal: pageTitleSignal);
    super.dispose();
  }

  void _refreshTitle() {
    setAppSwitcherTitle(context: context, title: pageTitleSignal?.value);
  }
}
