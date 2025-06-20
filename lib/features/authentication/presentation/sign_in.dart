import 'package:flutter/material.dart';
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
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/services/navigation_service.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final screenHeight = TDeviceUtils.getScreenHeight();
    final screenWidth = TDeviceUtils.getScreenWidth();
    final logoTopContainerSize = screenHeight * 0.3;
    final bodyMinSize = screenHeight - logoTopContainerSize - 120;
    final isDarkMode = TDeviceUtils.isDarkMode();

    void navigateToSignUp(){
      TNavigationService.offAllNamed(TAppRoutes.signup);
    }
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
                      child: Column(
                          children: [
                            AuthTextField(
                              label: TText.email,
                              controller: controller.usernameController,
                              leadingIcon: Iconsax.sms,
                              validator: TValidator.validateEmail,
                              isRequired: true,
                            ),
                            AuthTextField(
                              label: TText.password,
                              controller: controller.passwordController,
                              leadingIcon: Iconsax.password_check,
                              isPassword: true,
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
                        onPressed: ()=>controller.submit(context), 
                        child: const Text(TText.login)
                      )
                    ),
                    TextButton(
                      onPressed: (){}, 
                      child: const Text(
                        style: TextStyle(
                          fontSize: TSizes.bodyMid,
                        ),
                        TText.forgotPassword
                      )
                    ),
                    TextButton(
                      onPressed: navigateToSignUp, 
                      child: Text(
                        TText.signUpString,
                        style: TextStyle(
                          color: isDarkMode? TColors.textLight: TColors.textDark,
                          decoration: TextDecoration.underline,
                        ),
                        
                      )
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.only(),
                child: Column(
                  children: [
                    Text(
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontStyle: FontStyle.italic,
                        color: isDarkMode? TColors.tertiaryDark: TColors.tertiary
                      ),
                      TText.partnerShip
                    ),
                    const FixedSeparator(space: TSizes.spaceBetweenItems),
                    Row(
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
