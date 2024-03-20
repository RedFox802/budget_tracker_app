// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionCategory _$TransactionCategoryFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'expenditureCategory':
      return TransactionExpenditureCategory.fromJson(json);
    case 'incomeCategory':
      return TransactionIncomeCategory.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TransactionCategory',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TransactionCategory {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String id, num amount, CategoryLimit? limitEntity)
        expenditureCategory,
    required TResult Function(String name, String id, num amount)
        incomeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, String id, num amount, CategoryLimit? limitEntity)?
        expenditureCategory,
    TResult? Function(String name, String id, num amount)? incomeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name, String id, num amount, CategoryLimit? limitEntity)?
        expenditureCategory,
    TResult Function(String name, String id, num amount)? incomeCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionExpenditureCategory value)
        expenditureCategory,
    required TResult Function(TransactionIncomeCategory value) incomeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionExpenditureCategory value)?
        expenditureCategory,
    TResult? Function(TransactionIncomeCategory value)? incomeCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionExpenditureCategory value)? expenditureCategory,
    TResult Function(TransactionIncomeCategory value)? incomeCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCategoryCopyWith<TransactionCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCategoryCopyWith<$Res> {
  factory $TransactionCategoryCopyWith(
          TransactionCategory value, $Res Function(TransactionCategory) then) =
      _$TransactionCategoryCopyWithImpl<$Res, TransactionCategory>;
  @useResult
  $Res call({String name, String id, num amount});
}

/// @nodoc
class _$TransactionCategoryCopyWithImpl<$Res, $Val extends TransactionCategory>
    implements $TransactionCategoryCopyWith<$Res> {
  _$TransactionCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionExpenditureCategoryCopyWith<$Res>
    implements $TransactionCategoryCopyWith<$Res> {
  factory _$$TransactionExpenditureCategoryCopyWith(
          _$TransactionExpenditureCategory value,
          $Res Function(_$TransactionExpenditureCategory) then) =
      __$$TransactionExpenditureCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id, num amount, CategoryLimit? limitEntity});

  $CategoryLimitCopyWith<$Res>? get limitEntity;
}

