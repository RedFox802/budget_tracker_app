import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_limit.freezed.dart';

part 'category_limit.g.dart';

@freezed
class CategoryLimit with _$CategoryLimit {
  const factory CategoryLimit({
    required DateTime installationDate,
    required num limit,
  }) = _CategoryLimit;

  factory CategoryLimit.fromJson(Map<String, dynamic> json) =>
      _$CategoryLimitFromJson(json);
}
