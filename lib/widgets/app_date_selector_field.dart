import 'package:flutter/material.dart';

import '../extensions/date_time_extension.dart';
import 'app_text_form_field.dart';

class AppDateSelectorField extends StatelessWidget {
  AppDateSelectorField({
    super.key,
    this.autovalidateMode = AutovalidateMode.disabled,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.labelText,
    this.onDateSelected,
    this.enabled = true,
    this.onChanged,
    this.validator,
  }) {
    controller.text = initialDate.formatToShortDateDisplay();
  }

  final AutovalidateMode autovalidateMode;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final String? labelText;
  final void Function(DateTime?)? onDateSelected;
  final bool enabled;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final controller = TextEditingController();

  @override
  Widget build(final BuildContext context) {
    return AppTextFormField(
      autovalidateMode: autovalidateMode,
      controller: controller,
      labelText: labelText,
      prefixIcon: const Icon(Icons.calendar_today_outlined),
      enabled: enabled,
      readOnly: true,
      showCursor: false,
      onChanged: onChanged,
      validator: validator,
      onTap: () async {
        onDateSelected?.call(await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
        ));
      },
    );
  }
}
