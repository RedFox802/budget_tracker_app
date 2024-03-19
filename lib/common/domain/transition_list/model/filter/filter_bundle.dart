import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_bundle.freezed.dart';

@freezed
class FilterBundle with _$FilterBundle {
  const factory FilterBundle({
    TransactionType? type,
    TransactionCategory? category,
    DateTime? date,
  }) = _FilterBundle;
}

extension FilterBundleHelper on FilterBundle {
  bool get isEmptyFilters => type == null && category == null && date == null;
}
