import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class LimitListTile extends StatelessWidget {
  const LimitListTile({
    required this.category,
    required this.onTap,
    super.key,
  });

  final TransactionExpenditureCategory category;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final hasLimit = category.hasLimit;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        onTap: onTap,
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        title: Text(
          'Ваш бюджет на «${category.name}»',
          style: AppTextTheme.regular,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          hasLimit
              ? 'Уже потрачено ${category.formattedAmount}'
              : 'Не установлен',
          style: AppTextTheme.regularDisabled,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: hasLimit
            ? Text(
                category.formattedLimit,
                style: AppTextTheme.title,
                overflow: TextOverflow.ellipsis,
              )
            : null,
      ),
    );
  }
}
