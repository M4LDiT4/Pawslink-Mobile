
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';

class TColorScheme{
  TColorScheme._();
  
  static final lightColorScheme = ColorScheme.fromSeed(
    seedColor: TColors.primary,
    brightness: Brightness.light,
    primary: TColors.primary,
    secondary: TColors.secondary,
    tertiary: TColors.tertiary,
    surface: TColors.surfaceLight,
    onPrimary: TColors.onPrimary,
    onSurface: TColors.textDark,
    error: TColors.error,
  );

  static final darkColorScheme = ColorScheme.fromSeed(
    seedColor: TColors.primaryDark,
    brightness: Brightness.dark,
    primary: TColors.primaryDark,
    secondary: TColors.secondaryDark,
    tertiary: TColors.tertiaryDark,
    surface: TColors.surfaceDark,
    onPrimary: TColors.onPrimary,
    onSurface: TColors.textLight,
    error: TColors.error,
  );
}