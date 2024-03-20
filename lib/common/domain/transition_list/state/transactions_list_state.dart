// ignore_for_file:invalid_annotation_target
import 'dart:math';

import 'package:budget_tracker_app/common/domain/transition_list/model/filter/filter_bundle.dart';
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
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    Iterable<TransactionEntity> filteredTransactions,
    @JsonKey(includeFromJson: false, includeToJson: false)
    FilterBundle? filterBundle,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    Iterable<TransactionEntity> searchedTransactions,
    @Default(TransactionCategory.defaultExpenditureValues)
    Iterable<TransactionExpenditureCategory> availableExpenditureCategories,
    @Default(TransactionCategory.defaultIncomeValues)
    Iterable<TransactionIncomeCategory> availableIncomeCategories,
    @Default([])
    Iterable<TransactionExpenditureCategory> limitedExpenditureCategories,
  }) = _TransactionsListState;

  factory TransactionsListState.fromJson(Map<String, dynamic> json) =>
      _$TransactionsListStateFromJson(json);
}

extension LimitedExpenditureCategoriesHelper on TransactionsListState {
  bool get hasExceedingLimitThreatCategories =>
      limitedExpenditureCategories.any(
        (element) => element.hasExceedingLimitThreat,
      );

  bool get hasLimitExceededCategories => limitedExpenditureCategories.any(
        (element) => element.isLimitExceeded,
      );

  Iterable<TransactionExpenditureCategory> get exceedingLimitThreatCategories =>
      limitedExpenditureCategories.where(
        (element) => element.hasExceedingLimitThreat,
      );

  Iterable<TransactionExpenditureCategory> get limitExceededCategories =>
      limitedExpenditureCategories.where(
        (element) => element.isLimitExceeded,
      );

  Iterable<TransactionExpenditureCategory> get noLimitedExpenditureCategories {
    return availableExpenditureCategories.toSet().difference(
          limitedExpenditureCategories.toSet(),
        );
  }
}

extension TransactionsListHelper on TransactionsListState {
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
    final formattedMonthAndYearList = filteredTransactions.map((e) {
      final date = e.date;
      return (date, '${DateTimeUtils.getMonthName(date.month)} ${date.year}');
    }).toSet();

    final Map<String, Iterable<TransactionEntity>> transitionsByMonthYear = {};
    for (final formattedDate in formattedMonthAndYearList) {
      transitionsByMonthYear.addAll({
        formattedDate.$2: filteredTransactions.where((item) {
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
    final existCategories = transactions.map((e) => e.category).toSet();
    final categories = <TransactionExpenditureCategory>[];

    for (final item in existCategories) {
      if (item is TransactionExpenditureCategory &&
          categories.indexWhere((e) => e.id == item.id) == -1) {
        categories.add(item);
      }
    }

    for (final category in categories) {
      final amount = expenditureTransitions
          .where((e) => e.category == category)
          .fold<double>(0, (prValue, element) => prValue + element.amount);

      if (amount > 0) {
        result.addAll({category: amount});
      }
    }

    return result;
  }

  Set<int> getMonthsListByYear(int year) {
    final maxMonth = transactions
        .where((e) => e.date.year == year)
        .map((e) => e.date.month)
        .toSet()
        .fold(0, (prValue, item) => item > prValue ? item : prValue);

    return List.generate(min(maxMonth, 12), (index) => index + 1).toSet();
  }

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
