import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/common/presentation/component/button/app_elevated_button.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/feature/edit_transaction/presentation/component/custom_picker/custom_picker.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class EditTransactionCategoryCard extends StatefulWidget {
  const EditTransactionCategoryCard({
    required this.onChanged,
    required this.selectedCategory,
    required this.availableCategory,
    required this.title,
    required this.enteringTitle,
    this.needClearButton = false,
    super.key,
  });

  final TransactionCategory? selectedCategory;

  final String title;

  final String enteringTitle;

  final Iterable<TransactionCategory> availableCategory;

  final ValueChanged<TransactionCategory?> onChanged;

  final bool needClearButton;

  @override
  State<EditTransactionCategoryCard> createState() =>
      _EditTransactionCategoryCardState();
}

class _EditTransactionCategoryCardState
    extends State<EditTransactionCategoryCard> {
  bool _showPicker = true;

  bool get showClearButton =>
      widget.selectedCategory != null && widget.needClearButton;

  @override
  Widget build(BuildContext context) {
    final selectedCategory = widget.selectedCategory;
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
          selectedCategory: selectedCategory,
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
          title: Text(
            widget.title,
            style: AppTextTheme.title,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              selectedCategory != null ? selectedCategory.name : 'Не выбрано',
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
              if (showClearButton)
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
    required this.onButtonPressed,
    required this.categories,
    required this.title,
    required this.selectedCategory,
  });

  final String title;

  final Iterable<TransactionCategory> categories;

  final ValueChanged<TransactionCategory> onButtonPressed;

  final TransactionCategory? selectedCategory;

  @override
  State<_DrumPicker> createState() => _DrumPickerState();
}

class _DrumPickerState extends State<_DrumPicker> {
  late TransactionCategory _selectedItem =
      widget.selectedCategory ?? widget.categories.first;

  @override
  Widget build(BuildContext context) {
    final categories = widget.categories.toList();
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
        CustomPicker(
          initIndex: categories.indexOf(_selectedItem),
          onSelectedItemChanged: (index) {
            setState(() {
              _selectedItem = categories.elementAt(index);
            });
          },
          items: categories.map(
            (e) {
              return Center(
                child: Text(
                  e.name,
                  style: const TextStyle(color: AppColors.primary100),
                ),
              );
            },
          ).toList(),
        ),
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
