import 'package:budget_tracker_app/common/presentation/component/button/app_elevated_button.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:budget_tracker_app/utils/date_time_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditTransactionDateCard extends StatefulWidget {
  const EditTransactionDateCard({
    required this.onChanged,
    required this.selectedValue,
    super.key,
  });

  final DateTime selectedValue;

  final ValueChanged<DateTime> onChanged;

  @override
  State<EditTransactionDateCard> createState() =>
      _EditTransactionDateCardState();
}

class _EditTransactionDateCardState extends State<EditTransactionDateCard> {
  bool _showPicker = false;

  @override
  Widget build(BuildContext context) {
    return CardCircularBorderAllWrapper(
      padding: !_showPicker
          ? const EdgeInsets.symmetric(vertical: 16)
          : const EdgeInsets.all(16),
      child: AnimatedCrossFade(
        crossFadeState:
            _showPicker ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 300),
        firstChild: _DrumPicker._(
          selectedValue: widget.selectedValue,
          onButtonPressed: (answer) {
            setState(
              () {
                _showPicker = false;
                widget.onChanged(answer);
              },
            );
          },
        ),
        secondChild: ListTile(
          visualDensity: const VisualDensity(
            horizontal: -4,
            vertical: -4,
          ),
          title: const Text(
            '4) Дата выполнения',
            style: AppTextTheme.title,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6, left: 18),
            child: Text(
              widget.selectedValue.formattedDate,
              style: AppTextTheme.regular,
            ),
          ),
          onTap: () {
            setState(() {
              _showPicker = true;
            });
          },
          trailing: const Icon(
            Icons.edit,
            color: AppColors.primary100,
          ),
        ),
      ),
    );
  }
}

class _DrumPicker extends StatefulWidget {
  const _DrumPicker._({
    required this.selectedValue,
    required this.onButtonPressed,
  });

  final DateTime selectedValue;

  final ValueChanged<DateTime> onButtonPressed;

  @override
  State<_DrumPicker> createState() => _DrumPickerState();
}

class _DrumPickerState extends State<_DrumPicker> {
  late DateTime _selectedItem = widget.selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            '4) Выберите дату выполнения',
            style: AppTextTheme.title,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (date) {
              setState(() {
                _selectedItem = date;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 52,
          child: AppElevatedButton(
            title: 'Выбрать',
            onTap: () {
              widget.onButtonPressed(_selectedItem);
            },
          ),
        ),
      ],
    );
  }
}
