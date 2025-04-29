import 'package:flutter/material.dart';

import '../extensions/string_extension.dart';
import 'round_corner_avatar.dart';

class InitialNameAvatar extends StatelessWidget {
  const InitialNameAvatar({super.key, this.fullText, this.maxCharacterCount = 3, this.roundCornerShape = false});

  final String? fullText;
  final int maxCharacterCount;
  final bool roundCornerShape;

  @override
  Widget build(final BuildContext context) {
    final initials = fullText?.asNameGetInitials(maxResultLength: maxCharacterCount) ?? '';
    final color = initials.mapToHSLColor(0.5, 0.5);
    final theme = Theme.of(context);
    return roundCornerShape
        ? RoundCornerAvatar(backgroundColor: color, child: Text(initials, style: theme.textTheme.titleMedium?.copyWith(color: Colors.white)))
        : CircleAvatar(backgroundColor: color, child: Text(initials, style: theme.textTheme.titleMedium?.copyWith(color: Colors.white)));
  }
}
