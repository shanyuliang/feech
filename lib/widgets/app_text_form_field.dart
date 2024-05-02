import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.autoCorrect = true,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.controller,
    this.enabled = true,
    this.enableSuggestions = true,
    this.isDense = false,
    this.labelText,
    this.maxLines = 1,
    this.minLines,
    this.obscureText = false,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.readOnly = false,
    this.showCursor,
    this.validator,
  });

  final bool autoCorrect;
  final AutovalidateMode autovalidateMode;
  final TextEditingController? controller;
  final bool enabled;
  final bool enableSuggestions;
  final bool isDense;
  final String? labelText;
  final int? maxLines;
  final int? minLines;
  final bool obscureText;
  final void Function(String)? onChanged;
  final GestureTapCallback? onTap;
  final Widget? prefixIcon;
  final bool readOnly;
  final bool? showCursor;
  final String? Function(String?)? validator;

  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      autocorrect: autoCorrect,
      autovalidateMode: autovalidateMode,
      controller: controller,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        border: const OutlineInputBorder(),
        helperText: '',
        isDense: isDense,
        labelText: labelText,
        prefixIcon: prefixIcon,
      ),
      enabled: enabled,
      enableSuggestions: enableSuggestions,
      maxLines: maxLines,
      minLines: minLines,
      obscureText: obscureText,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      showCursor: showCursor,
      validator: validator,
    );
  }
}
