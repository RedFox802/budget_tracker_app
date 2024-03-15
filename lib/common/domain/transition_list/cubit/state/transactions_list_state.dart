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
  Iterable<TransactionCategory> get availableCategories => [
        ...availableExpenditureCategories,
        ...availableIncomeCategories,
      ];
}
