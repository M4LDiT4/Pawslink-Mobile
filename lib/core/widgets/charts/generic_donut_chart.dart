import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/utils/colors/color_utils.dart';

class GenericDonutChartParams {
  final double value;
  final String title;
  final Color color;

  GenericDonutChartParams({
    required this.value,
    required this.title,
    required this.color,
  });
}

class GenericDonutChart extends StatelessWidget {
  final List<GenericDonutChartParams> valueList;
  final Widget? centerIcon;
  const GenericDonutChart({
    super.key,
    required this.valueList,
    this.centerIcon,
  });

  int _generateTotal(){
    int count = 0;
    for(var item in valueList){
      count += item.value.toInt();
    }
    return count;
  }

  List<PieChartSectionData> _generateValueList (double radius, BuildContext context) {
    final dataList = <PieChartSectionData>[];
    Color textColor;
    final titleStyle = Theme.of(context).textTheme.bodyMedium;
    for(var item in valueList){
      textColor = TColorUtils.getContrastingTextColor(item.color);
      dataList.add(
        PieChartSectionData(
          value: item.value,
          title: item.value.toInt().toString(),
          color: item.color,
          radius: radius,
          titleStyle: titleStyle!.copyWith(color: textColor)
        )
      );
    }
    return dataList;
  }

  Widget _generateCenter(BuildContext context, double centerSpaceRadius){
    if(centerIcon != null){
      return centerIcon!;
    }
  return Text(
    '${_generateTotal()}',
    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
      fontSize: centerSpaceRadius * 0.8,
      fontWeight: FontWeight.bold,
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final radius = constraints.maxWidth * 0.3;
          final centerSpaceRadius = constraints.maxWidth * 0.2;

          return Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  centerSpaceRadius: centerSpaceRadius,
                  sectionsSpace: 2,
                  sections: _generateValueList(radius, context)
                ),
              ),
              // Positioned center total text
              _generateCenter(context, centerSpaceRadius)
            ],
          );
        },
      ),
    );
  }
}
