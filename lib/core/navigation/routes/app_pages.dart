///@file : app_pages.dart
///@description : centralized page lookup for named routes
///@note: adding pages here requires adding of new names for routes in ./app_routes.dart

import 'package:get/get.dart';
import 'package:mobile_app_template/core/bindings/controllers/add_animal.dart';
import 'package:mobile_app_template/features/animal_database/presentation/screens/add_animal/add_animal.dart';
import 'package:mobile_app_template/features/animal_database/presentation/screens/add_animal/add_animal_summary.dart';
import 'package:mobile_app_template/features/animal_database/presentation/screens/view_animal/view_animal.dart';
import 'package:mobile_app_template/features/animal_database/presentation/screens/view_animal_details/view_animal_details.dart';
import 'package:mobile_app_template/features/authentication/presentation/sign_in.dart';
import 'package:mobile_app_template/features/authentication/presentation/sign_up.dart';
import 'package:mobile_app_template/features/onboarding/presentation/onboarding_screen.dart';
import 'package:mobile_app_template/features/onboarding/presentation/splash_screen.dart';
import 'package:mobile_app_template/features/sample_feature/presentation/screens/sample_screen.dart';
import 'package:mobile_app_template/core/navigation/admin_navigation/admin_home_navigation.dart';

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
    ),
    GetPage(
      name: TAppRoutes.login, 
      page: () =>const SignInScreen(),
        transition: Transition.fadeIn, // or slide, zoom, etc.
        transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: TAppRoutes.signup, 
      page: () => const SignUpScreen(),
      transition: Transition.fadeIn, // or slide, zoom, etc.
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: TAppRoutes.addAnimal, 
      page: () => AddAnimalScreeen(),
      transition: Transition.fadeIn, // or slide, zoom, etc.
      transitionDuration: const Duration(milliseconds: 500),
      binding: AddAnimalControllerBinding()
    ),
    GetPage(
      name: TAppRoutes.addAnimalSummary, 
      page: () => AddAnimalSummary(),
      transition: Transition.fadeIn, // or slide, zoom, etc.
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: TAppRoutes.viewAnimal, 
      page: () => const ViewAnimalScreen(),
      transition: Transition.fadeIn, // or slide, zoom, etc.
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: TAppRoutes.splashScreen, 
      page: () => const SplashScreen(),
      transition: Transition.fadeIn
    ),
    GetPage(
      name: TAppRoutes.viewAnimalDetails,   
      page: () => const ViewAnimalDetailsScreen(),
      transition: Transition.leftToRightWithFade
    ),
  ];
}
