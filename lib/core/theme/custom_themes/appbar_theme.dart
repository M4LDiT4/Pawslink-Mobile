///@file  appbar_theme.dart
///@date 2023-10-01
///@version 1.1.0
///@description AppBar theme configuration using custom color and text theme.
///@note Uses centralized TColors for consistent theming.

import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';

class TAppbarTheme {
  TAppbarTheme._();

  static const light = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: TColors.appBarLight,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: TColors.textDark,
      size: 24,
    ),
    actionsIconTheme: IconThemeData(
      color: TColors.textDark,
      size: 24,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: TColors.titleDark,
    ),
  );

  static const dark = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: TColors.appBarDark,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: TColors.textLight,
      size: 24,
    ),
    actionsIconTheme: IconThemeData(
      color: TColors.textLight,
      size: 24,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: TColors.titleLight,
    ),
  );
}
