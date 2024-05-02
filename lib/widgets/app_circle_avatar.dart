import 'package:flutter/material.dart';

import '../extensions/string_extension.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    super.key,
    this.fullText,
    this.maxCharacterCount = 3,
  });

  final String? fullText;
  final int maxCharacterCount;

  @override
  Widget build(final BuildContext context) {
    final initials = fullText?.asNameGetInitials(maxResultLength: maxCharacterCount) ?? '';
    final color = initials.mapToHSLColor(0.5, 0.5);
    final theme = Theme.of(context);
    return CircleAvatar(
      backgroundColor: color,
      child: Text(
        initials,
        style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
      ),
    );
  }
}
