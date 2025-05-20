
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mobile_app_template/features/sample_feature/presentation/screens/sample_screen.dart';
import 'package:mobile_app_template/core/navigation/admin_navigation/admin_nav_registry.dart';

class AdminNavigationController {
  final Rx<int> selectedIndex = 0.obs;

  final adminHomeScreens = adminHomeScreenRegistry;

  void setSelectedIndex(int index){
    if(index < adminHomeScreens.length){
      selectedIndex.value = index;
    }
  }

  Widget getCurrentScreen() {
    if(selectedIndex.value >= adminHomeScreens.length){
      return const PlaceholderScreen();
    }
    return adminHomeScreens[selectedIndex.value];
  }
}