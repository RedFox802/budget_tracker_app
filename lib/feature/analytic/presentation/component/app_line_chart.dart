import 'dart:math';

import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/utils/date_time_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticLineChart extends StatelessWidget {
  const AnalyticLineChart({
    required this.incomeData,
    required this.expenditureData,
    required this.maxAmount,
    required this.minAmount,
    super.key,
  });

  final Map<int, Iterable<TransactionEntity>> incomeData;

  final Map<int, Iterable<TransactionEntity>> expenditureData;

  final double maxAmount;

  final double minAmount;

  AxisTitles get _defaultEmptyTiles => const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      );

  Border get _chartBorder {
    const defaultBorder = BorderSide(color: Colors.transparent);
    const accentBorder = BorderSide(color: AppColors.primary100);
    return const Border(
      bottom: accentBorder,
      left: accentBorder,
      right: defaultBorder,
      top: defaultBorder,
    );
  }

  double get _step {
    const partCount = 6;
    return (maxAmount - minAmount) / partCount;
  }

  double get horizontalItemsLength => max(
        incomeData.keys.length.toDouble(),
        expenditureData.keys.length.toDouble(),
      );

  @override
  Widget build(BuildContext context) {
    final incomeLine = _getChartBarData(incomeData);
    final expenditureLine = _getChartBarData(expenditureData);
    final verticalStep = _step;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 250,
          maxWidth: horizontalItemsLength * 80,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LineChart(
            LineChartData(
              maxY: maxAmount,
              maxX: horizontalItemsLength,
              lineBarsData: [
                incomeLine,
                expenditureLine,
              ],
              titlesData: FlTitlesData(
                leftTitles: _getVerticalTiles(
                  step: verticalStep,
                ),
                bottomTitles: _getHorizontalTiles(),
                topTitles: _defaultEmptyTiles,
                rightTitles: _defaultEmptyTiles,
              ),
              lineTouchData: const LineTouchData(
                enabled: false,
              ),
              gridData: FlGridData(
                show: true,
                verticalInterval: 1,
                horizontalInterval: _step,
              ),
              borderData: FlBorderData(
                show: true,
                border: _chartBorder,
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
            ),
          );
        },
      ),
    );
  }

  // TODO: step
  AxisTitles _getVerticalTiles({
    required double step,
  }) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: _step,
        reservedSize: 60,
        getTitlesWidget: (value, _) => Text(
          ((value / step)*step).round().toString(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  LineChartBarData _getChartBarData(
      Map<int, Iterable<TransactionEntity>> data) {
    final List<FlSpot> spots = [];
    for (final item in data.keys) {
      final dataItem = data[item];
      if (dataItem != null) {
        final totalValue = dataItem.fold<double>(
          0,
          (previousValue, element) {
            return previousValue = element.amount.toDouble();
          },
        );

        spots.add(FlSpot(item.toDouble(), totalValue));
      }
    }
    return LineChartBarData(
      spots: spots,
      barWidth: 2,
      isCurved: true,
      isStrokeCapRound: false,
      dotData: const FlDotData(show: false),
      color: AppColors.primary100.withOpacity(0.5),
      belowBarData: BarAreaData(
        show: true,
        color: AppColors.primary100.withOpacity(0.2),
      ),
    );
  }
}
