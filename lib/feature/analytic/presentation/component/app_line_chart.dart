import 'dart:math';

import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:budget_tracker_app/utils/app_chart_utils.dart';
import 'package:budget_tracker_app/utils/date_time_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'app_chart_wrapper.dart';

class AnalyticLineChart extends StatelessWidget {
  const AnalyticLineChart({
    required this.incomeData,
    required this.expenditureData,
    super.key,
  });

  final Map<int, double> incomeData;

  final Map<int, double> expenditureData;

  @override
  Widget build(BuildContext context) {
    final defaultEmptyTiles = AppChartUtils.defaultEmptyTiles;
    final maxAmount = max<double>(
      incomeData.values
          .fold(0, (prValue, item) => item > prValue ? item : prValue),
      expenditureData.values
          .fold(0, (prValue, item) => item > prValue ? item : prValue),
    );

    final verticalStep = AppChartUtils.getVerticalStep(maxAmount);
    final horizontalItemsLength = max(
      incomeData.keys.length.toDouble(),
      expenditureData.keys.length.toDouble(),
    );

    return AppChartWrapper(
      title: 'Статиcтика по расходам и доходам',
      chartWidget: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 250,
          maxWidth: horizontalItemsLength * 80,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
          child: LineChart(
            LineChartData(
              minY: 0,
              maxY: maxAmount,
              maxX: horizontalItemsLength,
              lineBarsData: [
                _getChartBarData(incomeData),
                _getChartBarData(expenditureData),
              ],
              titlesData: FlTitlesData(
                leftTitles: AppChartUtils.getVerticalTiles(
                  verticalStep,
                ),
                bottomTitles: _getHorizontalTiles(),
                topTitles: defaultEmptyTiles,
                rightTitles: defaultEmptyTiles,
              ),
              lineTouchData: const LineTouchData(
                enabled: false,
              ),
              gridData: FlGridData(
                show: true,
                verticalInterval: 1,
                horizontalInterval: verticalStep,
              ),
              borderData: FlBorderData(
                show: true,
                border: AppChartUtils.chartBorder,
              ),
            ),
          ),
        ),
      ),
    );
  }

  AxisTitles _getHorizontalTiles() {
    return AxisTitles(
      sideTitles: SideTitles(
        interval: 1,
        showTitles: true,
        reservedSize: 32,
        getTitlesWidget: (value, meta) {
          return SideTitleWidget(
            axisSide: meta.axisSide,
            child: Text(
              DateTimeUtils.getMonthName(value.toInt()),
              textAlign: TextAlign.center,
              style: AppTextTheme.regular,
            ),
          );
        },
      ),
    );
  }

  LineChartBarData _getChartBarData(
    Map<int, double> data,
  ) {
    final List<FlSpot> spots = [];
    for (final item in data.keys) {
      final dataItem = data[item];
      if (dataItem != null) {
        spots.add(FlSpot(
          item.toDouble(),
          dataItem,
        ));
      }
    }

    const color = AppColors.primary100;
    return LineChartBarData(
      spots: spots,
      barWidth: 2,
      isCurved: true,
      isStrokeCapRound: false,
      dotData: const FlDotData(show: false),
      color: color.withOpacity(0.5),
      belowBarData: BarAreaData(
        show: true,
        color: color.withOpacity(0.2),
      ),
    );
  }
}
