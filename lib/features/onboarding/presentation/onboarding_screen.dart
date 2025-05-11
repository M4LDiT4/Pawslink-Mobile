import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = TDeviceUtils.getScreenHeight();
    double screenWidth = TDeviceUtils.getScreenWidth();
    return Scaffold(
      body: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Container(
              padding:const EdgeInsets.only(top: 40),
              decoration: const BoxDecoration(
                gradient: TColors.onboardingBackground
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      TImages.logoPawslinkBNW,
                      width: 180,
                      height: null,
                    ),
                     Text.rich(
                      TextSpan(children:[
                        TextSpan(
                          text: "spot. ",
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: TColors.textLight
                          )
                        ),
                        TextSpan(
                          text: "snap. ",
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: TColors.secondary
                          )
                        ),
                        TextSpan(
                          text: "adopt. ",
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: TColors.textLight
                          )
                        )
                      ])
                    ),
                    const FixedSeparator(space: TSizes.spaceFromTitlemid),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        textAlign: TextAlign.center,
                        TText.onboardingWelcomeText,
                        style: TextStyle(color: TColors.textLight),
                      ),
                    ),
                    const FixedSeparator(space: TSizes.spaceFromTitlemid),
                    ElevatedButton(
                      onPressed: (){}, 
                      style:ElevatedButton.styleFrom(
                        backgroundColor: TColors.secondary,
                        foregroundColor: TColors.tertiary,
                        padding: const EdgeInsets.all(12),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700
                        )
                      ),
                      child: const Text(TText.getStartedText),
                    ),
                    const FixedSeparator(space: TSizes.spaceFromTitlemid),
                    Image.asset(TImages.womanWithUmbrella)
                  ],
                ),
              ),
            )
          )
    );
  }
}