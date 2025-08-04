import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/features/animal_database/widgets/animal_summary_card/animal_species_summary_card.dart';
import 'package:mobile_app_template/features/animal_database/widgets/general_summary_card/general_summary_card.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_animal_profile_slider/view_animal_profile_slider.dart';

class ViewAnimalSummaryScreen extends StatelessWidget {
  const ViewAnimalSummaryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: TSizes.defaultScreenPadding, right: TSizes.defaultScreenPadding, bottom: TSizes.paddingxxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GeneralSummaryCard(title: "General Summary"),
            AnimalSpeciesSummaryCard(title: "Dog summary", 
              species: AnimalSpecies.dog
            ),
            AnimalSpeciesSummaryCard(
              title: "Cat Summary", 
              species: AnimalSpecies.cat
            ),
             FixedSeparator(space: 
            TSizes.spaceBetweenSections),
            ViewAnimalProfileSlider()
          ],
        ),
      ),
    );
  }
}

