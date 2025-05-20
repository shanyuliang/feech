import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../constants.dart';
import '../extensions/general_type_extension.dart';
import '../global.dart';
import '../models/page_lifecycle_state.dart';
import '../models/page_lifecycle_state_signal_container_parameter.dart';
import '../models/page_title_signal_container_parameter.dart';

abstract class BaseSignalPage extends StatefulWidget {
  final bool debugLogDiagnostics;

  final String? routeName;

  final String initialTitle;

  late final PageTitleSignalContainerParameter pageTitleSignalContainerParameter;

  late final PageLifecycleStateSignalContainerParameter pageLifecycleStateSignalContainerParameter;

  BaseSignalPage({super.key, this.routeName, this.initialTitle = '', this.debugLogDiagnostics = false}) {
    pageTitleSignalContainerParameter = PageTitleSignalContainerParameter(routeName: routeName, initialTitle: initialTitle);
    pageLifecycleStateSignalContainerParameter = PageLifecycleStateSignalContainerParameter(routeName: routeName);
    effect(() {
      final appLifecycleState = appLifecycleStateSignal.value;
      switch (appLifecycleState) {
        case AppLifecycleState.resumed:
          if (debugLogDiagnostics) {
            developer.log("$routeName[$key] app resumed", name: debugTag);
          }
          onAppResumed();
          break;
        case AppLifecycleState.paused:
          if (debugLogDiagnostics) {
            developer.log("$routeName[$key] app paused", name: debugTag);
          }
          onAppPaused();
          break;
        case AppLifecycleState.detached:
          if (debugLogDiagnostics) {
            developer.log("$routeName[$key] app detached", name: debugTag);
          }
          onAppDetached();
          break;
        default:
          if (debugLogDiagnostics) {
            developer.log("$routeName[$key] app lifecycle status: ${appLifecycleState.name}", name: debugTag);
          }
          break;
      }
    });
    routeName?.let((it) {
      effect(() {
        final pageLifecycleState = pageLifecycleStateSignalContainer(pageLifecycleStateSignalContainerParameter).value;
        switch (pageLifecycleState) {
          case PageLifecycleState.resumed:
            if (debugLogDiagnostics) {
              developer.log("$routeName[$key] page resumed", name: debugTag);
            }
            _refreshTitle();
            onPageResumed();
            break;
          case PageLifecycleState.paused:
            if (debugLogDiagnostics) {
              developer.log("$routeName[$key] page paused", name: debugTag);
            }
            onPagePaused();
            break;
          default:
            if (debugLogDiagnostics) {
              developer.log("$routeName[$key] page lifecycle status:${pageLifecycleState.name}", name: debugTag);
            }
            break;
        }
      });
      effect(() {
        final pageTitle = pageTitleSignalContainer(pageTitleSignalContainerParameter).value;
        if (debugLogDiagnostics) {
          developer.log("$routeName[$key] page title changed to [$pageTitle]", name: debugTag);
        }
        _refreshTitle();
      });
    });
  }

  @override
  State<StatefulWidget> createState() => _BaseSignalPageState();

  void setTitle(String title) {
    pageTitleSignalContainer(pageTitleSignalContainerParameter).value = title;
  }

  String getTitle() {
    return pageTitleSignalContainer(pageTitleSignalContainerParameter).peek() ?? initialTitle;
  }

  void _refreshTitle() {
    // setAppSwitcherTitle(context: context, title: getTitle());
  }

  void initialise() {}

  void didChangeDependencies(BuildContext context) {}

  Widget build(BuildContext context);

  void onDisposed(BuildContext context) {}

  void onAppResumed() {}

  void onAppPaused() {}

  void onAppDetached() {}

  void onPageResumed() {}

  void onPagePaused() {}
}

class _BaseSignalPageState extends State<BaseSignalPage> {
  @override
  void initState() {
    super.initState();
    if (widget.debugLogDiagnostics) {
      developer.log("${widget.routeName}[${widget.key}] page initialise", name: debugTag);
    }
    widget.initialise();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.debugLogDiagnostics) {
      developer.log("${widget.routeName}[${widget.key}] page didChangeDependencies", name: debugTag);
    }
    widget.didChangeDependencies(context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.debugLogDiagnostics) {
      developer.log("${widget.routeName}[${widget.key}] page build", name: debugTag);
    }
    return Title(title: widget.getTitle(), color: Theme.of(context).colorScheme.primary, child: widget.build(context));
  }

  @override
  void dispose() {
    if (widget.debugLogDiagnostics) {
      developer.log("${widget.routeName}[${widget.key}] page dispose", name: debugTag);
    }
    widget.onDisposed(context);
    super.dispose();
  }
}
