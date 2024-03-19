// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterBundle {
  TransactionType? get type => throw _privateConstructorUsedError;
  TransactionCategory? get category => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterBundleCopyWith<FilterBundle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterBundleCopyWith<$Res> {
  factory $FilterBundleCopyWith(
          FilterBundle value, $Res Function(FilterBundle) then) =
      _$FilterBundleCopyWithImpl<$Res, FilterBundle>;
  @useResult
  $Res call(
      {TransactionType? type, TransactionCategory? category, DateTime? date});

  $TransactionCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$FilterBundleCopyWithImpl<$Res, $Val extends FilterBundle>
    implements $FilterBundleCopyWith<$Res> {
  _$FilterBundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? category = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $TransactionCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FilterBundleCopyWith<$Res>
    implements $FilterBundleCopyWith<$Res> {
  factory _$$_FilterBundleCopyWith(
          _$_FilterBundle value, $Res Function(_$_FilterBundle) then) =
      __$$_FilterBundleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransactionType? type, TransactionCategory? category, DateTime? date});

  @override
  $TransactionCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$_FilterBundleCopyWithImpl<$Res>
    extends _$FilterBundleCopyWithImpl<$Res, _$_FilterBundle>
    implements _$$_FilterBundleCopyWith<$Res> {
  __$$_FilterBundleCopyWithImpl(
      _$_FilterBundle _value, $Res Function(_$_FilterBundle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? category = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_FilterBundle(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_FilterBundle implements _FilterBundle {
  const _$_FilterBundle({this.type, this.category, this.date});

  @override
  final TransactionType? type;
  @override
  final TransactionCategory? category;
  @override
  final DateTime? date;

  @override
  String toString() {
    return 'FilterBundle(type: $type, category: $category, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterBundle &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, category, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterBundleCopyWith<_$_FilterBundle> get copyWith =>
      __$$_FilterBundleCopyWithImpl<_$_FilterBundle>(this, _$identity);
}

abstract class _FilterBundle implements FilterBundle {
  const factory _FilterBundle(
      {final TransactionType? type,
      final TransactionCategory? category,
      final DateTime? date}) = _$_FilterBundle;

  @override
  TransactionType? get type;
  @override
  TransactionCategory? get category;
  @override
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$_FilterBundleCopyWith<_$_FilterBundle> get copyWith =>
      throw _privateConstructorUsedError;
}
