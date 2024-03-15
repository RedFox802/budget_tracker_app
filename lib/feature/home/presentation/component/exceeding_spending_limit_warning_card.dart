import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExceedingSpendingLimitWarningCard extends StatelessWidget {
  const ExceedingSpendingLimitWarningCard({
    super.key,
    required this.categories,
  });

  final List<TransactionExpenditureCategory> categories;

  bool get _hasLimitExceededCategory =>
      categories.indexWhere((e) => e.isLimitExceeded) >= 0;

  String get _title => _hasLimitExceededCategory
      ? 'Вы превысили лимит трат в некоторых категориях!'
      : 'Траты в некоторых категориях близки к лимиту!';

  @override
  Widget build(BuildContext context) {
    return CardCircularBorderAllWrapper(
      padding: const EdgeInsets.all(16),
      color: AppColors.backgroundSecondary,
      borderColor: AppColors.error,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              _title,
              style: AppTextTheme.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 10),
          ...categories.map(
            (item) => Padding(
              padding: const EdgeInsets.only(top: 8),
              child: _TransactionCategory._(
                category: item,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionCategory extends StatelessWidget {
  const _TransactionCategory._({
    required this.category,
  });

  final TransactionExpenditureCategory category;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  category.name,
                  style: AppTextTheme.regular,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10),
              LinearPercentIndicator(
                percent: category.percentageSpent ?? 0.0,
                padding: EdgeInsets.zero,
                lineHeight: 8,
                barRadius: const Radius.circular(16),
                backgroundColor: AppColors.disabled,
                progressColor: AppColors.primary100,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                category.formattedAmount,
                style: AppTextTheme.regular,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Flexible(
              child: Text(
                category.formattedLimit,
                style: AppTextTheme.smallDisabled,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
