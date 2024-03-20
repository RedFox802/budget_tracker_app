import 'package:budget_tracker_app/common/domain/transition_list/model/transaction_category/transaction_category.dart';
import 'package:budget_tracker_app/feature/analytic/presentation/component/app_chart_wrapper.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/utils/app_chart_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CategoriesBarChart extends StatelessWidget {
  const CategoriesBarChart({
    required this.data,
    super.key,
  });

  final Map<TransactionExpenditureCategory, double> data;

  double get _maxValue => data.values.fold<double>(0, (prValue, element) {
        if (element > prValue) {
          return element;
        }
        return prValue;
      });

  List<BarChartGroupData> get _chartBars {
    final keys = data.keys.toList();
    const radius = Radius.circular(4);
    return keys.map(
      (category) {
        final amount = data[category]!;
        return BarChartGroupData(
          x: keys.indexOf(category) + 1,
          barRods: [
            BarChartRodData(
              toY: amount,
              width: 20,
              color: AppColors.primary100,
              borderRadius: const BorderRadius.only(
                topLeft: radius,
                topRight: radius,
              ),
            ),
          ],
        );
      },
    ).toList();
  }

  AxisTitles get _horizontalTiles {
    return AxisTitles(
      drawBelowEverything: false,
      sideTitles: SideTitles(
        interval: 1,
        showTitles: true,
        reservedSize: 50,
        getTitlesWidget: (value, meta) {
          final index = (value - 1).toInt();
          return SideTitleWidget(
            axisSide: AxisSide.bottom,
            child: Padding(
              padding: EdgeInsets.only(top: index.isOdd ? 20 : 0),
              child: Text(
                data.keys.elementAt(index).name,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultEmptyTiles = AppChartUtils.defaultEmptyTiles;
    final verticalStep = AppChartUtils.getVerticalStep(_maxValue);

    return AppChartWrapper(
      title: 'Статистика расходов по категориям',
      chartWidget: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: AppChartUtils.minChartHeight + 20,
            maxWidth: data.length * AppChartUtils.spaseForOneSection,
          ),
          child: BarChart(
            BarChartData(
              maxY: _maxValue,
              barGroups: _chartBars,
              titlesData: FlTitlesData(
                leftTitles: AppChartUtils.getVerticalTiles(
                  verticalStep,
                ),
                bottomTitles: _horizontalTiles,
                topTitles: defaultEmptyTiles,
                rightTitles: defaultEmptyTiles,
              ),
              borderData: FlBorderData(
                show: true,
                border: AppChartUtils.chartBorder,
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: verticalStep,
              ),
              barTouchData: BarTouchData(
                enabled: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
