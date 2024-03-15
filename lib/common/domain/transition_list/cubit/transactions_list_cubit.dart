import 'package:budget_tracker_app/common/domain/transition_list/cubit/state/transactions_list_state.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

@LazySingleton()
class TransactionsListCubit extends HydratedCubit<TransactionsListState> {
  TransactionsListCubit() : super(const TransactionsListState());

  @override
  TransactionsListState? fromJson(Map<String, dynamic> json) {
    return TransactionsListState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TransactionsListState state) {
    return state.toJson();
  }

  void addTransaction(TransactionEntity transaction) {
    emit(
      state.copyWith(
        transactions: [...state.transactions, transaction],
      ),
    );
  }
}
