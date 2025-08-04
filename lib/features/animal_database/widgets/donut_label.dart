import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';

class DonutLabel extends StatelessWidget {
  final GenericDonutChartParams item;
  const DonutLabel({
    super.key,
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
            color:  item.color,
            shape:  BoxShape.circle
          ),
        ),
        Text(item.title)
      ],
    );
  }
}