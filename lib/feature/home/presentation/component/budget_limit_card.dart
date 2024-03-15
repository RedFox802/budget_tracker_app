import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class BudgetLimitCard extends StatelessWidget {
  const BudgetLimitCard({
    required this.limit,
    required this.currentMonth,
    super.key,
  });

  final num? limit;
  final String currentMonth;

  bool get hasLimit => limit != null;

  @override
  Widget build(BuildContext context) {
    return CardCircularBorderAllWrapper(
      padding: const EdgeInsets.all(16),
      child: hasLimit
          ? _HasLimitState._(
              limit: '$limit ₽',
              currentMonth: currentMonth,
            )
          : const _NoLimitState._(),
    );
  }
}

class _NoLimitState extends StatelessWidget {
  const _NoLimitState._();

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
      title: Text(
        'Установите лимит трат на текущий месяц!',
        style: AppTextTheme.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 6),
        child: Text(
          'Задайте лимиты по категориям или общий лимит по всем тратам.',
          style: AppTextTheme.regularDisabled,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _HasLimitState extends StatelessWidget {
  const _HasLimitState._({
    required this.limit,
    required this.currentMonth,
  });

  final String limit;

  final String currentMonth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: ListTile(
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
            title: Text(
              'Ваш бюджет на $currentMonth',
              style: AppTextTheme.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: const Text(
              'Общая сумма по всем категориям',
              style: AppTextTheme.smallDisabled,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Text(
          limit,
          style: AppTextTheme.title,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
