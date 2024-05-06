import 'package:flutter/cupertino.dart';

class Grey extends StatelessWidget {
  final Widget child;

  const Grey({super.key, required this.child});

  @override
  Widget build(BuildContext context) => ColorFiltered(
        colorFilter: const ColorFilter.matrix(<double>[
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
        ]),
        child: child,
      );
}
