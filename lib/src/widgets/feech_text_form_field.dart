import 'package:flutter/material.dart';

class FeechTextFormField extends StatefulWidget {
  const FeechTextFormField({
    super.key,
    this.controller,
    this.autoCorrect = true,
    this.autovalidateMode = AutovalidateMode.disabled,
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
    this.prefixIconColor,
    this.showClearIconButton = true,
    this.clearIconButtonColor,
    this.readOnly = false,
    this.showCursor,
    this.helperTextPlaceholder = '',
    this.validator,
    this.initialText,
  });

  final TextEditingController? controller;
  final bool autoCorrect;
  final AutovalidateMode autovalidateMode;
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
  final Color? prefixIconColor;
  final bool showClearIconButton;
  final Color? clearIconButtonColor;
  final bool readOnly;
  final bool? showCursor;
  final String? helperTextPlaceholder;
  final String? Function(String?)? validator;
  final String? initialText;

  @override
  State<FeechTextFormField> createState() => _FeechTextFormFieldState();
}

class _FeechTextFormFieldState extends State<FeechTextFormField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = (widget.controller ?? TextEditingController(text: widget.initialText ?? ''))
      ..addListener(() {
        setState(() {
          widget.onChanged?.call(_controller.text);
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      autocorrect: widget.autoCorrect,
      autovalidateMode: widget.autovalidateMode,
      controller: _controller,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        border: const OutlineInputBorder(),
        helperText: widget.helperTextPlaceholder,
        isDense: widget.isDense,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: widget.prefixIconColor,
        suffixIcon: (!widget.readOnly && widget.showClearIconButton && _controller.text.isNotEmpty)
            ? IconButton(
                onPressed: () {
                  _controller.clear();
                  // widget.onChanged?.call("");
                },
                icon: const Icon(Icons.clear),
              )
            : null,
        suffixIconColor: widget.clearIconButtonColor,
      ),
      enabled: widget.enabled,
      enableSuggestions: widget.enableSuggestions,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor,
      validator: widget.validator,
    );
  }
}
