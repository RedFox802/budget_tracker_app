import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    this.keyboardType,
    this.initialValue,
    this.hint,
    this.onChanged,
    this.formatter,
    this.filledColor,
    this.size,
    this.maxLength,
    super.key,
  });

  final String? initialValue;

  final String? hint;

  final ValueChanged<String>? onChanged;

  final TextInputType? keyboardType;

  final TextInputFormatter? formatter;

  final Color? filledColor;

  final double? size;

  final int? maxLength;

  static const InputBorder _inputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 54,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        maxLength: maxLength,
        keyboardType: keyboardType,
        inputFormatters: [if (formatter != null) formatter!],
        cursorColor: AppColors.primary100,
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          filled: true,
          hintText: hint,
          contentPadding: const EdgeInsets.fromLTRB(16, 26, 16, 0),
          fillColor: filledColor ?? AppColors.primary10.withOpacity(0.2),
          enabledBorder: _inputBorder,
          border: _inputBorder,
          focusedErrorBorder: _inputBorder,
          focusedBorder: _inputBorder,
          disabledBorder: _inputBorder,
          errorBorder: _inputBorder,
        ),
      ),
    );
  }
}
