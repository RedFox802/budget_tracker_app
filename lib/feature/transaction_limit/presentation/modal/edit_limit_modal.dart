import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/common/presentation/component/app_elevated_button.dart';
import 'package:budget_tracker_app/common/presentation/component/app_text_field.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EditLimitModal extends StatefulWidget {
  const EditLimitModal({
    required this.category,
    super.key,
  });

  final TransactionExpenditureCategory category;

  @override
  State<EditLimitModal> createState() => _EditLimitModalState();
}

class _EditLimitModalState extends State<EditLimitModal> {
  String? selectedLimit;

  @override
  void initState() {
    super.initState();

    final category = widget.category;
    if (category.hasLimit) {
      selectedLimit = category.limitEntity!.limit.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomIndent = max(MediaQuery.viewInsetsOf(context).bottom, 16.0);
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, bottomIndent),
      child: Material(
        color: AppColors.backgroundSecondary,
        type: MaterialType.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    onPressed: () => context.router.pop(),
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: AppColors.disabled,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Введите значение лимита по категории \n«${widget.category.name}»',
                  style: AppTextTheme.title,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: AppTextField(
                    initialValue: selectedLimit,
                    onChanged: _onLimitChanged,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    formatter: FilteringTextInputFormatter.digitsOnly,
                    filledColor: AppColors.primary10.withOpacity(0.2),
                    hint: 'Введите значение лимита',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  child: AppElevatedButton(
                    title: 'Применить',
                    onTap: _saveLimit,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onLimitChanged(String? value) {
    selectedLimit = value;
  }

  void _saveLimit() {
    final limitValue =
        selectedLimit == null ? null : int.tryParse(selectedLimit!);

    final category = widget.category;
    if (category.limitEntity?.limit != limitValue) {
      context.read<TransactionsListCubit>().setCategoryLimit(
            category: category,
            limit: limitValue,
          );
    }

    context.router.pop();
  }
}
