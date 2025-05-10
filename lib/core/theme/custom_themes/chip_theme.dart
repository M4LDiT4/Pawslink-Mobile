///@file: chip_theme.dart
///@date 2023-10-01
///@version 1.0.0
///@description creates a singleton class for the chip theme 
///@description supports light and dark themes
///@note this is just a template for the chip theme
///@note modify the properties as needed

import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static final ChipThemeData light = ChipThemeData( 
    disabledColor: Colors.grey.withAlpha((255* 0.4).toInt()),
    labelStyle: const TextStyle( 
      color: Colors.black
    ),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12
    ),
    checkmarkColor: Colors.white
  );

  static const ChipThemeData dark = ChipThemeData( 
    disabledColor: Colors.grey,
    labelStyle: TextStyle( 
      color: Colors.white
    ),
    selectedColor: Colors.blue,
    padding:  EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12
    ),
    checkmarkColor: Colors.white
  );

}