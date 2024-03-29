import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title,
    super.key,
  });

  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    const borderRadius = Radius.circular(16);
    final router = context.router;
    final catPop = router.canPop();
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.backgroundSecondary,
      leading: !catPop
          ? null
          : IconButton(
              onPressed: () => router.pop(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.primary100,
              ),
            ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: borderRadius,
          bottomLeft: borderRadius,
        ),
      ),
      title: Text(
        title ?? 'Budget app',
        style: AppTextTheme.title,
      ),
    );
  }
}
