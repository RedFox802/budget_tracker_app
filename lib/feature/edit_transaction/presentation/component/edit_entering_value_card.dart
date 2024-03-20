import 'package:budget_tracker_app/common/presentation/component/app_text_field.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
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
          child: AppTextField(
            hint: hint,
            initialValue: initialValue,
            onChanged: onChanged,
            maxLength: 20,
            keyboardType: keyboardType,
            formatter: formatter,
            size: 54,
          ),
        ),
      ),
    );
  }
}
