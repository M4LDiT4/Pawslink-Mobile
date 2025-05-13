import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
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
import 'package:mobile_app_template/features/authentication/controllers/sign_up_controiller.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/services/navigation_service.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void navigateToSignIn() {
    TNavigationService.offAllNamed(TAppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpControiller());
    final screenHeight = TDeviceUtils.getScreenHeight();
    final logoTopContainerSize = screenHeight * 0.15;
    final bodyMinSize = screenHeight - logoTopContainerSize - 125;
    final isDarkMode = TDeviceUtils.isDarkMode();
    return Scaffold(
      body: KeyboardSafeScrollView(
        child: Column(
          children: [
            SizedBox(
              height: logoTopContainerSize,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    height: 74,
                    TImages.logoPawslinkColored
                  ),
                ],
              )
            ),
            const FixedSeparator(space: TSizes.spaceBetweenItems),
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
                      TText.createAccount
                    ),
                    const FixedSeparator(space: TSizes.spaceBetweenItems),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          const AuthTextField(
                            label: TText.username,
                            leadingIcon: Iconsax.user,
                            validator: TValidator.validateUsername,
                            isRequired: true,
                          ),
                          const AuthTextField(
                            label:TText.email,
                            leadingIcon: Iconsax.sms,
                            validator: TValidator.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                            isRequired: true,
                          ),
                          AuthTextField(
                            label: TText.password,
                            leadingIcon: Iconsax.password_check,
                            validator: TValidator.validatePassword,
                            controller: controller.passController,
                            isRequired: true,
                            isPassword: true,
                          ),
                          AuthTextField(
                            label: TText.confirmPass,
                            leadingIcon: Iconsax.password_check4,
                            validator: controller.validateConfirmPass,
                            isRequired: true,
                            isPassword: true,
                          ),
                        ],
                      )
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
                        onPressed: controller.validate, 
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
                      onPressed: navigateToSignIn, 
                      child: Text(
                        TText.signInString,
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
          ],
        ),
      ),
    );
  }
}
