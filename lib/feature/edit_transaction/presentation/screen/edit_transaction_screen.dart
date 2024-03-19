import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/presentation/component/app_bar/custom_app_bar.dart';
import 'package:budget_tracker_app/common/presentation/component/app_error_flush_bar.dart';
import 'package:budget_tracker_app/common/presentation/component/button/app_elevated_button.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_top_border_wrapper.dart';
import 'package:budget_tracker_app/di/service_locator.dart';
import 'package:budget_tracker_app/feature/edit_transaction/presentation/component/edit_transaction_catagory_card.dart';
import 'package:budget_tracker_app/feature/edit_transaction/presentation/component/edit_transaction_date_card.dart';
import 'package:budget_tracker_app/feature/edit_transaction/presentation/component/edit_transaction_name_card.dart';
import 'package:budget_tracker_app/feature/edit_transaction/presentation/component/edit_transaction_type_card.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        id: '',
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
    const indent = SizedBox(height: 10);
    final amount = transactionEntity.amount;
    final state = context.read<TransactionsListCubit>().state;
    final isNeedDeleteButton = transactionEntity.id.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: const CustomAppBar(),
      floatingActionButton: _ButtonSection._(
        isNeedDeleteButton: isNeedDeleteButton,
        onSave: _onSave,
        onDelete: _onDelete,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        children: [
          EditEnteringValueCard(
            initialValue: transactionEntity.name,
            title: '1) Краткое название',
            hint: 'Введите название',
            keyboardType: TextInputType.name,
            onChanged: (String value) {
              transactionEntity = transactionEntity.copyWith(
                name: value,
              );
            },
          ),
          indent,
          EditEnteringValueCard(
            initialValue: amount == 0 ? '' : amount.toString(),
            title: '2) Обьем транзакции',
            hint: 'Введите значение',
            keyboardType: TextInputType.number,
            formatter: FilteringTextInputFormatter.digitsOnly,
            onChanged: (String value) {
              final amount = int.tryParse(value);
              if (amount != null) {
                transactionEntity = transactionEntity.copyWith(
                  amount: amount,
                );
              }
            },
          ),
          indent,
          EditTransactionTypeCard(
            selectedValue: transactionEntity.type,
            onChanged: (TransactionType? value) {
              setState(() {
                transactionEntity = transactionEntity.copyWith(
                  type: value ?? TransactionType.expenditure,
                  category: value == TransactionType.expenditure
                      ? state.availableExpenditureCategories.first
                      : state.availableIncomeCategories.first,
                );
              });
            },
          ),
          indent,
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
          indent,
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

    if (transactionEntity.amount == 0) {
      showFlushBarError(
        context,
        text: 'Пожалуйста введите обьем транзакции!',
      );
      return false;
    }

    return true;
  }

  void _onDelete() {
    context.read<TransactionsListCubit>().deleteTransaction(
          transactionEntity,
        );

    context.router.pop();
  }

  void _onSave() {
    if (!_validateDate()) return;
    context.read<TransactionsListCubit>().addTransaction(
          transactionEntity,
        );

    context.router.pop();
  }
}

class _ButtonSection extends StatelessWidget {
  const _ButtonSection._({
    required this.isNeedDeleteButton,
    required this.onSave,
    required this.onDelete,
  });

  final bool isNeedDeleteButton;

  final VoidCallback onSave;

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final saveButton = SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 50,
      child: AppElevatedButton(
        title: 'Сохранить',
        onTap: onSave,
      ),
    );

    return CardCircularTopBorderWrapper(
      padding: const EdgeInsets.all(16),
      borderColor: AppColors.primary40,
      child: !isNeedDeleteButton
          ? saveButton
          : Row(
              children: [
                CardCircularBorderAllWrapper(
                  padding: EdgeInsets.zero,
                  color: AppColors.primary100,
                  child: IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: AppColors.backgroundAndText,
                    ),
                    onPressed: onDelete,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(child: saveButton),
              ],
            ),
    );
  }
}
