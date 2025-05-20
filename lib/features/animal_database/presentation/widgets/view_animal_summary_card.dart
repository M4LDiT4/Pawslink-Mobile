import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';
import 'package:mobile_app_template/core/widgets/containers/generic_expansion_tile.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';

class ViewAnimalSummaryCard extends StatelessWidget {
  final String title;
  final List<GenericDonutChartParams> valueList;
  final Widget rightChild;
  final Widget? donutCenter;
  const ViewAnimalSummaryCard({
    super.key,
    required this.title,
    required this.valueList,
    required this.rightChild,
    this.donutCenter,
  });

  @override
  Widget build(BuildContext context) {
    return GenericExpansionTile(
      title: title,
      children: [
        Row(
          children: [
            Expanded(
              child: GenericDonutChart(
                valueList: valueList,
                centerIcon: donutCenter,
              )
            ),
            Expanded(child: rightChild)
          ],
        ),
        const FixedSeparator(space: TSizes.defaultScreenPadding),
        Wrap(
          spacing: TSizes.spaceBetweenItems,
          runSpacing: TSizes.spaceBetweenItems/2,
          children: valueList.map((item){
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
          }).toList(),
        )
      ],
    );
  }
}