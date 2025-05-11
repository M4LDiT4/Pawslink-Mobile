///@file: chip_theme.dart
///@date: 2023-10-01
///@version: 1.1.0
///@description Chip theme styled with TColors for light and dark themes.

import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/helpers/number_helpers.dart';

class TChipTheme {
  TChipTheme._();

  static final ChipThemeData light = ChipThemeData(
    disabledColor: TColors.disabled.withAlpha(TNumberHelper.getAlphaWithOpacity(0.4)),
    labelStyle: const TextStyle(
      color: TColors.textDark,
      fontWeight: FontWeight.w500,
    ),
    selectedColor: TColors.primary,
    backgroundColor: TColors.surfaceLight,
    secondarySelectedColor: TColors.secondary,
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12,
    ),
    checkmarkColor: TColors.textLight,
    side: const BorderSide(
      color: TColors.borderLight,
    ),
  );

  static final ChipThemeData dark = ChipThemeData(
    disabledColor: TColors.disabled.withAlpha(TNumberHelper.getAlphaWithOpacity(0.3)),
    labelStyle: const TextStyle(
      color: TColors.textLight,
      fontWeight: FontWeight.w500,
    ),
    selectedColor: TColors.primary,
    backgroundColor: TColors.surfaceDark,
    secondarySelectedColor: TColors.secondary,
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12,
    ),
    checkmarkColor: TColors.textDark,
    side: const BorderSide(
      color: TColors.borderDark,
    ),
  );
}
