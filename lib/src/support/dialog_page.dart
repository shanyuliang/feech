import 'package:flutter/material.dart';

class DialogPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final bool barrierDismissible;
  final bool scrollable;
  final bool useSafeArea;

  const DialogPage({
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    required this.builder,
    this.barrierDismissible = true,
    this.scrollable = false,
    this.useSafeArea = false,
  });

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
    context: context,
    settings: this,
    builder: (buildContext) => AlertDialog(content: builder.call(buildContext), scrollable: scrollable),
    barrierDismissible: barrierDismissible,
    useSafeArea: useSafeArea,
  );
}
