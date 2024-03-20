import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/presentation/component/custom_app_bar.dart';
import 'package:budget_tracker_app/common/presentation/component/empty_data_card.dart';
import 'package:budget_tracker_app/di/service_locator.dart';
import 'package:budget_tracker_app/feature/search/presentation/component/search_text_field.dart';
import 'package:budget_tracker_app/feature/transactions_list/presentation/components/transaction_card.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchTransactionsScreen extends StatefulWidget {
  const SearchTransactionsScreen({super.key});

  @override
  State<SearchTransactionsScreen> createState() =>
      _SearchTransactionsScreenState();
}

class _SearchTransactionsScreenState extends State<SearchTransactionsScreen> {
  @override
  void initState() {
    super.initState();
    getIt<TransactionsListCubit>().resetSearchedTransactions();
  }

  @override
  Widget build(BuildContext context) {
    final listenableState = context.watch<TransactionsListCubit>().state;
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchTextField(
              hint: 'Введите название',
              readOnly: false,
              onChanged: _onSearch,
              onClear: () => _onSearch(''),
            ),
          ),
          Expanded(
            child: _TransactionsList._(
              transactions: listenableState.searchedTransactions,
            ),
          ),
        ],
      ),
    );
  }

  void _onSearch(String? value) {
    getIt<TransactionsListCubit>().searchTransactionByName(value);
  }
}

class _TransactionsList extends StatelessWidget {
  const _TransactionsList._({
    required this.transactions,
  });

  final Iterable<TransactionEntity> transactions;

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const EmptyDataCard(
        alignment: Alignment.topCenter,
        color: AppColors.backgroundPrimary,
        title: 'Ничего не найдено',
        subtitle: 'Транзакции с введенным именем нет среди сохраненных',
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return TransactionCard(
          transaction: transactions.elementAt(index),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
