import 'package:flutter/material.dart';

class SimpleDialogPage<T> extends Page<T> {
  final String title;
  final List<T> options;
  final bool barrierDismissible;
  final bool useSafeArea;

  const SimpleDialogPage({
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    required this.title,
    required this.options,
    this.barrierDismissible = true,
    this.useSafeArea = false,
  });

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        builder: (_) => SimpleDialog(
          title: Text(title),
          children: options
              .map((e) => SimpleDialogOption(
                    child: Text(e.toString()),
                    onPressed: () {
                      Navigator.pop(context, e);
                    },
                  ))
              .toList(),
        ),
        barrierDismissible: barrierDismissible,
        useSafeArea: useSafeArea,
      );
}
