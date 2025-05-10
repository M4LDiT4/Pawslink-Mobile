import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';

class TTextfieldTheme {
  TTextfieldTheme._();

  // Light Mode - Combined Filled and Outlined TextField Styles
  static InputDecorationTheme light = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.textMuted,
    suffixIconColor: TColors.textMuted,
    labelStyle: const TextStyle(
      color: TColors.textDark,
      fontSize: 14,
    ),
    hintStyle: const TextStyle(
      color: TColors.textMuted,
      fontSize: 14,
    ),
    errorStyle: const TextStyle(fontStyle: FontStyle.normal),
    floatingLabelStyle: TextStyle(
      color: TColors.textDark.withAlpha((255 * 0.8).toInt()),
    ),
    filled: true,
    fillColor: TColors.backgroundLight, // Light background for filled text fields
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TColors.borderLight), // Outlined border
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TColors.borderLight), // Outlined border
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TColors.primary), // Focused border color
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TColors.warning),
    ),
  );

  // Dark Mode - Combined Filled and Outlined TextField Styles
  static InputDecorationTheme dark = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.textMuted,
    suffixIconColor: TColors.textMuted,
    labelStyle: const TextStyle(
      color: TColors.textLight,
      fontSize: 14,
    ),
    hintStyle: const  TextStyle(
      color: TColors.textMuted,
      fontSize: 14,
    ),
    errorStyle: const  TextStyle(fontStyle: FontStyle.normal),
    floatingLabelStyle: TextStyle(
      color: TColors.textLight.withAlpha((255 * 0.8).toInt()),
    ),
    filled: true,
    fillColor: TColors.backgroundDark, // Dark background for filled text fields
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const  BorderSide(width: 1, color: TColors.borderDark), // Outlined border
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TColors.borderDark), // Outlined border
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TColors.primary), // Focused border color
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: TColors.warning),
    ),
  );
}
