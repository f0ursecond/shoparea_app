import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/screen/total_penjualan_screen/components/legend.dart';

// ignore: must_be_immutable
class BarChartSample6 extends StatelessWidget {
  BarChartSample6({super.key});

  final pilateColor = Colors.purple;
  final cyclingColor = Colors.cyan;
  final quickWorkoutColor = Colors.blue;
  final betweenSpace = 0.2;

  BarChartGroupData generateGroupData(
    int x,
    double pilates,
    double quickWorkout,
    double cycling,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          color: pilateColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          color: quickWorkoutColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace + quickWorkout + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout + betweenSpace + cycling,
          color: cyclingColor,
          width: 5,
        ),
      ],
    );
  }

  var number = 10;

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Senin';
        break;
      case 1:
        text = 'Selasa';
        break;
      case 2:
        text = 'Rabu';
        break;
      case 3:
        text = 'Kamis';
        break;
      case 4:
        text = 'Jumat';
        break;
      case 5:
        text = 'Sabtu';
        break;
      case 6:
        text = 'Minggu';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          LegendsListWidget(
            legends: [
              Legend('Pilates', pilateColor),
              Legend('Quick workouts', quickWorkoutColor),
              Legend('Cycling', cyclingColor),
            ],
          ),
          const SizedBox(height: 14),
          AspectRatio(
            aspectRatio: 2,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: bottomTitles,
                    reservedSize: 20,
                  )),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(enabled: false),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barGroups: [
                  generateGroupData(0, 2, 3, 2),
                  generateGroupData(1, 2, 5, 1.7),
                  generateGroupData(2, 1.3, 3.1, 2.8),
                  generateGroupData(3, 3.1, 4, 3.1),
                  generateGroupData(4, 0.8, 3.3, 3.4),
                  generateGroupData(5, 2, 5.6, 1.8),
                  generateGroupData(6, 1.3, 3.2, 2),
                ],
                maxY: 11 + (betweenSpace * 3),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 3.3,
                      color: pilateColor,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 8,
                      color: quickWorkoutColor,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 11,
                      color: cyclingColor,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
