import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_top_border_wrapper.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class EmptyDataCard extends StatelessWidget {
  const EmptyDataCard({
    required this.title,
    required this.subtitle,
    this.alignment,
    this.color,
    super.key,
  });

  final String title;

  final String subtitle;

  final Alignment? alignment;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: CardCircularTopBorderWrapper(
        color: color,
        padding: const EdgeInsets.all(16),
        child: Align(
          alignment: alignment ?? Alignment.center,
          child: ListTile(
            title: Text(
              title,
              style: AppTextTheme.title,
              textAlign: TextAlign.center,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                subtitle,
                style: AppTextTheme.regular,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
