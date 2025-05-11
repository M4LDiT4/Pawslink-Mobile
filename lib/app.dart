/// @file app.dart
/// @date 2023-10-01
/// @version 1.0.0
/// @description
/// This file contains the main application widget for a Flutter app.
/// It sets up the global theming of the application.
/// It also serves as the entry point for the app.
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/theme/theme.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/navigation/routes/app_pages.dart';
import 'package:mobile_app_template/navigation/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pawslink Mobile',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: TAppPages.routes,
      initialRoute: TAppRoutes.login,
    );
  }
}