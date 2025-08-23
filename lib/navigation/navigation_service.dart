import 'package:get/get.dart';
import 'package:flutter/material.dart';
///@file : navigation_service.dart
///@description : helper class for navigation with getx
///@note : you can add methods for special pages that requires different animation
class TNavigationService {

  TNavigationService._();

  /// Navigate to a named route
  static void toNamed(String routeName, {dynamic arguments, Map<String,String>? parameters}) {
    Get.toNamed(routeName, arguments: arguments, parameters: parameters);
  }

  /// Navigate to a widget page
  static void to(Widget page, {Transition transition = Transition.cupertino}) {
    Get.to(() => page, transition: transition);
  }

  /// Replace current route with a new named route
  static void offNamed(String routeName, {dynamic arguments}) {
    Get.offNamed(routeName, arguments: arguments);
  }

  /// Clear all routes and push a named route
  static void offAllNamed(String routeName, {dynamic arguments}) {
    Get.offAllNamed(routeName, arguments: arguments);
  }

  /// Go back to previous screen
  static void back({dynamic result}) {
    Get.back(result: result);
  }

  /// Go back until route is found or only one item in the nav stack remains
  static void until(String routeName){
    Get.until((route){
      return route.settings.name == routeName || route.isFirst;
    });
  }

}
