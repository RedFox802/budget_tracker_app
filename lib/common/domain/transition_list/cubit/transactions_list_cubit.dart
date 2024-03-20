import 'package:budget_tracker_app/common/domain/transition_list/state/transactions_list_state.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/filter/filter_bundle.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/category_limit/category_limit.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
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
    emit(
      state.copyWith(
        transactions: [],
        limitedExpenditureCategories: [],
        availableIncomeCategories: TransactionCategory.defaultIncomeValues,
        availableExpenditureCategories:
            TransactionCategory.defaultExpenditureValues,
      ),
    );
  }

  void setCategoryLimit({
    required TransactionExpenditureCategory category,
    required int? limit,
  }) {
    final currentCategory = state.availableExpenditureCategories.singleWhere(
      (e) => e.id == category.id,
    );

    final categoryWithLimit = currentCategory.copyWith(
      limitEntity: limit == null
          ? null
          : CategoryLimit(
              installationDate: DateTime.now(),
              limit: limit,
            ),
    );
    final limitedCategories = state.limitedExpenditureCategories.toList();
    final index = limitedCategories.indexWhere((e) => e.id == category.id);
    if (limit == null) {
      limitedCategories.removeAt(index);
    } else {
      if (index >= 0) {
        limitedCategories
          ..removeAt(index)
          ..insert(index, categoryWithLimit);
      } else {
        limitedCategories.add(categoryWithLimit);
      }
    }
    emit(
      state.copyWith(
        limitedExpenditureCategories: limitedCategories,
      ),
    );
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
      final searchedList = state.searchedTransactions.toList();

      if (filteredList.contains(transaction)) {
        filteredList.remove(transaction);
      }
      if (searchedList.contains(transaction)) {
        searchedList.remove(transaction);
      }
      emit(state.copyWith(
        transactions: transactionList,
        filteredTransactions: filteredList,
        searchedTransactions: searchedList,
      ));

      _changeCategoryAmount(
        category: transaction.category,
        value: transaction.amount,
        isAdding: false,
      );
    }
  }

  void addTransaction(TransactionEntity transaction) {
    final currentTransactionList =
        List<TransactionEntity>.from(state.transactions);

    final filteredList = state.filteredTransactions.toList();
    final searchedList = state.searchedTransactions.toList();

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

      final searchedElementIndex = searchedList.indexWhere(
        (e) => e.id == transaction.id,
      );

      if (searchedElementIndex >= 0) {
        searchedList
          ..removeAt(searchedElementIndex)
          ..insert(searchedElementIndex, transaction);
      }

      emit(state.copyWith(
        transactions: currentTransactionList,
        filteredTransactions: filteredList,
        searchedTransactions: searchedList,
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
      } else {
        filteredList.add(newTransaction);
      }

      final searchedElementIndex = searchedList.indexWhere(
        (e) => e.id == transaction.id,
      );

      if (searchedElementIndex >= 0) {
        searchedList
          ..removeAt(searchedElementIndex)
          ..insert(searchedElementIndex, transaction);
      }

      emit(
        state.copyWith(
          transactions: [...state.transactions, newTransaction],
          filteredTransactions: filteredList,
          searchedTransactions: searchedList,
        ),
      );
    }

    _changeCategoryAmount(
      category: transaction.category,
      value: transaction.amount,
      isAdding: true,
    );
  }

  void _changeCategoryAmount({
    required TransactionCategory category,
    required num value,
    required bool isAdding,
  }) {
    final currentAmount = category.amount;
    final newAmount = isAdding ? currentAmount + value : currentAmount - value;

    if (category is TransactionExpenditureCategory) {
      final categoryList = state.availableExpenditureCategories.toList();
      final limitedCategoryList = state.limitedExpenditureCategories.toList();

      final index = categoryList.indexWhere(
        (e) => e.id == category.id,
      );

      final limitedIndex = limitedCategoryList.indexWhere(
        (e) => e.id == category.id,
      );

      if (limitedIndex >= 0) {
        final currentCategory = limitedCategoryList.elementAt(limitedIndex);
        final currentAmount = currentCategory.amount;
        final newCategory = currentCategory.copyWith(
          amount: currentAmount + value,
        );

        limitedCategoryList
          ..removeAt(limitedIndex)
          ..insert(limitedIndex, newCategory);
      }

      if (index >= 0) {
        final currentCategory = categoryList.elementAt(index);
        final currentAmount = currentCategory.amount;
        final newCategory = currentCategory.copyWith(
          amount: currentAmount + value,
        );

        categoryList
          ..removeAt(index)
          ..insert(index, newCategory);
      }

      emit(
        state.copyWith(
          availableExpenditureCategories: categoryList,
          limitedExpenditureCategories: limitedCategoryList,
        ),
      );
    }

    if (category is TransactionIncomeCategory) {
      final categoryList = state.availableIncomeCategories.toList();

      final index = categoryList.indexWhere(
        (e) => e.id == category.id,
      );
      if (index >= 0) {
        categoryList
          ..removeAt(index)
          ..insert(index, category.copyWith(amount: newAmount));
      }

      emit(
        state.copyWith(
          availableIncomeCategories: categoryList,
        ),
      );
    }
  }
}
