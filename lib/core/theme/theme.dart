///@file theme.dart
///@date 2023-10-01
///@version 1.0.0
///@description creates a singleton class that contains light and dark themes for the application
///@usage call this class inside the app function of the app
///
///
///@notes : themes are general designs for component
///@notes : for specific designs create custom widgets and override designs

import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/theme/color_scheme.dart';
import 'package:mobile_app_template/core/theme/custom_themes/appbar_theme.dart';
import 'package:mobile_app_template/core/theme/custom_themes/bottom_sheet.dart';
import 'package:mobile_app_template/core/theme/custom_themes/checkbox_theme.dart';
import 'package:mobile_app_template/core/theme/custom_themes/chip_theme.dart';
import 'package:mobile_app_template/core/theme/custom_themes/dropdown_theme.dart';
import 'package:mobile_app_template/core/theme/custom_themes/elevated_button.dart';
import 'package:mobile_app_template/core/theme/custom_themes/outlined_button.dart';
import 'package:mobile_app_template/core/theme/custom_themes/text_theme.dart';
import 'package:mobile_app_template/core/theme/custom_themes/textfield_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: TColorScheme.lightColorScheme,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.light,
    chipTheme: TChipTheme.light,
    checkboxTheme: TCheckboxTheme.light,
    appBarTheme: TAppbarTheme.light,
    bottomSheetTheme: TBottomSheetTheme.light,
    elevatedButtonTheme: TElevatedButtonTheme.light,
    outlinedButtonTheme: TOutlinedButtonTheme.light,
    inputDecorationTheme: TTextfieldTheme.light,
    dropdownMenuTheme: TDropdownTheme.light
  );  

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: TColorScheme.darkColorScheme,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.dark,
    chipTheme: TChipTheme.dark,
    checkboxTheme: TCheckboxTheme.dark,
    appBarTheme: TAppbarTheme.dark,
    bottomSheetTheme: TBottomSheetTheme.dark,
    elevatedButtonTheme: TElevatedButtonTheme.dark,
    outlinedButtonTheme: TOutlinedButtonTheme.dark,
    inputDecorationTheme: TTextfieldTheme.dark,
    dropdownMenuTheme: TDropdownTheme.dark,
  );  
}