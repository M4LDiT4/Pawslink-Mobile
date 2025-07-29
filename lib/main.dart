///@file main.dart
///@date 2023-10-01
///@version 1.0.0
///@description Main entry point of the application

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/global_states/initialize_global_state.dart';
import 'package:mobile_app_template/core/utils/http/dio_client.dart';
import 'package:mobile_app_template/services/api/authentication.dart';

import 'app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Todo: Init Local Storage
  // Todo: Await Native Splash Screen
  // Todo: Initialize backend
  // Todo: Initalize authentication
  await dotenv.load();

  // Initialize dio client
  await DioHTTPHelper().init();
  
  await TAuthenticationService().init(DioHTTPHelper());

  //setup up dedendency injection
  await setupDependencyInjection();

  //initialize global states
  initializeGlobalStates();
  
  runApp(const App());
}