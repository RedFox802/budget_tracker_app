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
    name: 'Покупка еды',
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

  static const salary = TransactionIncomeCategory(
    name: 'Заработная плата',
  );

  static const defaultExpenditureValues = [
    food,
    travel,
    activity,
  ];

  static const defaultIncomeValues = [
    salary,
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
