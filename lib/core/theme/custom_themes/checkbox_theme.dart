///@file checkbox_theme.dart
///@date 2023-10-01
///@version 1.1.0
///@description Checkbox theme styled using TColors for light and dark modes.

import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  static final CheckboxThemeData light = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: WidgetStateProperty.resolveWith((states) {
      return TColors.textLight;
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TColors.primary;
      } else if (states.contains(WidgetState.disabled)) {
        return TColors.disabled;
      }
      return TColors.borderLight;
    }),
  );

  static final CheckboxThemeData dark = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: WidgetStateProperty.resolveWith((states) {
      return TColors.textDark;
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TColors.primary;
      } else if (states.contains(WidgetState.disabled)) {
        return TColors.disabled;
      }
      return TColors.borderDark;
    }),
  );
}
