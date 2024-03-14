import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static const small = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
    color: AppColors.textPrimary,
  );

  static const regular = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 16 / 14,
    color: AppColors.textPrimary,
  );

  static const large = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 20 / 16,
    color: AppColors.textPrimary,
  );

  static const smallDisabled = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
    color: AppColors.textSecondary,
  );

  static const regularDisabled = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 16 / 14,
    color: AppColors.textSecondary,
  );

  static const largeDisabled = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 20 / 16,
    color: AppColors.textSecondary,
  );
}
