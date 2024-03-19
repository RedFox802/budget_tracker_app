// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionsListState _$$_TransactionsListStateFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionsListState(
      transactions: (json['transactions'] as List<dynamic>?)?.map(
              (e) => TransactionEntity.fromJson(e as Map<String, dynamic>)) ??
          const [],
      availableExpenditureCategories:
          (json['availableExpenditureCategories'] as List<dynamic>?)?.map((e) =>
                  TransactionExpenditureCategory.fromJson(
                      e as Map<String, dynamic>)) ??
              TransactionCategory.defaultExpenditureValues,
      availableIncomeCategories:
          (json['availableIncomeCategories'] as List<dynamic>?)?.map((e) =>
                  TransactionIncomeCategory.fromJson(
                      e as Map<String, dynamic>)) ??
              TransactionCategory.defaultIncomeValues,
    );

Map<String, dynamic> _$$_TransactionsListStateToJson(
        _$_TransactionsListState instance) =>
    <String, dynamic>{
      'transactions': instance.transactions.toList(),
      'availableExpenditureCategories':
          instance.availableExpenditureCategories.toList(),
      'availableIncomeCategories': instance.availableIncomeCategories.toList(),
    };
