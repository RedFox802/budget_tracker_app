import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/state/transactions_list_state.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/common/presentation/component/custom_app_bar.dart';
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
    final listenableState = context.watch<TransactionsListCubit>().state;
    final expenditureTransactionsAmountsByCategories =
        listenableState.expenditureTransactionsAmountsByCategories;
    final incomeTransactionsAmountsByLastYearMonths =
        listenableState.incomeTransactionsAmountsByLastYearMonths;
    final expenditureTransactionsAmountsByLastYearMonths =
        listenableState.expenditureTransactionsAmountsByLastYearMonths;
    final hasExpendituresIncomesChartData =
        expenditureTransactionsAmountsByLastYearMonths.length > 1 ||
            incomeTransactionsAmountsByLastYearMonths.length > 1;
    final hasCategoriesChartData =
        expenditureTransactionsAmountsByCategories.length > 1;

    Widget body;
    if (listenableState.transactions.isEmpty) {
      body = const EmptyDataCard(
        title: 'Ваш список операций пуст',
        subtitle: 'Перейдите во вкладку Транзакции для добавления операций',
      );
    } else if (!hasExpendituresIncomesChartData && !hasCategoriesChartData) {
      body = const EmptyDataCard(
        title: 'Недостаточно данных для аналитики',
        subtitle: 'Добавьте больше транзакций для полноты аналитических данных',
      );
    } else {
      body = ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          if (hasExpendituresIncomesChartData)
            AnalyticLineChart(
              incomeData: incomeTransactionsAmountsByLastYearMonths,
              expenditureData: expenditureTransactionsAmountsByLastYearMonths,
            ),
          if (expenditureTransactionsAmountsByCategories.length >= 2)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CategoriesBarChart(
                data: expenditureTransactionsAmountsByCategories,
              ),
            ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: const CustomAppBar(),
      body: body,
    );
  }
}
