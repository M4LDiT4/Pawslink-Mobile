///@file  bottom_sheet.dart
///@date 2023-10-01
///@version 1.0.0
///@description creates a singleton class for the bottom sheet theme
///@description supports light and dark themes
///@note this is just a template for the bottom sheet theme
///@note modify the properties as needed
///@note you can remove the final keyword when editing to show current changes instantly
import 'package:flutter/material.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static const BottomSheetThemeData light =  BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: BoxConstraints(
      minWidth: double.infinity
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
  );

  static const BottomSheetThemeData dark =  BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    constraints: BoxConstraints(
      minWidth: double.infinity
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
  );
}