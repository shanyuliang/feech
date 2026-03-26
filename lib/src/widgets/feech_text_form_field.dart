import 'package:flutter/material.dart';

class FeechTextFormField extends StatefulWidget {
  const FeechTextFormField({
    super.key,
    this.controller,
    this.focusNode,
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

  final bool autoCorrect;
  final AutovalidateMode autovalidateMode;
  final TextEditingController? controller;
  final bool enabled;
  final bool enableSuggestions;
  final FocusNode? focusNode;
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
    // If a controller is provided by the caller, use it; otherwise, create a new one with the initial text
    // That gives the caller the flexibility to update the text if they choose to provide one
    // Example: controller.value = TextEditingValue(text: newText, selection: TextSelection.collapsed(offset: newText.length));
    _controller = (widget.controller ?? TextEditingController(text: widget.initialText ?? ''))
      ..addListener(() {
        setState(() {
          widget.onChanged?.call(_controller.text);
        });
      });
  }

  @override
  void dispose() {
    // Only dispose the controller if it's not provided by the caller
    if (widget.controller == null) {
      _controller.dispose();
    }
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
                },
                icon: const Icon(Icons.clear),
              )
            : null,
        suffixIconColor: widget.clearIconButtonColor,
      ),
      enabled: widget.enabled,
      enableSuggestions: widget.enableSuggestions,
      focusNode: widget.focusNode,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      obscureText: widget.obscureText,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor,
      validator: widget.validator,
    );
  }
}
