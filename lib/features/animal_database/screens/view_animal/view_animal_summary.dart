import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_animal_profile_slider/view_animal_profile_slider.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_animal_summary_card/view_animal_summary_card.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_animal_summary_listtile.dart';

class ViewAnimalSummaryScreen extends StatelessWidget {
  const ViewAnimalSummaryScreen({super.key});

  List<GenericDonutChartParams> _generateGeneralSummaryList(){
    return [
      GenericDonutChartParams(value: 50, title: "Adopted", color: AnimalStatus.adopted.color),
      GenericDonutChartParams(value: 60, title: "Transient", color: AnimalStatus.transient.color),
      GenericDonutChartParams(value: 20, title: "On Campus", color: AnimalStatus.on_campus.color),
      GenericDonutChartParams(value: 10, title: "Rainbow Bridge", color: AnimalStatus.rainbow_bridge.color),
      GenericDonutChartParams(value: 4, title: "Owned", color: AnimalStatus.owned.color),
    ];
  }

  List<GenericDonutChartParams> _generateTempList(){
    return [
      GenericDonutChartParams(value: 23, title: "Male", color: AnimalSex.male.color),
      GenericDonutChartParams(value: 12, title: "Female", color: AnimalSex.female.color)
    ];
  }

  @override
  Widget build(BuildContext context) {
    final valueList = _generateGeneralSummaryList();
    return SingleChildScrollView(
      child: Padding(
        padding:const EdgeInsets.only(left: TSizes.defaultScreenPadding, right: TSizes.defaultScreenPadding, bottom: TSizes.paddingxxl),
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
              valueList: _generateTempList(),
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
            ),
            ViewAnimalSummaryCard(
              title: "Cat Summary", 
              valueList: _generateTempList(),
              donutCenter: Image.asset(
                width: TSizes.iconxxl,
                TImages.catIcon
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
            ),
            const FixedSeparator(space: TSizes.spaceBetweenSections),
            const ViewAnimalProfileSlider()
          ],
        ),
      ),
    );
  }
}

