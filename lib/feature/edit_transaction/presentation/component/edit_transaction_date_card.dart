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
    required this.title,
    required this.enteringTitle,
    this.needClearButton = false,
    super.key,
  });

  final bool needClearButton;

  final DateTime? selectedValue;

  final String title;

  final String enteringTitle;

  final ValueChanged<DateTime?> onChanged;

  @override
  State<EditTransactionDateCard> createState() =>
      _EditTransactionDateCardState();
}

class _EditTransactionDateCardState extends State<EditTransactionDateCard> {
  bool _showPicker = true;

  @override
  Widget build(BuildContext context) {
    final selectedValue = widget.selectedValue;
    return CardCircularBorderAllWrapper(
      padding: !_showPicker
          ? const EdgeInsets.symmetric(vertical: 16)
          : const EdgeInsets.all(16),
      child: AnimatedCrossFade(
        crossFadeState:
            _showPicker ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 300),
        firstChild: _DrumPicker._(
          title: widget.enteringTitle,
          selectedValue: selectedValue ?? DateTime.now(),
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
          title: Text(
            widget.title,
            style: AppTextTheme.title,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              selectedValue != null
                  ? selectedValue.formattedDate
                  : 'Не выбрано',
              style: AppTextTheme.regular,
            ),
          ),
          onTap: () {
            setState(() {
              _showPicker = true;
            });
          },
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Flexible(
                child: Icon(
                  Icons.edit,
                  color: AppColors.primary100,
                ),
              ),
              if (selectedValue != null && widget.needClearButton)
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                        vertical: -4,
                        horizontal: -4,
                      ),
                      onPressed: () => setState(() {
                        widget.onChanged(null);
                      }),
                      icon: const Icon(
                        Icons.delete_outline,
                        color: AppColors.primary100,
                      ),
                    ),
                  ),
                )
            ],
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
    required this.title,
  });

  final DateTime selectedValue;

  final String title;

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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            widget.title,
            style: AppTextTheme.title,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: CupertinoDatePicker(
            initialDateTime: _selectedItem,
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
