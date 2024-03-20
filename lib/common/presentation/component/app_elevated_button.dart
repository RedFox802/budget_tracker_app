import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (_) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (_) => AppColors.primary100,
        ),
      ),
      child: Text(
        title,
        style: AppTextTheme.title.copyWith(
          color: AppColors.backgroundSecondary,
        ),
      ),
    );
  }
}
