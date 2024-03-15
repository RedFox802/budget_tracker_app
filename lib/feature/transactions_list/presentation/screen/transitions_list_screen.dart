import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/presentation/component/app_bar/custom_app_bar.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_top_border_wrapper.dart';
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
    final transactions = listenableState.transactions;
    final months = list.map((e) => e.date.month).toSet();
    final Map<String, Iterable<TransactionEntity>> monthsMap = {};
    for (final month in months) {
      monthsMap.addAll({
        month.toString(): list.where((item) => item.date.month == month),
      });
    }
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: const CustomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary100,
        child: const Icon(Icons.add),
        onPressed: () {
          context.router.push(EditTransactionRoute());
        },
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: CardCircularTopBorderWrapper(
              padding: const EdgeInsets.all(6),
              child: ListView.builder(
                itemCount: months.length,
                itemBuilder: (context, index) {
                  final currentItem =
                      monthsMap[months.elementAt(index).toString()];

                  if (currentItem != null) {
                    return TransactionGroupCard(
                      groupName: 'За февраль',
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

final list = [
  TransactionEntity(
    type: TransactionType.expenditure,
    amount: 85443,
    category: const TransactionExpenditureCategory(
      name: 'Продукты',
    ),
    name: 'Покупка продуктов 1',
    date: DateTime.now(),
  ),
  TransactionEntity(
    type: TransactionType.expenditure,
    amount: 12000,
    category: const TransactionExpenditureCategory(
      name: 'Продукты',
    ),
    name: 'Покупка продуктов 2',
    date: DateTime.now(),
  ),
  TransactionEntity(
    type: TransactionType.income,
    amount: 46565,
    category: const TransactionIncomeCategory(
      name: 'Продукты',
    ),
    name: 'Покупка продуктов 3',
    date: DateTime.now(),
  ),
  TransactionEntity(
    type: TransactionType.expenditure,
    amount: 35,
    category: const TransactionExpenditureCategory(
      name: 'Продукты',
    ),
    name: 'Покупка продуктов 4',
    date: DateTime.now().subtract(
      const Duration(days: 40),
    ),
  ),
  TransactionEntity(
    type: TransactionType.expenditure,
    amount: 63276,
    category: const TransactionExpenditureCategory(
      name: 'Продукты',
    ),
    name: 'Покупка продуктов 5',
    date: DateTime.now().subtract(
      const Duration(days: 40),
    ),
  ),
  TransactionEntity(
    type: TransactionType.expenditure,
    amount: 54666,
    category: const TransactionExpenditureCategory(
      name: 'Продукты',
    ),
    name: 'Покупка продуктов 6',
    date: DateTime.now().subtract(
      const Duration(days: 40),
    ),
  ),
];
