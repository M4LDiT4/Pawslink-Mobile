import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';

class TDropdownTheme {
  TDropdownTheme._();

  static DropdownMenuThemeData light = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      fillColor: TColors.backgroundLight,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      labelStyle: const TextStyle(
        color: TColors.textDark,
        fontSize: 14,
      ),
      hintStyle: const TextStyle(
        color: TColors.textMuted,
        fontSize: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: TColors.borderLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: TColors.borderLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: TColors.primary),
      ),
    ),
    textStyle: const TextStyle(
      fontWeight: FontWeight.normal,
      color: TColors.textDark,
      fontSize: 14,
    ),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(TColors.backgroundLight),
      surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
  );

  static DropdownMenuThemeData dark = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: TColors.backgroundDark,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      labelStyle: const TextStyle(
        color: TColors.textLight,
        fontSize: 14,
      ),
      hintStyle: const TextStyle(
        color: TColors.textMuted,
        fontSize: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: TColors.borderDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: TColors.borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: TColors.primary),
      ),
    ),
    textStyle: const TextStyle(
      fontWeight: FontWeight.normal,
      color: TColors.textLight,
      fontSize: 14,
    ),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(TColors.backgroundDark),
      surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
  );
}
