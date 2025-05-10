///@file  bottom_sheet.dart
///@date 2023-10-01
///@version 1.1.0
///@description BottomSheet theme using TColors for light and dark modes.
///@note Integrated with app-wide design system.

import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static const BottomSheetThemeData light = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: TColors.surfaceLight,
    modalBackgroundColor: TColors.backgroundLight,
    constraints: BoxConstraints(
      minWidth: double.infinity,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
  );

  static const BottomSheetThemeData dark = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: TColors.surfaceDark,
    modalBackgroundColor: TColors.backgroundDark,
    constraints: BoxConstraints(
      minWidth: double.infinity,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
  );
}
