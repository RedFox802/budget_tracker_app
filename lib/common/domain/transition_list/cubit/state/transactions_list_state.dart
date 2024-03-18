import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions_list_state.g.dart';

part 'transactions_list_state.freezed.dart';

@freezed
class TransactionsListState with _$TransactionsListState {
  const factory TransactionsListState({
    @Default([]) Iterable<TransactionEntity> transactions,
    @Default(TransactionCategory.defaultExpenditureValues)
    Iterable<TransactionExpenditureCategory> availableExpenditureCategories,
    @Default(TransactionCategory.defaultIncomeValues)
    Iterable<TransactionIncomeCategory> availableIncomeCategories,
  }) = _TransactionsListState;

  factory TransactionsListState.fromJson(Map<String, dynamic> json) =>
      _$TransactionsListStateFromJson(json);
}

extension TransactionsListStateHelper on TransactionsListState {
  Iterable<TransactionEntity> get incomeTransitions => transactions.where(
        (item) => item.type == TransactionType.income,
      );

  Iterable<TransactionEntity> get expenditureTransitions => transactions.where(
        (item) => item.type == TransactionType.expenditure,
      );

  num get totalIncome => incomeTransitions.fold(
      0, (previousValue, element) => (previousValue + element.amount));

  num get totalExpenditure => expenditureTransitions.fold(
      0, (previousValue, element) => (previousValue + element.amount));

  Iterable<TransactionCategory> get availableCategories => [
        ...availableExpenditureCategories,
        ...availableIncomeCategories,
      ];

  Set<int> get transactionsMonthsList =>
      transactions.map((e) => e.date.month).toSet();

  Map<int, Iterable<TransactionEntity>> get transactionsByDates {
    final months = transactionsMonthsList;
    final Map<int, Iterable<TransactionEntity>> monthsMap = {};

    for (final month in months) {
      monthsMap.addAll({
        month: transactions.where(
          (item) => item.date.month == month,
        ),
      });
    }
    return monthsMap;
  }
}
