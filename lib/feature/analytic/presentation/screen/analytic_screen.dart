import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/common/presentation/component/app_bar/custom_app_bar.dart';
import 'package:budget_tracker_app/feature/analytic/presentation/component/app_line_chart.dart';
import 'package:budget_tracker_app/feature/analytic/presentation/component/categories_bar_chart.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AnalyticScreen extends StatelessWidget {
  const AnalyticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          AnalyticLineChart(
            incomeData: {
              0: [
                TransactionEntity(
                  type: TransactionType.expenditure,
                  amount: 12555,
                  category: const TransactionExpenditureCategory(
                    name: 'khg',
                  ),
                  name: 'fff',
                  date: DateTime.now(),
                ),
              ],
              1: [
                TransactionEntity(
                  type: TransactionType.expenditure,
                  amount: 4566,
                  category: const TransactionExpenditureCategory(
                    name: 'khg',
                  ),
                  name: 'fff',
                  date: DateTime.now(),
                ),
              ],
              2: [
                TransactionEntity(
                  type: TransactionType.expenditure,
                  amount: 44,
                  category: const TransactionExpenditureCategory(
                    name: 'khg',
                  ),
                  name: 'fff',
                  date: DateTime.now(),
                ),
              ],
              3: [
                TransactionEntity(
                  type: TransactionType.expenditure,
                  amount: 12555,
                  category: const TransactionExpenditureCategory(
                    name: 'khg',
                  ),
                  name: 'fff',
                  date: DateTime.now(),
                ),
              ],
              4: [
                TransactionEntity(
                  type: TransactionType.expenditure,
                  amount: 4566,
                  category: const TransactionExpenditureCategory(
                    name: 'khg',
                  ),
                  name: 'fff',
                  date: DateTime.now(),
                ),
              ],
              5: [
                TransactionEntity(
                  type: TransactionType.expenditure,
                  amount: 44,
                  category: const TransactionExpenditureCategory(
                    name: 'khg',
                  ),
                  name: 'fff',
                  date: DateTime.now(),
                ),
              ],
            },
            expenditureData: {
              0: [
                TransactionEntity(
                  type: TransactionType.expenditure,
                  amount: 8555,
                  category: const TransactionExpenditureCategory(
                    name: 'khg',
                  ),
                  name: 'fff',
                  date: DateTime.now(),
                ),
              ],
              1: [
                TransactionEntity(
                  type: TransactionType.expenditure,
                  amount: 12567,
                  category: const TransactionExpenditureCategory(
                    name: 'khg',
                  ),
                  name: 'fff',
                  date: DateTime.now(),
                ),
              ],
              2: [
                TransactionEntity(
                  type: TransactionType.expenditure,
                  amount: 14000,
                  category: const TransactionExpenditureCategory(
                    name: 'khg',
                  ),
                  name: 'fff',
                  date: DateTime.now(),
                ),
              ],
            },
            maxAmount: 14000,
            minAmount: 1000,
          ),
          const SizedBox(height: 8),
          CategoriesBarChart(
            data: {
              const TransactionExpenditureCategory(name: 'Путешествия '): 12455,
              const TransactionExpenditureCategory(name: 'Покупки '): 3433,
              const TransactionExpenditureCategory(name: 'Косметика '): 5432,
              const TransactionExpenditureCategory(name: 'Салон '): 8732,
              const TransactionExpenditureCategory(name: 'Кафе '): 9999,
              const TransactionExpenditureCategory(name: 'Массаж '): 3211,
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
