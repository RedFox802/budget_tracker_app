// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionExpenditureCategory _$$TransactionExpenditureCategoryFromJson(
        Map<String, dynamic> json) =>
    _$TransactionExpenditureCategory(
      name: json['name'] as String,
      id: json['id'] as String,
      amount: json['amount'] as num? ?? 0,
      limitEntity: json['limitEntity'] == null
          ? null
          : CategoryLimit.fromJson(json['limitEntity'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TransactionExpenditureCategoryToJson(
        _$TransactionExpenditureCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'amount': instance.amount,
      'limitEntity': instance.limitEntity,
      'runtimeType': instance.$type,
    };

_$TransactionIncomeCategory _$$TransactionIncomeCategoryFromJson(
        Map<String, dynamic> json) =>
    _$TransactionIncomeCategory(
      name: json['name'] as String,
      id: json['id'] as String,
      amount: json['amount'] as num? ?? 0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TransactionIncomeCategoryToJson(
        _$TransactionIncomeCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'amount': instance.amount,
      'runtimeType': instance.$type,
    };
