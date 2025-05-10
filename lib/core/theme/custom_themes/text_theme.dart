///@file text_theme.dart
///@date 2023-10-01
///@version 1.0.0
///@description creates a singleton class for the text theme of the app
///customizable template for text theme with light and dark support 
///@note this is just a template
///@note modify the properties as needed

import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme light = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelLarge:const  TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    displayLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
  
  static TextTheme dark = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    displayLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}