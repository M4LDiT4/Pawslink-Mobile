import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_template/core/constants/colors.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme light = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: TColors.titleDark,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: TColors.titleDark,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: TColors.titleDark,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: TColors.titleDark,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: TColors.titleDark,
    ),
    titleSmall: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: TColors.textDark,
    ),
    bodyLarge: GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TColors.textDark,
    ),
    bodyMedium: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: TColors.textDark,
    ),
    bodySmall: GoogleFonts.quicksand(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: TColors.textMuted,
    ),
    labelLarge: GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TColors.textDark,
    ),
    labelMedium: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: TColors.textMuted,
    ),
    labelSmall: GoogleFonts.quicksand(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: TColors.textMuted,
    ),
    displayLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: TColors.titleDark,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: TColors.titleDark,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: TColors.titleDark,
    ),
  );

  static TextTheme dark = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: TColors.titleLight,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: TColors.titleLight,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: TColors.titleLight,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: TColors.titleLight,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: TColors.titleLight,
    ),
    titleSmall: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: TColors.textLight,
    ),
    bodyLarge: GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TColors.textLight,
    ),
    bodyMedium: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: TColors.textLight,
    ),
    bodySmall: GoogleFonts.quicksand(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: TColors.textMuted,
    ),
    labelLarge: GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TColors.textLight,
    ),
    labelMedium: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: TColors.textMuted,
    ),
    labelSmall: GoogleFonts.quicksand(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: TColors.textMuted,
    ),
    displayLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: TColors.titleLight,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: TColors.titleLight,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: TColors.titleLight,
    ),
  );
}
