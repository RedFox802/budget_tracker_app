import 'package:budget_tracker_app/common/domain/transition_list/cubit/state/transactions_list_state.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/filter/filter_bundle.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uuid/uuid.dart';

@LazySingleton()
class TransactionsListCubit extends HydratedCubit<TransactionsListState> {
  TransactionsListCubit() : super(const TransactionsListState());

  @override
  TransactionsListState? fromJson(Map<String, dynamic> json) {
    final cachedState = TransactionsListState.fromJson(json);
    if (cachedState.filteredTransactions.isEmpty) {
      return cachedState.copyWith(
        filteredTransactions: cachedState.transactions,
      );
    }
    return cachedState;
  }

  @override
  Map<String, dynamic>? toJson(TransactionsListState state) {
    return state.toJson();
  }

  void init() {
    emit(state.copyWith(transactions: []));
  }

  void resetSearchedTransactions() {
    emit(
      state.copyWith(
        searchedTransactions: state.transactions,
      ),
    );
  }

  void searchTransactionByName(String? name) {
    emit(
      state.copyWith(
        searchedTransactions: state.transactions.where(
          (e) => e.name.startsWith(name ?? ''),
        ),
      ),
    );
  }

  void fetchFilteredData(FilterBundle filterBundle) {
    if (filterBundle.isEmptyFilters) {
      return emit(
        state.copyWith(
          filterBundle: null,
          filteredTransactions: state.transactions,
        ),
      );
    }

    List<TransactionEntity> currentFilteredData = state.transactions.toList();
    if (filterBundle.category != null) {
      currentFilteredData.removeWhere(
        (e) => e.category != filterBundle.category,
      );
    }
    if (filterBundle.date != null) {
      currentFilteredData.removeWhere(
        (e) => e.date != filterBundle.date,
      );
    }
    if (filterBundle.type != null) {
      currentFilteredData.removeWhere(
        (e) => e.type != filterBundle.type,
      );
    }
    emit(
      state.copyWith(
        filterBundle: filterBundle,
        filteredTransactions: currentFilteredData,
      ),
    );
  }

  void deleteTransaction(TransactionEntity transaction) {
    final transactionList = state.transactions.toList();
    if (transactionList.contains(transaction)) {
      transactionList.remove(transaction);
      final filteredList = state.filteredTransactions.toList();
      if (filteredList.contains(transaction)) {
        filteredList.remove(transaction);
      }
      emit(state.copyWith(
        transactions: transactionList,
        filteredTransactions: filteredList,
      ));
    }
  }

  void addTransaction(TransactionEntity transaction) {
    final currentTransactionList =
        List<TransactionEntity>.from(state.transactions);

    final filteredList = state.filteredTransactions.toList();

    final elementIndex =
        currentTransactionList.indexWhere((e) => e.id == transaction.id);

    if (elementIndex >= 0) {
      currentTransactionList
        ..removeAt(elementIndex)
        ..insert(elementIndex, transaction);

      final filteredElementIndex = filteredList.indexWhere(
        (e) => e.id == transaction.id,
      );

      if (filteredElementIndex >= 0) {
        filteredList
          ..removeAt(filteredElementIndex)
          ..insert(filteredElementIndex, transaction);
      }

      emit(state.copyWith(
        transactions: currentTransactionList,
        filteredTransactions: filteredList,
      ));
    } else {
      final newTransaction = transaction.copyWith(
        id: const Uuid().v4(),
      );

      final filterBundle = state.filterBundle;
      if (filterBundle != null) {
        final filterType = filterBundle.type;
        final filterDate = filterBundle.date;
        final filterCategory = filterBundle.category;

        final isTypeValid =
            filterType == null || filterType == newTransaction.type;
        final isCategoryValid =
            filterCategory == null || filterCategory == newTransaction.category;
        final isDateValid =
            filterDate == null || filterDate == newTransaction.date;

        if (isTypeValid && isCategoryValid && isDateValid) {
          filteredList.add(newTransaction);
        }
      }

      emit(
        state.copyWith(
          transactions: [...state.transactions, newTransaction],
          filteredTransactions: filteredList,
        ),
      );
    }
  }
}
