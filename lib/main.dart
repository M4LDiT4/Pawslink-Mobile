///@file main.dart
///@date 2023-10-01
///@version 1.0.0
///@description Main entry point of the application

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app_template/services/api/authentication.dart';

import 'app.dart';
void main() async {
  // Todo: Add widgets binding
  // Todo: Init Local Storage
  // Todo: Await Native Splash Screen
  // Todo: Initialize backend
  // Todo: Initalize authentication
  await dotenv.load();
  await TAuthenticationService().init();
  runApp(const App());
}