///@file textfield_theme.dart
///@date 2023-10-01
///@version 1.0.0
///@description creates a singleton class for the textfield theme
///@description supports light and dark themes
///@note this is just a template for the textfield theme
///@note modify the properties as needed
///@note you can remove the final keyword when editing to show current changes instantly

import 'package:flutter/material.dart';

class TTextfieldTheme{
  TTextfieldTheme._();

  static InputDecorationTheme light = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    labelStyle: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 14,
    ),
    hintStyle: const TextStyle().copyWith(
      color: Colors.grey,
      fontSize: 14,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.black.withAlpha((255 * 0.8).toInt())
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide().copyWith( 
        width: 1,
        color: Colors.grey
      )
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide().copyWith( 
        width: 1,
        color: Colors.grey
      )
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide().copyWith( 
        width: 1,
        color: Colors.black12
      )
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide().copyWith( 
        width: 1,
        color: Colors.red
      )
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide().copyWith( 
        width: 1,
        color: Colors.orange
      )
    ),
  );

  static InputDecorationTheme dark = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    labelStyle: const TextStyle().copyWith(
      color: Colors.white,
      fontSize: 14,
    ),
    hintStyle: const TextStyle().copyWith(
      color: Colors.grey,
      fontSize: 14,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.white.withAlpha((255 * 0.8).toInt())
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide().copyWith( 
        width: 1,
        color: Colors.grey
      )
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide().copyWith( 
        width: 1,
        color: Colors.grey
      )
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide().copyWith( 
        width: 1,
        color: Colors.white
      )
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide().copyWith( 
        width: 1,
        color: Colors.red
      )
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide().copyWith( 
        width: 1,
        color: Colors.orange
      )
    ),
  );
}