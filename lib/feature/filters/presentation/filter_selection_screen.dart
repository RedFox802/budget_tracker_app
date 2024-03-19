import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/filter/filter_bundle.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/common/presentation/component/app_bar/custom_app_bar.dart';
import 'package:budget_tracker_app/common/presentation/component/button/app_elevated_button.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_top_border_wrapper.dart';
import 'package:budget_tracker_app/di/service_locator.dart';
import 'package:budget_tracker_app/feature/edit_transaction/presentation/component/edit_transaction_catagory_card.dart';
import 'package:budget_tracker_app/feature/edit_transaction/presentation/component/edit_transaction_date_card.dart';
import 'package:budget_tracker_app/feature/edit_transaction/presentation/component/edit_transaction_type_card.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FilterSelectionScreen extends StatefulWidget {
  const FilterSelectionScreen({super.key});

  @override
  State<FilterSelectionScreen> createState() => _FilterSelectionScreenState();
}

class _FilterSelectionScreenState extends State<FilterSelectionScreen> {
  late Iterable<TransactionExpenditureCategory> availableExpenditureCategories;

  late Iterable<TransactionIncomeCategory> availableIncomeCategories;

  late FilterBundle selectedFilterBundle;

  @override
  void initState() {
    super.initState();

    final currentState = getIt<TransactionsListCubit>().state;
    final currentFilterBundle = currentState.filterBundle;

    availableExpenditureCategories =
        currentState.availableExpenditureCategories;

    availableIncomeCategories = currentState.availableIncomeCategories;

    if (currentFilterBundle != null) {
      selectedFilterBundle = currentFilterBundle;
    } else {
      selectedFilterBundle = const FilterBundle();
    }
  }

  Iterable<TransactionCategory> get availableCategoryList {
    if (selectedFilterBundle.type == TransactionType.expenditure) {
      return availableExpenditureCategories;
    }
    if (selectedFilterBundle.type == TransactionType.income) {
      availableIncomeCategories;
    }
    return [
      ...availableIncomeCategories,
      ...availableExpenditureCategories,
    ];
  }

  @override
  Widget build(BuildContext context) {
    const indent = SizedBox(height: 16);
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: const CustomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CardCircularTopBorderWrapper(
        borderColor: AppColors.primary40,
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: AppElevatedButton(
            title: 'Выбрать',
            onTap: _onSave,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        children: [
          EditTransactionTypeCard(
            title: 'Тип транзакции',
            needClearButton: true,
            selectedValue: selectedFilterBundle.type,
            onChanged: (TransactionType? value) {
              setState(() {
                selectedFilterBundle = selectedFilterBundle.copyWith(
                  type: value,
                  category: null,
                );
              });
            },
          ),
          indent,
          EditTransactionCategoryCard(
            title: 'Категория',
            enteringTitle: 'Выберите категорию',
            selectedCategory: selectedFilterBundle.category,
            needClearButton: true,
            availableCategory: availableCategoryList,
            onChanged: (value) {
              setState(() {
                selectedFilterBundle = selectedFilterBundle.copyWith(
                  category: value,
                );
              });
            },
          ),
          indent,
          EditTransactionDateCard(
            title: 'Дата проведения транзакции',
            enteringTitle: 'Выберите дату транзакции',
            selectedValue: selectedFilterBundle.date,
            needClearButton: true,
            onChanged: (value) {
              setState(() {
                selectedFilterBundle = selectedFilterBundle.copyWith(
                  date: value,
                );
              });
            },
          ),
        ],
      ),
    );
  }

  void _onSave() {
    getIt<TransactionsListCubit>().fetchFilteredData(
      selectedFilterBundle,
    );
    context.router.pop();
  }
}
