///@file checkbox_theme.dart
///@date 2023-10-01
///@version 1.0.0
///@description creates a singleton class for the checkbox theme
///@note this is just a template for the checkbox theme
///@note modify the properties as needed
///@note you can remove the final keyword when editing to show current changes instantly
import 'package:flutter/material.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  static final CheckboxThemeData light = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: WidgetStateProperty.resolveWith((state){
      if(state.contains(WidgetState.selected)){
        return Colors.white;
      }else{
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((state){
      if(state.contains(WidgetState.selected)){
        return Colors.blue;
      }else{
        return Colors.transparent;
      }
    }),
  );

  static final CheckboxThemeData dark = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: WidgetStateProperty.resolveWith((state){
      if(state.contains(WidgetState.selected)){
        return Colors.white;
      }else{
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((state){
      if(state.contains(WidgetState.selected)){
        return Colors.blue;
      }else{
        return Colors.transparent;
      }
    }),
  );
}