/// @nodoc
class __$$TransactionExpenditureCategoryCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res,
        _$TransactionExpenditureCategory>
    implements _$$TransactionExpenditureCategoryCopyWith<$Res> {
  __$$TransactionExpenditureCategoryCopyWithImpl(
      _$TransactionExpenditureCategory _value,
      $Res Function(_$TransactionExpenditureCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? amount = null,
    Object? limitEntity = freezed,
  }) {
    return _then(_$TransactionExpenditureCategory(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      limitEntity: freezed == limitEntity
          ? _value.limitEntity
          : limitEntity // ignore: cast_nullable_to_non_nullable
              as CategoryLimit?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryLimitCopyWith<$Res>? get limitEntity {
    if (_value.limitEntity == null) {
      return null;
    }

    return $CategoryLimitCopyWith<$Res>(_value.limitEntity!, (value) {
      return _then(_value.copyWith(limitEntity: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionExpenditureCategory
    implements TransactionExpenditureCategory {
  const _$TransactionExpenditureCategory(
      {required this.name,
      required this.id,
      this.amount = 0,
      this.limitEntity,
      final String? $type})
      : $type = $type ?? 'expenditureCategory';

  factory _$TransactionExpenditureCategory.fromJson(
          Map<String, dynamic> json) =>
      _$$TransactionExpenditureCategoryFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  @JsonKey()
  final num amount;
  @override
  final CategoryLimit? limitEntity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TransactionCategory.expenditureCategory(name: $name, id: $id, amount: $amount, limitEntity: $limitEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionExpenditureCategory &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.limitEntity, limitEntity) ||
                other.limitEntity == limitEntity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, amount, limitEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionExpenditureCategoryCopyWith<_$TransactionExpenditureCategory>
      get copyWith => __$$TransactionExpenditureCategoryCopyWithImpl<
          _$TransactionExpenditureCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String id, num amount, CategoryLimit? limitEntity)
        expenditureCategory,
    required TResult Function(String name, String id, num amount)
        incomeCategory,
  }) {
    return expenditureCategory(name, id, amount, limitEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, String id, num amount, CategoryLimit? limitEntity)?
        expenditureCategory,
    TResult? Function(String name, String id, num amount)? incomeCategory,
  }) {
    return expenditureCategory?.call(name, id, amount, limitEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name, String id, num amount, CategoryLimit? limitEntity)?
        expenditureCategory,
    TResult Function(String name, String id, num amount)? incomeCategory,
    required TResult orElse(),
  }) {
    if (expenditureCategory != null) {
      return expenditureCategory(name, id, amount, limitEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionExpenditureCategory value)
        expenditureCategory,
    required TResult Function(TransactionIncomeCategory value) incomeCategory,
  }) {
    return expenditureCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionExpenditureCategory value)?
        expenditureCategory,
    TResult? Function(TransactionIncomeCategory value)? incomeCategory,
  }) {
    return expenditureCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionExpenditureCategory value)? expenditureCategory,
    TResult Function(TransactionIncomeCategory value)? incomeCategory,
    required TResult orElse(),
  }) {
    if (expenditureCategory != null) {
      return expenditureCategory(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionExpenditureCategoryToJson(
      this,
    );
  }
}

abstract class TransactionExpenditureCategory implements TransactionCategory {
  const factory TransactionExpenditureCategory(
      {required final String name,
      required final String id,
      final num amount,
      final CategoryLimit? limitEntity}) = _$TransactionExpenditureCategory;

  factory TransactionExpenditureCategory.fromJson(Map<String, dynamic> json) =
      _$TransactionExpenditureCategory.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  num get amount;
  CategoryLimit? get limitEntity;
  @override
  @JsonKey(ignore: true)
  _$$TransactionExpenditureCategoryCopyWith<_$TransactionExpenditureCategory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionIncomeCategoryCopyWith<$Res>
    implements $TransactionCategoryCopyWith<$Res> {
  factory _$$TransactionIncomeCategoryCopyWith(
          _$TransactionIncomeCategory value,
          $Res Function(_$TransactionIncomeCategory) then) =
      __$$TransactionIncomeCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id, num amount});
}

/// @nodoc
class __$$TransactionIncomeCategoryCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res, _$TransactionIncomeCategory>
    implements _$$TransactionIncomeCategoryCopyWith<$Res> {
  __$$TransactionIncomeCategoryCopyWithImpl(_$TransactionIncomeCategory _value,
      $Res Function(_$TransactionIncomeCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_$TransactionIncomeCategory(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionIncomeCategory implements TransactionIncomeCategory {
  const _$TransactionIncomeCategory(
      {required this.name,
      required this.id,
      this.amount = 0,
      final String? $type})
      : $type = $type ?? 'incomeCategory';

  factory _$TransactionIncomeCategory.fromJson(Map<String, dynamic> json) =>
      _$$TransactionIncomeCategoryFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  @JsonKey()
  final num amount;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TransactionCategory.incomeCategory(name: $name, id: $id, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionIncomeCategory &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionIncomeCategoryCopyWith<_$TransactionIncomeCategory>
      get copyWith => __$$TransactionIncomeCategoryCopyWithImpl<
          _$TransactionIncomeCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String id, num amount, CategoryLimit? limitEntity)
        expenditureCategory,
    required TResult Function(String name, String id, num amount)
        incomeCategory,
  }) {
    return incomeCategory(name, id, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, String id, num amount, CategoryLimit? limitEntity)?
        expenditureCategory,
    TResult? Function(String name, String id, num amount)? incomeCategory,
  }) {
    return incomeCategory?.call(name, id, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name, String id, num amount, CategoryLimit? limitEntity)?
        expenditureCategory,
    TResult Function(String name, String id, num amount)? incomeCategory,
    required TResult orElse(),
  }) {
    if (incomeCategory != null) {
      return incomeCategory(name, id, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionExpenditureCategory value)
        expenditureCategory,
    required TResult Function(TransactionIncomeCategory value) incomeCategory,
  }) {
    return incomeCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionExpenditureCategory value)?
        expenditureCategory,
    TResult? Function(TransactionIncomeCategory value)? incomeCategory,
  }) {
    return incomeCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionExpenditureCategory value)? expenditureCategory,
    TResult Function(TransactionIncomeCategory value)? incomeCategory,
    required TResult orElse(),
  }) {
    if (incomeCategory != null) {
      return incomeCategory(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionIncomeCategoryToJson(
      this,
    );
  }
}

abstract class TransactionIncomeCategory implements TransactionCategory {
  const factory TransactionIncomeCategory(
      {required final String name,
      required final String id,
      final num amount}) = _$TransactionIncomeCategory;

  factory TransactionIncomeCategory.fromJson(Map<String, dynamic> json) =
      _$TransactionIncomeCategory.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  num get amount;
  @override
  @JsonKey(ignore: true)
  _$$TransactionIncomeCategoryCopyWith<_$TransactionIncomeCategory>
      get copyWith => throw _privateConstructorUsedError;
}
