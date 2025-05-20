import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';
import 'package:mobile_app_template/core/widgets/containers/generic_expansion_tile.dart';

class ViewAnimalSummaryScreen extends StatelessWidget {
  const ViewAnimalSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GenericExpansionTile(
              title: "Dog Summary",
              children: [
                Row(
                  children: [
                    Expanded(child: SizedBox(width: 200, child:  GenericDonutChart()),),
                    Expanded(child: Column(
                      children: [
                        ListTile(
                          leading: Image.asset(
                              width: TSizes.iconxxl,
                              TImages.catIcon
                            ),
                            title: Text(
                              style: Theme.of(context).textTheme.headlineSmall,
                              "100"
                            ),
                        ),
                        ListTile(
                          leading: Image.asset(
                              width: TSizes.iconxxl,
                              TImages.dogIcon
                            ),
                            title: Text(
                              style: Theme.of(context).textTheme.headlineSmall,
                              "100"
                            ),
                        ),
                      ],
                    ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}