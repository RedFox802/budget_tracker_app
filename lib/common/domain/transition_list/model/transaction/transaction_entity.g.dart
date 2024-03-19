// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionEntity _$$_TransactionEntityFromJson(Map<String, dynamic> json) =>
    _$_TransactionEntity(
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      id: json['id'] as String,
      amount: json['amount'] as num,
      category: TransactionCategory.fromJson(
          json['category'] as Map<String, dynamic>),
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_TransactionEntityToJson(
        _$_TransactionEntity instance) =>
    <String, dynamic>{
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'id': instance.id,
      'amount': instance.amount,
      'category': instance.category,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
    };

const _$TransactionTypeEnumMap = {
  TransactionType.expenditure: 'расход',
  TransactionType.income: 'доход',
};
