import 'package:flutter/material.dart';

/// @file: colors.dart
/// @date: 2023-10-01
/// @version: 1.3.0
/// @description: Contains application-wide color definitions with light & dark mode support.

class TColors {
  TColors._();

  // Branding Colors
  static const Color primary = Color(0xFFE2598B); // Pink - Primary
  static const Color secondary = Color(0xFFFDD043); // Yellow
  static const Color tertiary = Color(0xFF7F4782); // Purple

  // Dark Theme Counterparts
  static const Color primaryDark = Color(0xFFFF6E9F);   // Deeper pink
  static const Color secondaryDark = Color(0xFFFFD952); // Muted gold
  static const Color tertiaryDark = Color(0xFFA865AC);  // Deep purple

  // Text Colors
  static const Color textDark = Color(0xFF000000); // Black
  static const Color textLight = Color(0xFFFFFFFF); // White
  static const Color textMuted = Color(0xFF9E9E9E); // Grey

  // Additional Font Roles
  static const Color titleDark = Color(0xFF1B1B1B);     // Darker for headings
  static const Color titleLight = Color(0xFFF5F5F5);    // Lighter title on dark background
  static const Color subtitleDark = Color(0xFF424242);  // Less emphasis than title
  static const Color subtitleLight = Color(0xFFDDDDDD); // Subtitle on dark
  static const Color bodyTextDark = Color(0xFF212121);  // Standard dark mode body
  static const Color bodyTextLight = Color(0xFFEAEAEA); // Body text on dark bg
  static const Color caption = Color(0xFF757575);        // Small labels, hints
  static const Color onPrimary = Color(0xFFFFFFFF);       // Text on top of pink button

  // Light Mode Backgrounds
  static const Color backgroundLight = Color(0xFFFFF8F8); // Light pinkish white
  static const Color surfaceLight = Color(0xFFFFFFFF);    // White cards
  static const Color appBarLight = Color(0xFFFFFFFF);
  static const Color borderLight = Color(0xFFE0E0E0);

  // Dark Mode Backgrounds
  static const Color backgroundDark = Color(0xFF121212);  // Very dark gray
  static const Color surfaceDark = Color(0xFF1E1E1E);      // Card surface in dark mode
  static const Color appBarDark = Color(0xFF1C1C1C);
  static const Color borderDark = Color(0xFF2C2C2C);

  // Feedback Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF31D661);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // States
  static const Color disabled = Color(0xFFBDBDBD);
  static const Color overlay = Color(0x66000000); // Black with 40% opacity for modals

  // Shadows
  static const Color shadow = Color(0x33000000); // 20% Black for elevation

  //gradients

  // [LINEAR GRADIENT]  
  static const LinearGradient onboardingBackground = LinearGradient(
    begin: Alignment.topCenter, // Gradient starts at the top
    end: Alignment.bottomCenter, // Gradient ends at the bottom
    colors: [
      Color(0xFF7F4782), // #7F4782 color (a shade of purple)
      Color(0xFFCB5B83), // #CB5B83 color (a shade of pink)
    ],
    stops: [0.0, 1.0], // Gradient stops (from top to bottom)
  );
}
