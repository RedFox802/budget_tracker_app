import 'package:budget_tracker_app/common/domain/transition_list/model/category_limit/category_limit.dart';
import 'package:budget_tracker_app/utils/string_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_category.freezed.dart';

part 'transaction_category.g.dart';

@freezed
sealed class TransactionCategory with _$TransactionCategory {
  const factory TransactionCategory.expenditureCategory({
    required String name,
    required String id,
    @Default(0) num amount,
    CategoryLimit? limitEntity,
  }) = TransactionExpenditureCategory;

  const factory TransactionCategory.incomeCategory({
    required String name,
    required String id,
    @Default(0) num amount,
  }) = TransactionIncomeCategory;

  factory TransactionCategory.fromJson(Map<String, dynamic> json) =>
      _$TransactionCategoryFromJson(json);

  static const food = TransactionExpenditureCategory(
    name: 'Продукты',
    id: 'food',
  );
  static const travel = TransactionExpenditureCategory(
    name: 'Путешествия',
    id: 'travel',
  );
  static const activity = TransactionExpenditureCategory(
    name: 'Развлечения',
    id: 'activity',
  );

  static const house = TransactionExpenditureCategory(
    name: 'Хозяйство',
    id: 'house',
  );

  static const medicine = TransactionExpenditureCategory(
    name: 'Здоровье',
    id: 'medicine',
  );

  static const family = TransactionExpenditureCategory(
    name: 'Семья',
    id: 'family',
  );

  static const gadgets = TransactionExpenditureCategory(
    name: 'Техника',
    id: 'gadgets',
  );

  static const gifts = TransactionExpenditureCategory(
    name: 'Подарки',
    id: 'gifts',
  );

  static const service = TransactionExpenditureCategory(
    name: 'Услуги',
    id: 'services',
  );

  static const clothes = TransactionExpenditureCategory(
    name: 'Одежда',
    id: 'clothes',
  );

  static const salary = TransactionIncomeCategory(
    name: 'Заработная плата',
    id: 'salary',
  );

  static const additionIncome = TransactionIncomeCategory(
    name: 'Дополнительный доход',
    id: 'addition_income',
  );

  static const passiveIncome = TransactionIncomeCategory(
    name: 'Пассивный доход',
    id: 'passive_income',
  );

  static const giftIncome = TransactionIncomeCategory(
    name: 'Подарок',
    id: 'your_gift',
  );

  static const defaultExpenditureValues = [
    food,
    travel,
    activity,
    house,
    medicine,
    family,
    gadgets,
    gifts,
    service,
    clothes,
  ];

  static const defaultIncomeValues = [
    salary,
    additionIncome,
    passiveIncome,
    giftIncome,
  ];
}

extension ExpenditureCategoriesFormattingHelper
    on TransactionExpenditureCategory {
  String get formattedAmount {
    return StringUtils.getMoneyFormattedString('$amount');
  }

  String get formattedLimit {
    final limitValue = limitEntity?.limit;
    return limitValue == null
        ? ''
        : StringUtils.getMoneyFormattedString('$limitValue');
  }

  String get formattedLimitWithLabel {
    final limitValue = limitEntity?.limit;
    return limitValue == null
        ? ''
        : StringUtils.getMoneyFormattedString('Лимит $limitValue');
  }
}

extension ExpenditureCategoriesLimitsCalculationHelper
    on TransactionExpenditureCategory {
  bool get hasLimit => limitEntity != null;

  bool get isLimitExceeded {
    if (!hasLimit) return false;

    return amount > limitEntity!.limit;
  }

  bool get hasExceedingLimitThreat {
    if (!hasLimit) return false;

    final limitValue = limitEntity!.limit;
    return (limitValue - amount) < limitValue * 0.15;
  }

  double? get percentageSpent {
    if (!hasLimit) return null;

    final percentage = amount / limitEntity!.limit;
    return percentage > 1 ? 1 : percentage;
  }
}
