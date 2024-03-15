import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({
    required this.totalIncome,
    required this.totalSpending,
    super.key,
  });

  final num totalIncome;

  final num totalSpending;

  @override
  Widget build(BuildContext context) {
    return CardCircularBorderAllWrapper(
      padding:  EdgeInsets.zero,
      elevation: 1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListTile(
              title: const Text(
                'Сумма доходов',
                style: AppTextTheme.largeDisabled,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                '$totalIncome ₽',
                style: AppTextTheme.title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: const Text(
                'Сумма расходов',
                style: AppTextTheme.largeDisabled,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                '$totalSpending ₽',
                style: AppTextTheme.title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
