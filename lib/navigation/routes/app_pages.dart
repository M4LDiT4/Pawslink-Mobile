///@file : app_pages.dart
///@description : centralized page lookup for named routes
///@note: adding pages here requires adding of new names for routes in ./app_routes.dart

import 'package:get/get.dart';
import 'package:mobile_app_template/features/onboarding/presentation/onboarding_screen.dart';
import 'package:mobile_app_template/features/sample_feature/presentation/screens/sample_screen.dart';
import 'package:mobile_app_template/navigation/admin_navigation/admin_home_navigation.dart';

import 'app_routes.dart';

class TAppPages {
  static final routes = [
    GetPage(
      name: TAppRoutes.home,
      page: () => AdminHomeNavigation(),
    ),
    GetPage(
      name: TAppRoutes.profile,
      page: () => const PlaceholderScreen(),
      //optional: provide bindings for screen
    ),
    GetPage(
      name: TAppRoutes.onboarding, 
      page: () => const OnboardingScreen()
    )
  ];
}
