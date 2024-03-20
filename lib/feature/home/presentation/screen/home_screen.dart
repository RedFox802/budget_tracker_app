import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/state/transactions_list_state.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/common/presentation/component/app_bar/custom_app_bar.dart';
import 'package:budget_tracker_app/feature/home/presentation/component/budget_card.dart';
import 'package:budget_tracker_app/feature/transaction_limit/presentation/component/budget_limit_card.dart';
import 'package:budget_tracker_app/feature/transaction_limit/presentation/component/exceeding_spending_limit_warning_card.dart';
import 'package:budget_tracker_app/feature/transactions_list/presentation/components/transaction_group_card.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listenableState = context.watch<TransactionsListCubit>().state;
    final needShowExceedingSpendingLimitWarning =
        listenableState.hasExceedingLimitThreatCategories ||
            listenableState.hasLimitExceededCategories;

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (needShowExceedingSpendingLimitWarning)
              ExceedingSpendingLimitWarningCard(
                categories: [
                  ...listenableState.exceedingLimitThreatCategories,
                  ...listenableState.limitExceededCategories,
                ],
              ),
            const SizedBox(height: 8),
            BudgetCard(
              totalIncome: listenableState.totalIncome,
              totalSpending: listenableState.totalExpenditure,
            ),
            const SizedBox(height: 8),
            BudgetLimitCard(
              currentMonth: DateTimeUtils.getMonthName(DateTime.now().month),
              categories: listenableState.limitedExpenditureCategories,
            ),
            const SizedBox(height: 8),
            TransactionGroupCard(
              groupName: 'Последние траты',
              transactions: listenableState.expenditureTransitions.take(10),
            ),
            const SizedBox(height: 8),
            TransactionGroupCard(
              groupName: 'Последние доходы',
              transactions: listenableState.incomeTransitions.take(10),
            ),
          ],
        ),
      ),
    );
  }
}
