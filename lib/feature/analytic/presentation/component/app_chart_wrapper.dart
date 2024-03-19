import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppChartWrapper extends StatelessWidget {
  const AppChartWrapper({
    required this.title,
    required this.chartWidget,
    super.key,
  });

  final String title;

  final Widget chartWidget;

  @override
  Widget build(BuildContext context) {
    return CardCircularBorderAllWrapper(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: AppTextTheme.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: chartWidget,
          ),
        ],
      ),
    );
  }
}
