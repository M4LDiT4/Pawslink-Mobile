import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';
import 'package:mobile_app_template/features/animal_database/presentation/widgets/view_animal_summary_card.dart';
import 'package:mobile_app_template/features/animal_database/presentation/widgets/view_animal_summary_listtile.dart';
import 'package:path/path.dart';

class ViewAnimalSummaryScreen extends StatelessWidget {
  const ViewAnimalSummaryScreen({super.key});

  List<GenericDonutChartParams> _generateGeneralSummaryList(){
    return [
      GenericDonutChartParams(value: 50, title: "Adopted", color: AnimalStatus.adopted.color),
      GenericDonutChartParams(value: 60, title: "Transient", color: AnimalStatus.transient.color),
      GenericDonutChartParams(value: 20, title: "On Campus", color: AnimalStatus.onCampus.color),
      GenericDonutChartParams(value: 10, title: "Rainbow Bridge", color: AnimalStatus.rainbowBridge.color),
      GenericDonutChartParams(value: 4, title: "Owned", color: AnimalStatus.owned.color),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final valueList = _generateGeneralSummaryList();
    return SingleChildScrollView(
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ViewAnimalSummaryCard(
              title: "General", 
              valueList: valueList, 
              rightChild: const Column(
                children: [
                  ViewAnimalSummaryListtile(
                    leadingImgPath: TImages.catIcon, 
                    title: "100", 
                    subtitle: "cats",
                  ),
                  ViewAnimalSummaryListtile(
                    leadingImgPath: TImages.dogIcon, 
                    title: "100", 
                    subtitle: "dogs"
                  ),
                ],
              )
            ),
            ViewAnimalSummaryCard(
              title: "Dog Summary", 
              valueList: valueList,
              donutCenter: Image.asset(
                width: TSizes.iconxxl,
                TImages.dogIcon
              ),
              rightChild: const Column(
                children: [
                  ViewAnimalSummaryListtile(
                    leadingImgPath: TImages.spayed, 
                    title: "100", 
                    subtitle: "spayed",
                  ),
                  ViewAnimalSummaryListtile(
                    leadingImgPath: TImages.neutered, 
                    title: "100", 
                    subtitle: "neutered"
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

