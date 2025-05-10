///@file  appbar_theme.dart
///@author Jonathan Calugas
///@date 2023-10-01
///@version 1.0.0
///
///@description creates a singleton class for the appbar theme of the app
///customizable template for appbar theme with light and dark support
///
///@note this is just a template
///@note modify the properties as needed

import 'package:flutter/material.dart';

class TAppbarTheme {

  TAppbarTheme._();

  static const light = AppBarTheme( 
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData( 
      color: Colors.black,
      size: 24
    ),
    actionsIconTheme: IconThemeData( 
      color: Colors.black,
      size: 24
    ),
    titleTextStyle: TextStyle( 
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black
    ),
  );

  static const dark = AppBarTheme( 
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData( 
      color: Colors.black,
      size: 24
    ),
    actionsIconTheme: IconThemeData( 
      color: Colors.white,
      size: 24
    ),
    titleTextStyle: TextStyle( 
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white    ),
  );
}