// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionsListState _$TransactionsListStateFromJson(
    Map<String, dynamic> json) {
  return _TransactionsListState.fromJson(json);
}

/// @nodoc
mixin _$TransactionsListState {
  Iterable<TransactionEntity> get transactions =>
      throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Iterable<TransactionEntity> get filteredTransactions =>
      throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  FilterBundle? get filterBundle => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Iterable<TransactionEntity> get searchedTransactions =>
      throw _privateConstructorUsedError;
  Iterable<TransactionExpenditureCategory> get availableExpenditureCategories =>
      throw _privateConstructorUsedError;
  Iterable<TransactionIncomeCategory> get availableIncomeCategories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionsListStateCopyWith<TransactionsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsListStateCopyWith<$Res> {
  factory $TransactionsListStateCopyWith(TransactionsListState value,
          $Res Function(TransactionsListState) then) =
      _$TransactionsListStateCopyWithImpl<$Res, TransactionsListState>;
  @useResult
  $Res call(
      {Iterable<TransactionEntity> transactions,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Iterable<TransactionEntity> filteredTransactions,
      @JsonKey(includeFromJson: false, includeToJson: false)
      FilterBundle? filterBundle,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Iterable<TransactionEntity> searchedTransactions,
      Iterable<TransactionExpenditureCategory> availableExpenditureCategories,
      Iterable<TransactionIncomeCategory> availableIncomeCategories});

  $FilterBundleCopyWith<$Res>? get filterBundle;
}

/// @nodoc
class _$TransactionsListStateCopyWithImpl<$Res,
        $Val extends TransactionsListState>
    implements $TransactionsListStateCopyWith<$Res> {
  _$TransactionsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? filteredTransactions = null,
    Object? filterBundle = freezed,
    Object? searchedTransactions = null,
    Object? availableExpenditureCategories = null,
    Object? availableIncomeCategories = null,
  }) {
    return _then(_value.copyWith(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as Iterable<TransactionEntity>,
      filteredTransactions: null == filteredTransactions
          ? _value.filteredTransactions
          : filteredTransactions // ignore: cast_nullable_to_non_nullable
              as Iterable<TransactionEntity>,
      filterBundle: freezed == filterBundle
          ? _value.filterBundle
          : filterBundle // ignore: cast_nullable_to_non_nullable
              as FilterBundle?,
      searchedTransactions: null == searchedTransactions
          ? _value.searchedTransactions
          : searchedTransactions // ignore: cast_nullable_to_non_nullable
              as Iterable<TransactionEntity>,
      availableExpenditureCategories: null == availableExpenditureCategories
          ? _value.availableExpenditureCategories
          : availableExpenditureCategories // ignore: cast_nullable_to_non_nullable
              as Iterable<TransactionExpenditureCategory>,
      availableIncomeCategories: null == availableIncomeCategories
          ? _value.availableIncomeCategories
          : availableIncomeCategories // ignore: cast_nullable_to_non_nullable
              as Iterable<TransactionIncomeCategory>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterBundleCopyWith<$Res>? get filterBundle {
    if (_value.filterBundle == null) {
      return null;
    }

    return $FilterBundleCopyWith<$Res>(_value.filterBundle!, (value) {
      return _then(_value.copyWith(filterBundle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionsListStateCopyWith<$Res>
    implements $TransactionsListStateCopyWith<$Res> {
  factory _$$_TransactionsListStateCopyWith(_$_TransactionsListState value,
          $Res Function(_$_TransactionsListState) then) =
      __$$_TransactionsListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Iterable<TransactionEntity> transactions,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Iterable<TransactionEntity> filteredTransactions,
      @JsonKey(includeFromJson: false, includeToJson: false)
      FilterBundle? filterBundle,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Iterable<TransactionEntity> searchedTransactions,
      Iterable<TransactionExpenditureCategory> availableExpenditureCategories,
      Iterable<TransactionIncomeCategory> availableIncomeCategories});

  @override
  $FilterBundleCopyWith<$Res>? get filterBundle;
}

/// @nodoc
class __$$_TransactionsListStateCopyWithImpl<$Res>
    extends _$TransactionsListStateCopyWithImpl<$Res, _$_TransactionsListState>
    implements _$$_TransactionsListStateCopyWith<$Res> {
  __$$_TransactionsListStateCopyWithImpl(_$_TransactionsListState _value,
      $Res Function(_$_TransactionsListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? filteredTransactions = null,
    Object? filterBundle = freezed,
    Object? searchedTransactions = null,
    Object? availableExpenditureCategories = null,
    Object? availableIncomeCategories = null,
  }) {
    return _then(_$_TransactionsListState(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as Iterable<TransactionEntity>,
      filteredTransactions: null == filteredTransactions
          ? _value.filteredTransactions
          : filteredTransactions // ignore: cast_nullable_to_non_nullable
              as Iterable<TransactionEntity>,
      filterBundle: freezed == filterBundle
          ? _value.filterBundle
          : filterBundle // ignore: cast_nullable_to_non_nullable
              as FilterBundle?,
      searchedTransactions: null == searchedTransactions
          ? _value.searchedTransactions
          : searchedTransactions // ignore: cast_nullable_to_non_nullable
              as Iterable<TransactionEntity>,
      availableExpenditureCategories: null == availableExpenditureCategories
          ? _value.availableExpenditureCategories
          : availableExpenditureCategories // ignore: cast_nullable_to_non_nullable
              as Iterable<TransactionExpenditureCategory>,
      availableIncomeCategories: null == availableIncomeCategories
          ? _value.availableIncomeCategories
          : availableIncomeCategories // ignore: cast_nullable_to_non_nullable
              as Iterable<TransactionIncomeCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionsListState implements _TransactionsListState {
  const _$_TransactionsListState(
      {this.transactions = const [],
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.filteredTransactions = const [],
      @JsonKey(includeFromJson: false, includeToJson: false) this.filterBundle,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.searchedTransactions = const [],
      this.availableExpenditureCategories =
          TransactionCategory.defaultExpenditureValues,
      this.availableIncomeCategories =
          TransactionCategory.defaultIncomeValues});

  factory _$_TransactionsListState.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionsListStateFromJson(json);

  @override
  @JsonKey()
  final Iterable<TransactionEntity> transactions;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Iterable<TransactionEntity> filteredTransactions;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final FilterBundle? filterBundle;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Iterable<TransactionEntity> searchedTransactions;
  @override
  @JsonKey()
  final Iterable<TransactionExpenditureCategory> availableExpenditureCategories;
  @override
  @JsonKey()
  final Iterable<TransactionIncomeCategory> availableIncomeCategories;

  @override
  String toString() {
    return 'TransactionsListState(transactions: $transactions, filteredTransactions: $filteredTransactions, filterBundle: $filterBundle, searchedTransactions: $searchedTransactions, availableExpenditureCategories: $availableExpenditureCategories, availableIncomeCategories: $availableIncomeCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionsListState &&
            const DeepCollectionEquality()
                .equals(other.transactions, transactions) &&
            const DeepCollectionEquality()
                .equals(other.filteredTransactions, filteredTransactions) &&
            (identical(other.filterBundle, filterBundle) ||
                other.filterBundle == filterBundle) &&
            const DeepCollectionEquality()
                .equals(other.searchedTransactions, searchedTransactions) &&
            const DeepCollectionEquality().equals(
                other.availableExpenditureCategories,
                availableExpenditureCategories) &&
            const DeepCollectionEquality().equals(
                other.availableIncomeCategories, availableIncomeCategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transactions),
      const DeepCollectionEquality().hash(filteredTransactions),
      filterBundle,
      const DeepCollectionEquality().hash(searchedTransactions),
      const DeepCollectionEquality().hash(availableExpenditureCategories),
      const DeepCollectionEquality().hash(availableIncomeCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionsListStateCopyWith<_$_TransactionsListState> get copyWith =>
      __$$_TransactionsListStateCopyWithImpl<_$_TransactionsListState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionsListStateToJson(
      this,
    );
  }
}

abstract class _TransactionsListState implements TransactionsListState {
  const factory _TransactionsListState(
      {final Iterable<TransactionEntity> transactions,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Iterable<TransactionEntity> filteredTransactions,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final FilterBundle? filterBundle,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Iterable<TransactionEntity> searchedTransactions,
      final Iterable<TransactionExpenditureCategory>
          availableExpenditureCategories,
      final Iterable<TransactionIncomeCategory>
          availableIncomeCategories}) = _$_TransactionsListState;

  factory _TransactionsListState.fromJson(Map<String, dynamic> json) =
      _$_TransactionsListState.fromJson;

  @override
  Iterable<TransactionEntity> get transactions;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Iterable<TransactionEntity> get filteredTransactions;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  FilterBundle? get filterBundle;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Iterable<TransactionEntity> get searchedTransactions;
  @override
  Iterable<TransactionExpenditureCategory> get availableExpenditureCategories;
  @override
  Iterable<TransactionIncomeCategory> get availableIncomeCategories;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionsListStateCopyWith<_$_TransactionsListState> get copyWith =>
      throw _privateConstructorUsedError;
}
