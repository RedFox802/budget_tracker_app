import 'package:budget_tracker_app/common/domain/transition_list/cubit/state/transactions_list_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/common/presentation/component/app_bar/custom_app_bar.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_top_border_wrapper.dart';
import 'package:budget_tracker_app/common/presentation/component/empty_data_card.dart';
import 'package:budget_tracker_app/feature/home/presentation/component/transaction_group_card.dart';
import 'package:budget_tracker_app/router/app_router.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TransitionsListScreen extends StatelessWidget {
  const TransitionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listenableState = context.watch<TransactionsListCubit>().state;
    final monthsMap = listenableState.transactionsByMonthsAndYears;

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: const CustomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary100,
        child: const Icon(Icons.add),
        onPressed: () {
          context.router.push(
            EditTransactionRoute(),
          );
        },
      ),
      body: monthsMap.isEmpty
          ? const EmptyDataCard(
              title: 'Ваш список операций пуст',
              subtitle: 'Нажмите на + и добавьте свою первую операцию',
            )
          : Column(
              children: [
                const SizedBox(height: 10),
                Expanded(
                  child: CardCircularTopBorderWrapper(
                    padding: const EdgeInsets.all(6),
                    child: ListView.builder(
                      itemCount: monthsMap.keys.length,
                      itemBuilder: (context, index) {
                        final currentKey = monthsMap.keys.elementAt(index);
                        final currentItem = monthsMap[currentKey];

                        if (currentItem != null) {
                          return TransactionGroupCard(
                            groupName: currentKey,
                            transactions: currentItem,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
