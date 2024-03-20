import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/common/presentation/component/app_list_lile.dart';
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
      child: AppListTile(
        onTap: onTap,
        titleStyle: AppTextTheme.regular,
        titleMaxLines: 2,
        title: 'Ваш бюджет на «${category.name}»',
        subtitleStyle: AppTextTheme.regularDisabled,
        subtitleMaxLines: 2,
        subtitle: hasLimit
            ? 'Уже потрачено ${category.formattedAmount}'
            : 'Не установлен',
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
