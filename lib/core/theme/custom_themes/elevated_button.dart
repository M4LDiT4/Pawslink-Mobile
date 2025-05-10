import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final light = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom( 
      elevation: 0,
      foregroundColor: TColors.textLight,  // White text color
      backgroundColor: TColors.primary,   // Pink background for the button
      disabledForegroundColor: TColors.disabled, // Disabled button text color
      disabledBackgroundColor: TColors.disabled, // Disabled button background color
      side: BorderSide(color: TColors.primary), // Border color matching the button
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final dark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom( 
      elevation: 0,
      foregroundColor: TColors.textLight,  // White text color
      backgroundColor: TColors.primary,   // Pink background for the button
      disabledForegroundColor: TColors.disabled, // Disabled button text color
      disabledBackgroundColor: TColors.disabled, // Disabled button background color
      side: BorderSide(color: TColors.primary), // Border color matching the button
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
