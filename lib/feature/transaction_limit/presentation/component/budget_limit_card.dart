import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/common/presentation/component/app_list_lile.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/feature/transaction_limit/presentation/component/limit_list_tile.dart';
import 'package:budget_tracker_app/router/app_router.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class BudgetLimitCard extends StatelessWidget {
  const BudgetLimitCard({
    required this.categories,
    required this.currentMonth,
    super.key,
  });

  final Iterable<TransactionExpenditureCategory> categories;

  final String currentMonth;

  bool get hasLimit => categories.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return CardCircularBorderAllWrapper(
      padding: const EdgeInsets.all(16),
      child: hasLimit
          ? _HasLimitState._(
              currentMonth: currentMonth,
              categories: categories,
              onTap: () => _onCategoryTap(context),
            )
          : AppListTile(
              onTap: () => _onCategoryTap(context),
              titleStyle: AppTextTheme.title,
              titleMaxLines: 2,
              title: 'Установите лимит трат на $currentMonth!',
              subtitlePadding: EdgeInsets.only(top: 6),
              subtitleStyle: AppTextTheme.regularDisabled,
              subtitle:
                  'Задайте лимиты по категориям или общий лимит по всем тратам.',
            ),
    );
  }

  void _onCategoryTap(
    BuildContext context,
  ) {
    context.router.push(const EditLimitsRoute());
  }
}

class _HasLimitState extends StatelessWidget {
  const _HasLimitState._({
    required this.currentMonth,
    required this.categories,
    required this.onTap,
  });

  final String currentMonth;

  final Iterable<TransactionExpenditureCategory> categories;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ваши лимиты по категориям на $currentMonth',
            style: AppTextTheme.title,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          ...categories.map((category) {
            return LimitListTile(
              category: category,
              onTap: null,
            );
          }).toList(),
        ],
      ),
    );
  }
}
