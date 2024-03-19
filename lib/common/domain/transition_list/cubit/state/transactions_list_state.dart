import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/utils/date_time_utils.dart';
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

  Map<String, Iterable<TransactionEntity>> get transactionsByMonthsAndYears {
    final formattedMonthAndYearList = transactions.map((e) {
      final date = e.date;
      return (date, '${DateTimeUtils.getMonthName(date.month)}.${date.year}');
    }).toSet();

    final Map<String, Iterable<TransactionEntity>> transitionsByMonthYear = {};
    for (final formattedDate in formattedMonthAndYearList) {
      transitionsByMonthYear.addAll({
        formattedDate.$2: transactions.where((item) {
          final currentDate = formattedDate.$1;
          final currentItemDate = item.date;
          return currentItemDate.month == currentDate.month &&
              currentItemDate.year == currentDate.year;
        }),
      });
    }
    return transitionsByMonthYear;
  }

  Map<int, double> get incomeTransactionsAmountsByLastYearMonths =>
      transactionsByLastYearMonths(incomeTransitions).map((key, list) {
        return MapEntry(
          key,
          list.fold(0, (prValue, item) => prValue + item.amount),
        );
      });

  Map<int, double> get expenditureTransactionsAmountsByLastYearMonths =>
      transactionsByLastYearMonths(expenditureTransitions).map((key, list) {
        return MapEntry(
          key,
          list.fold(0, (prValue, item) => prValue + item.amount),
        );
      });

  Map<TransactionExpenditureCategory, double>
      get expenditureTransactionsAmountsByCategories {
    final result = <TransactionExpenditureCategory, double>{};
    for (final category in availableExpenditureCategories) {
      result.addAll({
        category: expenditureTransitions
            .where((e) => e.category == category)
            .fold<double>(0, (prValue, element) => prValue + element.amount),
      });
    }
    return result;
  }

  Set<int> getMonthsListByYear(int year) => transactions
      .where((e) => e.date.year == year)
      .map((e) => e.date.month)
      .toSet();

  Map<int, Iterable<TransactionEntity>> transactionsByLastYearMonths(
    Iterable<TransactionEntity> transactions,
  ) {
    final year = DateTime.now().year;
    final months = getMonthsListByYear(year);

    final Map<int, Iterable<TransactionEntity>> result = {};
    for (final month in months) {
      result.addAll({
        month: transactions.where((item) {
          final currentItemDate = item.date;
          return currentItemDate.month == month && currentItemDate.year == year;
        })
      });
    }
    return result;
  }
}
