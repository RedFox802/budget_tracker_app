import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/state/transactions_list_state.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/common/presentation/component/app_bar/custom_app_bar.dart';
import 'package:budget_tracker_app/common/presentation/component/empty_data_card.dart';
import 'package:budget_tracker_app/feature/analytic/presentation/component/app_line_chart.dart';
import 'package:budget_tracker_app/feature/analytic/presentation/component/categories_bar_chart.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AnalyticScreen extends StatelessWidget {
  const AnalyticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const indent = SizedBox(height: 10);
    final listenableState = context.watch<TransactionsListCubit>().state;
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: const CustomAppBar(),
      body: listenableState.transactions.isEmpty
          ? const EmptyDataCard(
              title: 'Ваш список операций пуст',
              subtitle:
                  'Перейдите во вкладку Транзакции для добавления операций',
            )
          : ListView(
              children: [
                indent,
                AnalyticLineChart(
                  incomeData:
                      listenableState.incomeTransactionsAmountsByLastYearMonths,
                  expenditureData: listenableState
                      .expenditureTransactionsAmountsByLastYearMonths,
                ),
                indent,
                CategoriesBarChart(
                  data: listenableState
                      .expenditureTransactionsAmountsByCategories,
                ),
                indent,
              ],
            ),
    );
  }
}
