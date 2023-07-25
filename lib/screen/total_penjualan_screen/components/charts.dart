import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BarChartSample6 extends StatelessWidget {
  BarChartSample6({super.key});

  final pilateColor = const Color(0xFF4A3AFF);
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
          fromY: -2,
          toY: pilates,
          color: pilateColor,
          width: 8,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          color: Colors.grey[400],
          width: 8,
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
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(enabled: true),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barGroups: [
                  generateGroupData(0, 2, 6.8, 2),
                  generateGroupData(1, 4, 4.8, 1.7),
                  generateGroupData(2, 1.3, 7.5, 2.8),
                  generateGroupData(3, 4.8, 4.0, 3.1),
                  generateGroupData(4, 3, 5.8, 3.4),
                  generateGroupData(5, 2, 6.8, 1.8),
                  generateGroupData(6, 6, 2.9, 2),
                ],
                maxY: 11 + (betweenSpace * 2),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 1.3,
                      color: Colors.grey[400],
                      strokeWidth: 0.5,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 3,
                      color: Colors.grey[400],
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 5,
                      color: Colors.grey[400],
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 7,
                      color: Colors.grey[400],
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 9,
                      color: Colors.grey[400],
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
