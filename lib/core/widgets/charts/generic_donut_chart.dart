import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GenericDonutChart extends StatelessWidget {
  const GenericDonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final radius = constraints.maxWidth * 0.3;
          final centerSpaceRadius = constraints.maxWidth * 0.2;

          // Calculate total value
          final total = 40 + 30 + 30;

          return Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  centerSpaceRadius: centerSpaceRadius,
                  sectionsSpace: 2,
                  sections: [
                    PieChartSectionData(
                      value: 40,
                      color: Colors.blue,
                      title: '40',
                      radius: radius,
                      titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    PieChartSectionData(
                      value: 30,
                      color: Colors.red,
                      title: '30',
                      radius: radius,
                      titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    PieChartSectionData(
                      value: 30,
                      color: Colors.green,
                      title: '30',
                      radius: radius,
                      titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              // Positioned center total text
              Text(
                '$total',
                style: TextStyle(
                  fontSize: centerSpaceRadius * 0.8,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
