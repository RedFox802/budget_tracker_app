import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class EditTransactionTypeCard extends StatelessWidget {
  const EditTransactionTypeCard({
    required this.selectedValue,
    required this.onChanged,
    super.key,
  });

  final TransactionType selectedValue;

  final ValueChanged<TransactionType?> onChanged;

  @override
  Widget build(BuildContext context) {
    return CardCircularBorderAllWrapper(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            child: Text(
              '3) Тип транзакции',
              style: AppTextTheme.title,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 10),
          _RadioRow._(
            value: TransactionType.expenditure,
            selectedValue: selectedValue,
            onChanged: onChanged,
          ),
          _RadioRow._(
            value: TransactionType.income,
            selectedValue: selectedValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _RadioRow extends StatelessWidget {
  const _RadioRow._({
    required this.value,
    required this.selectedValue,
    required this.onChanged,
  });

  final TransactionType value;

  final TransactionType selectedValue;

  final ValueChanged<TransactionType?> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      overlayColor: MaterialStateColor.resolveWith(
        (states) => Colors.transparent,
      ),
      child: Row(
        children: [
          Radio<TransactionType>(
            visualDensity: const VisualDensity(
              horizontal: -4,
              vertical: -4,
            ),
            value: value,
            groupValue: selectedValue,
            activeColor: AppColors.primary100,
            onChanged: (value) {},
          ),
          Flexible(
            child: Text(
              value.type,
              maxLines: 2,
              style: AppTextTheme.regular,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
