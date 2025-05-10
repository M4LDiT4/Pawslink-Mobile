import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final light = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.textDark, // Black text color
      side: const BorderSide(
        color: TColors.primary, // Pink border for light mode
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TColors.textDark, // Black text color
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
  );

  static final dark = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.textLight, // White text color
      side:const  BorderSide(
        color: TColors.primary, // Pink border for dark mode
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TColors.textLight, // White text color
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
  );
}
