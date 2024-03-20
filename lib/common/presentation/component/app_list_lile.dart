import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.titleMaxLines,
    this.subtitleMaxLines,
    this.trailing,
    this.onTap,
    this.subtitlePadding,
    this.align,
    this.padding,
    super.key,
  });

  final String title;

  final String subtitle;

  final TextStyle? titleStyle;

  final TextStyle? subtitleStyle;

  final int? titleMaxLines;

  final int? subtitleMaxLines;

  final Widget? trailing;

  final VoidCallback? onTap;

  final EdgeInsetsGeometry? subtitlePadding;

  final TextAlign? align;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: padding ?? EdgeInsets.zero,
      visualDensity: const VisualDensity(
        vertical: -4,
        horizontal: -4,
      ),
      onTap: onTap,
      title: Text(
        title,
        style: titleStyle ?? AppTextTheme.title,
        maxLines: titleMaxLines,
        textAlign: align,
      ),
      subtitle: Padding(
        padding: subtitlePadding ?? EdgeInsets.zero,
        child: Text(
          subtitle,
          style: subtitleStyle ?? AppTextTheme.regular,
          maxLines: subtitleMaxLines,
          textAlign: align,
        ),
      ),
      trailing: trailing,
    );
  }
}
