import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/state/transactions_list_state.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/common/presentation/component/app_bar/custom_app_bar.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/feature/transaction_limit/presentation/component/limit_list_tile.dart';
import 'package:budget_tracker_app/router/app_router.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EditLimitsScreen extends StatelessWidget {
  const EditLimitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listenableState = context.watch<TransactionsListCubit>().state;
    final limitedCategories = listenableState.limitedExpenditureCategories;
    final noLimitedCategories = listenableState.noLimitedExpenditureCategories;

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: const CustomAppBar(
        title: 'Лимиты по категориям',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...limitedCategories.map((limitedItem) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: CardCircularBorderAllWrapper(
                padding: const EdgeInsets.all(16),
                child: LimitListTile(
                  category: limitedItem,
                  onTap: () => _onCategoryTap(context, category: limitedItem),
                ),
              ),
            );
          }).toList(),
          ...noLimitedCategories.map((noLimitedItem) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: CardCircularBorderAllWrapper(
                padding: const EdgeInsets.all(16),
                child: LimitListTile(
                  category: noLimitedItem,
                  onTap: () => _onCategoryTap(context, category: noLimitedItem),
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }

  void _onCategoryTap(
    BuildContext context, {
    required TransactionExpenditureCategory category,
  }) {
    context.router.push(
      EditLimitRoute(category: category),
    );
  }
}
