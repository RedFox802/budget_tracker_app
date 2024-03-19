import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_entity.freezed.dart';

part 'transaction_entity.g.dart';

@JsonEnum(valueField: 'type')
enum TransactionType {
  expenditure('расход'),
  income('доход');

  const TransactionType(this.type);

  final String type;
}

@freezed
class TransactionEntity with _$TransactionEntity {
  const factory TransactionEntity({
    required TransactionType type,
    required String id,
    required num amount,
    required TransactionCategory category,
    required String name,
    required DateTime date,
  }) = _TransactionEntity;

  factory TransactionEntity.fromJson(Map<String, dynamic> json) =>
      _$TransactionEntityFromJson(json);
}

extension TransactionEntityHelper on TransactionEntity {
  String get formattedAmount {
    String transactionPrefix = type == TransactionType.income ? '+' : '-';
    return '$transactionPrefix $amount ₽';
  }
}
