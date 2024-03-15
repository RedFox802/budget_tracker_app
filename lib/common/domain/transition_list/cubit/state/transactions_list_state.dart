import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions_list_state.g.dart';

part 'transactions_list_state.freezed.dart';

@freezed
class TransactionsListState with _$TransactionsListState {
  const factory TransactionsListState({
    @Default([]) Iterable<TransactionEntity> transactions,
  }) = _TransactionsListState;

  factory TransactionsListState.fromJson(Map<String, dynamic> json) =>
      _$TransactionsListStateFromJson(json);
}
