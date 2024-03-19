// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionEntity _$TransactionEntityFromJson(Map<String, dynamic> json) {
  return _TransactionEntity.fromJson(json);
}

/// @nodoc
mixin _$TransactionEntity {
  TransactionType get type => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  TransactionCategory get category => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionEntityCopyWith<TransactionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionEntityCopyWith<$Res> {
  factory $TransactionEntityCopyWith(
          TransactionEntity value, $Res Function(TransactionEntity) then) =
      _$TransactionEntityCopyWithImpl<$Res, TransactionEntity>;
  @useResult
  $Res call(
      {TransactionType type,
      String id,
      num amount,
      TransactionCategory category,
      String name,
      DateTime date});

  $TransactionCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$TransactionEntityCopyWithImpl<$Res, $Val extends TransactionEntity>
    implements $TransactionEntityCopyWith<$Res> {
  _$TransactionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? amount = null,
    Object? category = null,
    Object? name = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionCategoryCopyWith<$Res> get category {
    return $TransactionCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionEntityCopyWith<$Res>
    implements $TransactionEntityCopyWith<$Res> {
  factory _$$_TransactionEntityCopyWith(_$_TransactionEntity value,
          $Res Function(_$_TransactionEntity) then) =
      __$$_TransactionEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransactionType type,
      String id,
      num amount,
      TransactionCategory category,
      String name,
      DateTime date});

  @override
  $TransactionCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$_TransactionEntityCopyWithImpl<$Res>
    extends _$TransactionEntityCopyWithImpl<$Res, _$_TransactionEntity>
    implements _$$_TransactionEntityCopyWith<$Res> {
  __$$_TransactionEntityCopyWithImpl(
      _$_TransactionEntity _value, $Res Function(_$_TransactionEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? amount = null,
    Object? category = null,
    Object? name = null,
    Object? date = null,
  }) {
    return _then(_$_TransactionEntity(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionEntity implements _TransactionEntity {
  const _$_TransactionEntity(
      {required this.type,
      required this.id,
      required this.amount,
      required this.category,
      required this.name,
      required this.date});

  factory _$_TransactionEntity.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionEntityFromJson(json);

  @override
  final TransactionType type;
  @override
  final String id;
  @override
  final num amount;
  @override
  final TransactionCategory category;
  @override
  final String name;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'TransactionEntity(type: $type, id: $id, amount: $amount, category: $category, name: $name, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionEntity &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, id, amount, category, name, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionEntityCopyWith<_$_TransactionEntity> get copyWith =>
      __$$_TransactionEntityCopyWithImpl<_$_TransactionEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionEntityToJson(
      this,
    );
  }
}

abstract class _TransactionEntity implements TransactionEntity {
  const factory _TransactionEntity(
      {required final TransactionType type,
      required final String id,
      required final num amount,
      required final TransactionCategory category,
      required final String name,
      required final DateTime date}) = _$_TransactionEntity;

  factory _TransactionEntity.fromJson(Map<String, dynamic> json) =
      _$_TransactionEntity.fromJson;

  @override
  TransactionType get type;
  @override
  String get id;
  @override
  num get amount;
  @override
  TransactionCategory get category;
  @override
  String get name;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionEntityCopyWith<_$_TransactionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
