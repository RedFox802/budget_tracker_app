// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_limit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryLimit _$CategoryLimitFromJson(Map<String, dynamic> json) {
  return _CategoryLimit.fromJson(json);
}

/// @nodoc
mixin _$CategoryLimit {
  DateTime get installationDate => throw _privateConstructorUsedError;
  num get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryLimitCopyWith<CategoryLimit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryLimitCopyWith<$Res> {
  factory $CategoryLimitCopyWith(
          CategoryLimit value, $Res Function(CategoryLimit) then) =
      _$CategoryLimitCopyWithImpl<$Res, CategoryLimit>;
  @useResult
  $Res call({DateTime installationDate, num limit});
}

/// @nodoc
class _$CategoryLimitCopyWithImpl<$Res, $Val extends CategoryLimit>
    implements $CategoryLimitCopyWith<$Res> {
  _$CategoryLimitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? installationDate = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      installationDate: null == installationDate
          ? _value.installationDate
          : installationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryLimitCopyWith<$Res>
    implements $CategoryLimitCopyWith<$Res> {
  factory _$$_CategoryLimitCopyWith(
          _$_CategoryLimit value, $Res Function(_$_CategoryLimit) then) =
      __$$_CategoryLimitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime installationDate, num limit});
}

/// @nodoc
class __$$_CategoryLimitCopyWithImpl<$Res>
    extends _$CategoryLimitCopyWithImpl<$Res, _$_CategoryLimit>
    implements _$$_CategoryLimitCopyWith<$Res> {
  __$$_CategoryLimitCopyWithImpl(
      _$_CategoryLimit _value, $Res Function(_$_CategoryLimit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? installationDate = null,
    Object? limit = null,
  }) {
    return _then(_$_CategoryLimit(
      installationDate: null == installationDate
          ? _value.installationDate
          : installationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryLimit implements _CategoryLimit {
  const _$_CategoryLimit({required this.installationDate, required this.limit});

  factory _$_CategoryLimit.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryLimitFromJson(json);

  @override
  final DateTime installationDate;
  @override
  final num limit;

  @override
  String toString() {
    return 'CategoryLimit(installationDate: $installationDate, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryLimit &&
            (identical(other.installationDate, installationDate) ||
                other.installationDate == installationDate) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, installationDate, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryLimitCopyWith<_$_CategoryLimit> get copyWith =>
      __$$_CategoryLimitCopyWithImpl<_$_CategoryLimit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryLimitToJson(
      this,
    );
  }
}

abstract class _CategoryLimit implements CategoryLimit {
  const factory _CategoryLimit(
      {required final DateTime installationDate,
      required final num limit}) = _$_CategoryLimit;

  factory _CategoryLimit.fromJson(Map<String, dynamic> json) =
      _$_CategoryLimit.fromJson;

  @override
  DateTime get installationDate;
  @override
  num get limit;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryLimitCopyWith<_$_CategoryLimit> get copyWith =>
      throw _privateConstructorUsedError;
}
