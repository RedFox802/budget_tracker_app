import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AppChartUtils {
  static const verticalLabelCount = 5;

  static Border get chartBorder {
    const defaultBorder = BorderSide(color: Colors.transparent);
    const accentBorder = BorderSide(color: AppColors.primary100);
    return const Border(
      bottom: accentBorder,
      left: accentBorder,
      right: defaultBorder,
      top: defaultBorder,
    );
  }

  static AxisTitles get defaultEmptyTiles => const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      );

  static double getVerticalStep(double maxValue) {
    return maxValue / verticalLabelCount;
  }

  static AxisTitles getVerticalTiles(double labelsCount) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: labelsCount,
        reservedSize: 50,
        getTitlesWidget: (value, _) {
          final labelNumber = value / labelsCount;
          int currentValue = (labelNumber * labelsCount).round();
          String displayValue = '$currentValue';
          if (currentValue >= 1000) {
            currentValue = currentValue ~/ 1000;
            displayValue = '$currentValue т';
          }
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              displayValue,
              style: AppTextTheme.regular,
              textAlign: TextAlign.right,
            ),
          );
        },
      ),
    );
  }
}
