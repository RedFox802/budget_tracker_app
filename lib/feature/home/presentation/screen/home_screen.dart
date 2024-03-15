import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/common/presentation/component/app_bar/custom_app_bar.dart';
import 'package:budget_tracker_app/feature/home/presentation/component/budget_card.dart';
import 'package:budget_tracker_app/feature/home/presentation/component/budget_limit_card.dart';
import 'package:budget_tracker_app/feature/home/presentation/component/exceeding_spending_limit_warning_card.dart';
import 'package:budget_tracker_app/feature/home/presentation/component/transaction_group_card.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listenableState = context.watch<TransactionsListCubit>().state;
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ExceedingSpendingLimitWarningCard(
              categories: listenableState.availableExpenditureCategories
                  .where((e) => e.limit != null)
                  .toList(),
            ),
            const SizedBox(height: 8),
            const BudgetCard(
              totalIncome: 12000,
              totalSpending: 43444,
            ),
            const SizedBox(height: 8),
            const BudgetLimitCard(
              limit: null,
              currentMonth: 'февраль',
            ),
            const SizedBox(height: 8),
            TransactionGroupCard(
              groupName: 'Последние траты',
              transactions: [
                TransactionEntity(
                  type: TransactionType.expenditure,
                  amount: 1500,
                  category: const TransactionExpenditureCategory(
                    name: 'Продукты',
                  ),
                  name: 'Сладости на неделю',
                  date: DateTime.now(),
                ),
                TransactionEntity(
                  type: TransactionType.expenditure,
                  amount: 20000,
                  category: const TransactionExpenditureCategory(
                    name: 'Путешествия',
                  ),
                  name: 'Авиабилеты в Россию',
                  date: DateTime.now(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TransactionGroupCard(
              groupName: 'Последние доходы',
              transactions: [
                TransactionEntity(
                  type: TransactionType.income,
                  amount: 12000,
                  category: const TransactionIncomeCategory(
                    name: 'Заработная плата',
                  ),
                  name: 'Аванс по зп',
                  date: DateTime.now(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
