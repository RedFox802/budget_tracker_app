import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
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
    return InkWell(
      onTap: () => _onTap(context),
      overlayColor: MaterialStateColor.resolveWith(
        (states) => Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
              title: Text(
                transaction.name,
                style: AppTextTheme.large,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  isNeedShowDate
                      ? '$categoryName ${date.day}.${date.month}.${date.year}'
                      : categoryName,
                  style: AppTextTheme.regularDisabled,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Text(
            transaction.formattedAmount,
            style: transactionValueStyle,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ],
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
