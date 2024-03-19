import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditEnteringValueCard extends StatelessWidget {
  const EditEnteringValueCard({
    required this.onChanged,
    required this.initialValue,
    required this.title,
    required this.hint,
    required this.keyboardType,
    this.formatter,
    super.key,
  });

  final ValueChanged<String> onChanged;

  final String initialValue;

  final String title;

  final String hint;

  final TextInputType keyboardType;

  final TextInputFormatter? formatter;

  InputBorder get _inputBorder => const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return CardCircularBorderAllWrapper(
      padding: EdgeInsets.zero,
      child: ListTile(
        visualDensity: const VisualDensity(
          horizontal: -4,
          vertical: -4,
        ),
        title: Text(
          title,
          style: AppTextTheme.title,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            height: 54,
            child: TextFormField(
              initialValue: initialValue,
              onChanged: onChanged,
              maxLength: 20,
              keyboardType: keyboardType,
              inputFormatters: [if (formatter != null) formatter!],
              cursorColor: AppColors.primary100,
              decoration: InputDecoration(
                counter: const SizedBox.shrink(),
                filled: true,
                hintText: hint,
                contentPadding: const EdgeInsets.fromLTRB(16, 26, 16, 0),
                fillColor: AppColors.primary10.withOpacity(0.2),
                enabledBorder: _inputBorder,
                border: _inputBorder,
                focusedErrorBorder: _inputBorder,
                focusedBorder: _inputBorder,
                disabledBorder: _inputBorder,
                errorBorder: _inputBorder,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
