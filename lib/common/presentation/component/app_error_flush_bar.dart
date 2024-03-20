import 'package:another_flushbar/flushbar.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

void showFlushBarError(
  BuildContext context, {
  required String text,
}) {
  const padding = EdgeInsets.all(16);
  Flushbar(
    blockBackgroundInteraction: true,
    messageText: Text(
      text,
      style: AppTextTheme.regular.copyWith(
        color: AppColors.backgroundSecondary,
        fontWeight: FontWeight.w500,
      ),
    ),
    duration: const Duration(seconds: 2),
    margin: padding,
    padding: padding,
    borderRadius: BorderRadius.circular(16),
    backgroundColor: Colors.red,
    maxWidth: 600,
    flushbarPosition: FlushbarPosition.TOP,
    positionOffset: 0,
    boxShadows: const [
      BoxShadow(
        color: AppColors.primary100,
        blurRadius: 16,
      ),
    ],
  ).show(context);
}
