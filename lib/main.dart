///@file main.dart
///@date 2023-10-01
///@version 1.0.0
///@description Main entry point of the application

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/global_states/initialize_global_state.dart';
import 'package:mobile_app_template/domain/services/authentication/app_authentication_service.dart';
import 'package:mobile_app_template/network/dio/app_dio.dart';
import 'package:mobile_app_template/network/dio/dio_network_client.dart';
import 'package:mobile_app_template/services/local_storage/local_secure_storage.dart';

import 'app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Todo: Init Local Storage
  // Todo: Await Native Splash Screen
  // Todo: Initialize backend
  // Todo: Initalize authentication
  await dotenv.load();

  // iniitialize dio network client
  await AppDio().init();

  // initialize the authentication service
  AppAuthenticationService().init(
    DioNetworkClient(AppDio().dio),
    LocalSecureStorageService()
  );

  //setup up dedendency injection
  await setupDependencyInjection();

  //initialize global states
  await initializeGlobalStates();
  
  runApp(const App());
}