
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_animal_profile_slider/view_animal_profile_slider_item.dart';

class ViewAnimalProfileSlider extends StatelessWidget {
  const ViewAnimalProfileSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         Row(
          children: [
            Text(
              "Recents",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: TColors.primary,
                  ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ViewAnimalProfileSliderItem(),
              const ViewAnimalProfileSliderItem(),
              const ViewAnimalProfileSliderItem(),
              const ViewAnimalProfileSliderItem(),
              const ViewAnimalProfileSliderItem(),
              TextButton(onPressed: (){}, child:const Text("View More"))
            ],
          ),
        )
      ],
    );
  }
}