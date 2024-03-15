import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditTransactionCategoryCard extends StatefulWidget {
  const EditTransactionCategoryCard({
    required this.onChanged,
    required this.selectedCategory,
    required this.availableCategory,
    super.key,
  });

  final TransactionCategory selectedCategory;

  final Iterable<TransactionCategory> availableCategory;

  final ValueChanged<TransactionCategory> onChanged;

  @override
  State<EditTransactionCategoryCard> createState() =>
      _EditTransactionCategoryCardState();
}

class _EditTransactionCategoryCardState
    extends State<EditTransactionCategoryCard> {
  bool _showPicker = true;

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
          selectedCategory: widget.selectedCategory,
          categories: widget.availableCategory,
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
            '2) Категория',
            style: AppTextTheme.title,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6, left: 18),
            child: Text(
              widget.selectedCategory.name,
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
    required this.selectedCategory,
    required this.onButtonPressed,
    required this.categories,
  });

  final TransactionCategory selectedCategory;

  final Iterable<TransactionCategory> categories;

  final ValueChanged<TransactionCategory> onButtonPressed;

  @override
  State<_DrumPicker> createState() => _DrumPickerState();
}

class _DrumPickerState extends State<_DrumPicker> {
  late TransactionCategory _selectedItem = widget.selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            '2) Выберите категорию транзакции',
            style: AppTextTheme.title,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 166,
          child: CupertinoPicker(
            itemExtent: 34,
            squeeze: 1.2,
            selectionOverlay: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.tertiarySystemFill,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onSelectedItemChanged: (index) {
              setState(() {
                _selectedItem = widget.categories.elementAt(index);
              });
            },
            children: widget.categories
                .map(
                  (e) => Center(
                    child: Text(
                      e.name,
                      style: const TextStyle(color: AppColors.primary100),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              widget.onButtonPressed(_selectedItem);
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.resolveWith(
                (_) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                (_) => AppColors.primary100,
              ),
            ),
            child: Text(
              'Сохранить',
              style: AppTextTheme.title.copyWith(
                color: AppColors.backgroundSecondary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
