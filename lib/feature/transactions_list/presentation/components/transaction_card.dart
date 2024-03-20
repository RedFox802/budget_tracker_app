import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/presentation/component/app_list_lile.dart';
import 'package:budget_tracker_app/router/app_router.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    required this.transaction,
    this.isNeedShowDate = true,
    super.key,
  });

  final TransactionEntity transaction;

  final bool isNeedShowDate;

  @override
  Widget build(BuildContext context) {
    const baseTransactionValueStyle = AppTextTheme.title;
    final transactionValueStyle = transaction.type == TransactionType.income
        ? baseTransactionValueStyle.copyWith(color: AppColors.green)
        : baseTransactionValueStyle;

    final categoryName = transaction.category.name;
    final date = transaction.date;
    return AppListTile(
      onTap: () => _onTap(context),
      titleMaxLines: 2,
      titleStyle: AppTextTheme.large,
      title: transaction.name,
      subtitlePadding: const EdgeInsets.only(top: 4),
      subtitleStyle: AppTextTheme.regularDisabled,
      subtitle: isNeedShowDate
          ? '$categoryName ${date.day}.${date.month}.${date.year}'
          : categoryName,
      trailing: Text(
        transaction.formattedAmount,
        style: transactionValueStyle,
        textAlign: TextAlign.end,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  void _onTap(BuildContext context) {
    context.router.push(
      EditTransactionRoute(
        transactionEntity: transaction,
      ),
    );
  }
}
