import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/presentation/component/app_bar/custom_app_bar.dart';
import 'package:budget_tracker_app/common/presentation/component/app_error_flush_bar.dart';
import 'package:budget_tracker_app/common/presentation/component/button/app_elevated_button.dart';
import 'package:budget_tracker_app/di/service_locator.dart';
import 'package:budget_tracker_app/feature/edit_transaction/presentation/component/edit_transaction_catagory_card.dart';
import 'package:budget_tracker_app/feature/edit_transaction/presentation/component/edit_transaction_date_card.dart';
import 'package:budget_tracker_app/feature/edit_transaction/presentation/component/edit_transaction_name_card.dart';
import 'package:budget_tracker_app/feature/edit_transaction/presentation/component/edit_transaction_type_card.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EditTransactionScreen extends StatefulWidget {
  const EditTransactionScreen({
    super.key,
    this.transactionEntity,
  });

  final TransactionEntity? transactionEntity;

  @override
  State<EditTransactionScreen> createState() => _EditTransactionScreenState();
}

class _EditTransactionScreenState extends State<EditTransactionScreen> {
  late TransactionEntity transactionEntity;

  @override
  void initState() {
    super.initState();

    final startEntity = widget.transactionEntity;
    if (startEntity != null) {
      transactionEntity = startEntity;
    } else {
      transactionEntity = TransactionEntity(
        type: TransactionType.expenditure,
        name: '',
        date: DateTime.now(),
        amount: 0,
        category: getIt<TransactionsListCubit>()
            .state
            .availableExpenditureCategories
            .first,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<TransactionsListCubit>().state;
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: const CustomAppBar(),
      floatingActionButton: SizedBox(
        width: MediaQuery.sizeOf(context).width - 32,
        height: 50,
        child: AppElevatedButton(
          title: 'Сохранить',
          onTap: _onSave,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          EditTransactionNameCard(
            initialValue: transactionEntity.name,
            onChanged: (String value) {
              transactionEntity = transactionEntity.copyWith(
                name: value,
              );
            },
          ),
          const SizedBox(height: 10),
          EditTransactionTypeCard(
            selectedValue: transactionEntity.type,
            onChanged: (TransactionType? value) {
              setState(() {
                transactionEntity = transactionEntity.copyWith(
                  type: value ?? TransactionType.expenditure,
                );
              });
            },
          ),
          const SizedBox(height: 10),
          EditTransactionCategoryCard(
            selectedCategory: transactionEntity.category,
            availableCategory:
                transactionEntity.type == TransactionType.expenditure
                    ? state.availableExpenditureCategories
                    : state.availableIncomeCategories,
            onChanged: (value) {
              setState(() {
                transactionEntity = transactionEntity.copyWith(
                  category: value,
                );
              });
            },
          ),
          const SizedBox(height: 10),
          EditTransactionDateCard(
            onChanged: (DateTime value) {
              setState(() {
                transactionEntity = transactionEntity.copyWith(
                  date: value,
                );
              });
            },
            selectedValue: transactionEntity.date,
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  bool _validateDate() {
    if (transactionEntity.name.isEmpty) {
      showFlushBarError(
        context,
        text: 'Пожалуйста введите название операции!',
      );
      return false;
    }

    return true;
  }

  void _onSave() {
    if (!_validateDate()) return;
    context.read<TransactionsListCubit>().addTransaction(
          transactionEntity,
        );

    context.router.pop();
  }
}
