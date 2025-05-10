///@file TOutlinedButtonTheme
///@date 2023-10-01
///@version 1.0.0
///@description creates a singleton class for the outlined button theme
///@description supports light and dark themes
///@note this is just a template for the outlined button theme
///@note modify the properties as needed
///@note you can remove the final keyword when editing to show current changes instantly
import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final light = OutlinedButtonThemeData( 
    style: OutlinedButton.styleFrom( 
      elevation: 0, 
      foregroundColor: Colors.black,
      side: const BorderSide( 
        color: Colors.black,
      ),
      textStyle: const TextStyle( 
        fontSize: 16,
        color: Colors.black ,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric( 
        horizontal: 20,
        vertical: 16,
      ),
      shape: RoundedRectangleBorder( 
        borderRadius: BorderRadius.circular(14),
      ),
    )
  );

  static final dark = OutlinedButtonThemeData( 
    style: OutlinedButton.styleFrom( 
      elevation: 0, 
      foregroundColor: Colors.white,
      side: const BorderSide( 
        color: Colors.blueAccent,
      ),
      textStyle: const TextStyle( 
        fontSize: 16,
        color: Colors.white ,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric( 
        horizontal: 20,
        vertical: 16,
      ),
      shape: RoundedRectangleBorder( 
        borderRadius: BorderRadius.circular(14),
      ),
    )
  );
} 