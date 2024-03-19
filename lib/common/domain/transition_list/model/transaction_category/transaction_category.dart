import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_category.freezed.dart';

part 'transaction_category.g.dart';

@freezed
sealed class TransactionCategory with _$TransactionCategory {
  const factory TransactionCategory.expenditureCategory({
    required String name,
    @Default(0) num amount,
    num? limit,
  }) = TransactionExpenditureCategory;

  const factory TransactionCategory.incomeCategory({
    required String name,
    @Default(0) num amount,
  }) = TransactionIncomeCategory;

  factory TransactionCategory.fromJson(Map<String, dynamic> json) =>
      _$TransactionCategoryFromJson(json);

  static const food = TransactionExpenditureCategory(
    name: 'Покупка продуктов питания',
    limit: 1200,
    amount: 1000,
  );
  static const travel = TransactionExpenditureCategory(
    name: 'Путешествия',
    limit: 800,
    amount: 1200,
  );
  static const activity = TransactionExpenditureCategory(
    name: 'Развлечения',
  );

  static const house = TransactionExpenditureCategory(
    name: 'Хозяйственные расходы',
  );

  static const medicine = TransactionExpenditureCategory(
    name: 'Здоровье',
  );

  static const family = TransactionExpenditureCategory(
    name: 'Семейные расходы',
  );

  static const gadgets = TransactionExpenditureCategory(
    name: 'Техника',
  );

  static const gifts = TransactionExpenditureCategory(
    name: 'Подарки',
  );

  static const service = TransactionExpenditureCategory(
    name: 'Услуги',
  );

  static const clothes = TransactionExpenditureCategory(
    name: 'Одежда',
  );

  static const salary = TransactionIncomeCategory(
    name: 'Заработная плата',
  );

  static const additionIncome = TransactionIncomeCategory(
    name: 'Дополнительный доход',
  );

  static const passiveIncome = TransactionIncomeCategory(
    name: 'Пассивный доход',
  );

  static const giftIncome = TransactionIncomeCategory(
    name: 'Подарок',
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

extension TransactionExpenditureCategoryHelper
    on TransactionExpenditureCategory {
  bool get isLimitExceeded {
    if (limit == null) return false;

    return amount > limit!;
  }

  bool get hasExceedingLimitThreat {
    if (limit == null) return false;

    return (limit! - amount) < limit! * 0.15;
  }

  String get formattedAmount {
    return '$amount ₽';
  }

  String get formattedLimit {
    if (limit == null) return '';

    return 'Лимит $limit ₽';
  }

  double? get percentageSpent {
    if (limit == null) return null;

    final percentage = amount / limit!;
    return percentage > 1 ? 1 : percentage;
  }
}
