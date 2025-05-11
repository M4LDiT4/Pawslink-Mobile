import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/validation/validator.dart';
import 'package:mobile_app_template/core/widgets/text_fields/auth_text_field.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/keyboard_safe_scrollview.dart';
import 'package:mobile_app_template/features/authentication/controllers/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final screenHeight = TDeviceUtils.getScreenHeight();
    final screenWidth = TDeviceUtils.getScreenWidth();
    final logoTopContainerSize = screenHeight * 0.3;
    final bodyMinSize = screenHeight - logoTopContainerSize - 95;
    final isDarkMode = TDeviceUtils.isDarkMode();
    return Scaffold(
      body: KeyboardSafeScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: logoTopContainerSize,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    width: 136,
                    TImages.logoPawslinkRoundColored
                  ),
                ],
              )
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: bodyMinSize),
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal :TSizes.defaultScreenPadding),
                child: Column(
                  children: [
                    Text(
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: isDarkMode? TColors.tertiaryDark : TColors.tertiary,
                      ),
                      TText.welomeBack
                    ),
                    const FixedSeparator(space: TSizes.spaceBetweenItems),
                    Form(
                      key: controller.formkey,
                      child: const Column(
                          children: [
                            AuthTextField(
                              label: TText.email,
                              leadingIcon: Iconsax.sms,
                              validator: TValidator.validateEmail,
                              isRequired: true,
                            ),
                            AuthTextField(
                              label: TText.password,
                              leadingIcon: Iconsax.password_check,
                              isPassword: true,
                              validator: TValidator.validatePassword,
                              isRequired: true,
                            )
                          ],
                        ),
                    ),
                    SizedBox(
                      height: 54,
                      width: double.infinity,
                      child: 
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(TSizes.borderRadiusxxl)
                          )
                        ),
                        onPressed: controller.submit, 
                        child: const Text(TText.login)
                      )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      height: 75,
                      TImages.logoUpRound
                    ),
                    Image.asset(
                      height: 75,
                      TImages.logoPahinungod
                    ),
                    Image.asset(
                      height: 75,
                      TImages.logoPawradiseRound
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
