import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class EditTransactionNameCard extends StatelessWidget {
  const EditTransactionNameCard({
    required this.onChanged,
    required this.initialValue,
    super.key,
  });

  final ValueChanged<String> onChanged;

  final String initialValue;

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
        title: const Text(
          '1) Краткое название',
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
              cursorColor: AppColors.primary100,
              decoration: InputDecoration(
                counter: const SizedBox.shrink(),
                filled: true,
                hintText: 'Введите название',
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
